<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Mail\TicketSend;
use App\Models\Ticket;
use App\Models\TicketReply;
use App\Models\User;
use App\Models\Utility;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class TicketController extends Controller
{
    public function index()
    {
        if (\Auth::user()->type == 'company' || \Auth::user()->type == 'em') {
            $countTicket      = Ticket::where('created_by', '=', \Auth::user()->creatorId())->count();
            $countOpenTicket  = Ticket::where('status', '=', 'open')->where('created_by', '=', \Auth::user()->creatorId())->count();
            $countonholdTicket  = Ticket::where('status', '=', 'onhold')->where('created_by', '=', \Auth::user()->creatorId())->count();
            $countCloseTicket = Ticket::where('status', '=', 'close')->where('created_by', '=', \Auth::user()->creatorId())->count();
        }else {
            $countTicket      = Ticket::where('employee_id', '=', \Auth::user()->id)->orWhere('ticket_created', \Auth::user()->id)->count();
            $countOpenTicket  = Ticket::where('status', '=', 'open')->where('employee_id', '=', \Auth::user()->id)->count();
            $countonholdTicket  = Ticket::where('status', '=', 'onhold')->where('employee_id', '=', \Auth::user()->id)->count();
            $countCloseTicket = Ticket::where('status', '=', 'close')->where('employee_id', '=', \Auth::user()->id)->count();
        }

        $arr = [];
        array_push($arr, $countTicket, $countOpenTicket, $countonholdTicket, $countCloseTicket);
        $ticket_arr = json_encode($arr);

        if (\Auth::user()->can('Manage Ticket')) {
            $user = Auth::user();
            if ($user->type == 'employee') {
                $tickets = Ticket::where('employee_id', '=', \Auth::user()->id)->orWhere('ticket_created', \Auth::user()->id)->get();
            } else {
                $tickets = Ticket::select('tickets.*')->join('users', 'tickets.created_by', '=', 'users.id')->where('users.created_by', '=', \Auth::user()->creatorId())->orWhere('tickets.created_by', \Auth::user()->creatorId())->get();
            }

            return view('ticket.index', compact('tickets', 'countTicket', 'countOpenTicket', 'countCloseTicket', 'countonholdTicket', 'ticket_arr'));
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    public function create()
    {
        if (\Auth::user()->can('Create Ticket')) {
            if (\Auth::user()->type != 'employee') {
                $employees = User::where('created_by', '=', \Auth::user()->creatorId())->where('type', '=', 'employee')->get()->pluck('name', 'id');
            } else {
                $employees = User::where('created_by', '=', \Auth::user()->creatorId())->where('type', '=', 'employee')->first();
            }

            return view('ticket.create', compact('employees'));
        } else {
            return response()->json(['error' => __('Permission denied.')], 401);
        }
    }

    public function store(Request $request)
    {
        if (\Auth::user()->can('Create Ticket')) {

            $validator = \Validator::make(
                $request->all(),
                [
                    'title' => 'required',
                    'priority' => 'required',
                    'end_date' => 'required',
                    'employee_id' => 'required',
                ]
            );
            if ($validator->fails()) {
                $messages = $validator->getMessageBag();

                return redirect()->back()->with('error', $messages->first());
            }

            $rand          = date('hms');
            $ticket        = new Ticket();
            $ticket->title = $request->title;
            if (Auth::user()->type == "employee") {
                $ticket->employee_id = \Auth::user()->id;
            } else {
                $ticket->employee_id = $request->employee_id;
            }

            $ticket->priority    = $request->priority;

            $date1 = date("Y-m-d");
            $date2 =  $request->end_date;
            if ($date1 > $date2) {
                return redirect()->back()->with('error', __('Please Select Today or After Date '));
            } else {
                $ticket->end_date = $request->end_date;
            }
            $ticket->ticket_code = $rand;
            $ticket->description = $request->description;

            if (!empty($request->attachment)) {
                $image_size = $request->file('attachment')->getSize();

                $result = Utility::updateStorageLimit(\Auth::user()->creatorId(), $image_size);
                if ($result == 1) {
                    $filenameWithExt = $request->file('attachment')->getClientOriginalName();
                    $filename        = pathinfo($filenameWithExt, PATHINFO_FILENAME);
                    $extension       = $request->file('attachment')->getClientOriginalExtension();
                    $fileNameToStore = $filename . '_' . time() . '.' . $extension;
                    $dir = 'uploads/tickets/';
                    $image_path = $dir . $fileNameToStore;

                    $url = '';
                    $path = Utility::upload_file($request, 'attachment', $fileNameToStore, $dir, []);
                    $ticket->attachment    = !empty($request->attachment) ? $fileNameToStore : '';
                    if ($path['flag'] == 1) {
                        $url = $path['url'];
                    } else {
                        return redirect()->back()->with('error', __($path['msg']));
                    }
                }
            }

            $ticket->ticket_created = \Auth::user()->id;
            $ticket->created_by     = \Auth::user()->creatorId();
            $ticket->status         = $request->status;
            $ticket->save();

            //slack
            $setting = Utility::settings(\Auth::user()->creatorId());
            $emp = User::where('id', $request->employee_id)->first();
            if (isset($setting['ticket_notification']) && $setting['ticket_notification'] == 1) {
                // $msg = ("New Support ticket created of") . ' ' . $request->priority . ' ' . __("priority for") . ' ' . $emp->name . ' ';

                $uArr = [
                    'ticket_priority' => $request->priority,
                    'employee_name' => $emp->name,
                ];
                Utility::send_slack_msg('new_ticket', $uArr);
            }

            //telegram
            $setting = Utility::settings(\Auth::user()->creatorId());
            $emp = User::where('id', $request->employee_id)->first();
            if (isset($setting['telegram_ticket_notification']) && $setting['telegram_ticket_notification'] == 1) {
                // $msg = ("New Support ticket created of") . ' ' . $request->priority . ' ' . __("priority for") . ' ' . $emp->name . ' ';

                $uArr = [
                    'ticket_priority' => $request->priority,
                    'employee_name' => $emp->name,
                ];

                Utility::send_telegram_msg('new_ticket', $uArr);
            }

            // twilio 
            $setting = Utility::settings(\Auth::user()->creatorId());
            $emp = Employee::where('user_id', $request->employee_id)->first();
            if (isset($setting['twilio_ticket_notification']) && $setting['twilio_ticket_notification'] == 1) {
                // $msg = ("New Support ticket created of") . ' ' . $request->priority . ' ' . __("priority for") . ' ' . $emp->name . ' ';

                $uArr = [
                    'ticket_priority' => $request->priority,
                    'employee_name' => $emp->name,
                ];

                Utility::send_twilio_msg($emp->phone, 'new_ticket', $uArr);
            }

            $setings = Utility::settings();

            if ($setings['new_ticket'] == 1) {
                $employee = Employee::where('user_id', '=', $ticket->employee_id)->first();

                $uArr = [
                    'ticket_title' => $ticket->title,
                    'ticket_name'  => $employee->name,
                    'ticket_code' => $rand,
                    'ticket_description' => $request->description,
                ];

                $resp = Utility::sendEmailTemplate('new_ticket', [$employee->email], $uArr);
                // return redirect()->route('ticket.index')->with('success', __('Ticket successfully created.') . ((!empty($resp) && $resp['is_success'] == false && !empty($resp['error'])) ? '<br> <span class="text-danger">' . $resp['error'] . '</span>' : ''));
            }

            //webhook
            $module = 'New Ticket';
            $webhook =  Utility::webhookSetting($module);
            if ($webhook) {
                $parameter = json_encode($ticket);
                // 1 parameter is  URL , 2 parameter is data , 3 parameter is method
                $status = Utility::WebhookCall($webhook['url'], $parameter, $webhook['method']);
                if ($status == true) {
                    return redirect()->route('ticket.index')->with('success', __('Ticket successfully created.') . ((!empty($resp) && $resp['is_success'] == false && !empty($resp['error'])) ? '<br> <span class="text-danger">' . $resp['error'] . '</span>' : ''));
                } else {
                    return redirect()->back()->with('error', __('Webhook call failed.'));
                }
            }

            return redirect()->route('ticket.index')->with('success', __('Ticket successfully created.') . ((!empty($resp) && $resp['is_success'] == false && !empty($resp['error'])) ? '<br> <span class="text-danger">' . $resp['error'] . '</span>' : ''));
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    public function show(Ticket $ticket)
    {
        return redirect()->route('ticket.index');
    }

    public function edit($ticket)
    {
        $ticket = Ticket::find($ticket);
        if (\Auth::user()->can('Edit Ticket')) {
            $employees = User::where('created_by', '=', \Auth::user()->creatorId())->where('type', '=', 'employee')->get()->pluck('name', 'id');

            return view('ticket.edit', compact('ticket', 'employees'));
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    public function update(Request $request, $ticket)
    {

        $ticket = Ticket::find($ticket);
        if (\Auth::user()->can('Edit Ticket')) {
            $validator = \Validator::make(
                $request->all(),
                [
                    'priority' => 'required',
                    'end_date' => 'required',
                ]
            );
            if ($validator->fails()) {
                $messages = $validator->getMessageBag();

                return redirect()->back()->with('error', $messages->first());
            }


            $ticket->title = $request->title;
            if (Auth::user()->type == "employee") {
                $ticket->employee_id = \Auth::user()->id;
            } else {
                $ticket->employee_id = $request->employee_id;
            }
            $ticket->priority    = $request->priority;
            $ticket->end_date    = $request->end_date;
            $ticket->description = $request->description;

            if (!empty($request->attachment)) {

                //storage limit
                $dir = 'uploads/tickets/';
                $file_path = $dir . $ticket->attachment;
                $image_size = $request->file('attachment')->getSize();
                $result = Utility::updateStorageLimit(\Auth::user()->creatorId(), $image_size);

                if ($result == 1) {
                    Utility::changeStorageLimit(\Auth::user()->creatorId(), $file_path);
                    $filenameWithExt = $request->file('attachment')->getClientOriginalName();
                    $filename        = pathinfo($filenameWithExt, PATHINFO_FILENAME);
                    $extension       = $request->file('attachment')->getClientOriginalExtension();
                    $fileNameToStore = $filename . '_' . time() . '.' . $extension;
                    $dir = 'uploads/tickets/';
                    $image_path = $dir . $fileNameToStore;

                    $url = '';
                    $path = Utility::upload_file($request, 'attachment', $fileNameToStore, $dir, []);
                    $ticket->attachment = !empty($request->attachment) ? $fileNameToStore : '';
                    if ($path['flag'] == 1) {
                        $url = $path['url'];
                    } else {
                        return redirect()->back()->with('error', __($path['msg']));
                    }
                }
            }

            $ticket->status      = $request->status;
            $ticket->save();

            return redirect()->route('ticket.index', compact('ticket'))->with('success', __('Ticket successfully updated.'));
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    public function destroy(Ticket $ticket)
    {
        if (\Auth::user()->can('Delete Ticket')) {
            if ($ticket->created_by == \Auth::user()->creatorId()) {
                $ticket->delete();
                $ticketId = TicketReply::select('id')->where('ticket_id', $ticket->id)->get()->pluck('id');
                $reply = TicketReply::whereIn('id', $ticketId)->get();
                TicketReply::whereIn('id', $ticketId)->delete();

                if (!empty($ticket->attachment)) {

                    //storage limit
                    $file_path = 'uploads/tickets/' . $ticket->attachment;
                    $result = Utility::changeStorageLimit(\Auth::user()->creatorId(), $file_path);
                }

                foreach ($reply as $key => $value) {
                    if (!empty($value->attachment)) {

                        //storage limit
                        $file_path = 'uploads/tickets/' . $value->attachment;
                        $result = Utility::changeStorageLimit(\Auth::user()->creatorId(), $file_path);
                    }
                }

                return redirect()->route('ticket.index')->with('success', __('Ticket successfully deleted.'));
            } else {
                return redirect()->back()->with('error', __('Permission denied.'));
            }
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    public function reply($ticket)
    {
        $ticketreply = TicketReply::where('ticket_id', '=', $ticket)->orderBy('id', 'DESC')->get();
        $ticket      = Ticket::find($ticket);
        if (\Auth::user()->type == 'employee') {
            $ticketreplyRead = TicketReply::where('ticket_id', $ticket->id)->where('created_by', '!=', \Auth::user()->id)->update(['is_read' => '1']);
        } else {
            $ticketreplyRead = TicketReply::where('ticket_id', $ticket->id)->where('created_by', '!=', \Auth::user()->creatorId())->update(['is_read' => '1']);
        }

        return view('ticket.reply', compact('ticket', 'ticketreply'));
    }

    public function changereply(Request $request)
    {
        $validator = \Validator::make(
            $request->all(),
            [
                'description' => 'required',
            ]
        );
        if ($validator->fails()) {
            $messages = $validator->getMessageBag();

            return redirect()->back()->with('error', $messages->first());
        }

        $ticket = Ticket::find($request->ticket_id);

        $ticket_reply              = new TicketReply();
        $ticket_reply->ticket_id   = $request->ticket_id;
        $ticket_reply->employee_id = $ticket->employee_id;
        $ticket_reply->description = $request->description;

        if (!empty($request->attachment)) {
            $image_size = $request->file('attachment')->getSize();

            $result = Utility::updateStorageLimit(\Auth::user()->creatorId(), $image_size);
            if ($result == 1) {
                $filenameWithExt = $request->file('attachment')->getClientOriginalName();
                $filename        = pathinfo($filenameWithExt, PATHINFO_FILENAME);
                $extension       = $request->file('attachment')->getClientOriginalExtension();
                $fileNameToStore = $filename . '_' . time() . '.' . $extension;
                $dir = 'uploads/tickets/';
                $image_path = $dir . $fileNameToStore;

                $url = '';
                $path = Utility::upload_file($request, 'attachment', $fileNameToStore, $dir, []);
                $ticket_reply->attachment    = !empty($request->attachment) ? $fileNameToStore : '';
                if ($path['flag'] == 1) {
                    $url = $path['url'];
                } else {
                    return redirect()->back()->with('error', __($path['msg']));
                }
            }
        }

        if (\Auth::user()->type == 'employee') {
            $ticket_reply->created_by = Auth::user()->id;
        } else {
            $ticket_reply->created_by = Auth::user()->id;
        }

        $ticket_reply->save();

        return redirect()->route('ticket.reply', $ticket_reply->ticket_id)->with('success', __('Ticket Reply successfully Send.'));
    }
}
