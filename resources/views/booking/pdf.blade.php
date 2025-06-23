@php
    $logo = asset(Storage::url('uploads/logo/'));
    $company_logo = Utility::get_company_logo();
@endphp

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ __('Booking Form') }}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            font-size: 12px;
        }
        .invoice {
            max-width: 100%;
            margin: 0 auto;
            padding: 10px;
        }
        .invoice-title {
            text-align: center;
            margin-bottom: 10px;
        }
        .invoice-number {
            text-align: right;
            margin-bottom: 10px;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
            page-break-inside: avoid;
        }
        .table th, .table td {
            padding: 6px;
            border: 1px solid #ddd;
            font-size: 11px;
        }
        .table th {
            background-color: #f2f2f2;
            text-align: left;
        }
        .text-right {
            text-align: right;
        }
        .text-center {
            text-align: center;
        }
        .section-title {
            background-color: #f2f2f2;
            padding: 6px;
            margin-top: 10px;
            margin-bottom: 5px;
            font-weight: bold;
            font-size: 12px;
        }
        .row {
            display: flex;
            flex-wrap: wrap;
            margin-right: -5px;
            margin-left: -5px;
        }
        .col-md-6 {
            flex: 0 0 50%;
            max-width: 50%;
            padding-right: 5px;
            padding-left: 5px;
        }
        .col-md-4 {
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
            padding-right: 5px;
            padding-left: 5px;
        }
        .col-md-3 {
            flex: 0 0 25%;
            max-width: 25%;
            padding-right: 5px;
            padding-left: 5px;
        }
        .address {
            margin-bottom: 10px;
        }
        .font-bold {
            font-weight: bold;
        }
        .page-break {
            page-break-after: always;
        }
        hr {
            margin-top: 5px;
            margin-bottom: 5px;
            border: 0;
            border-top: 1px solid #eee;
        }
        .logo {
            max-height: 50px;
        }
        .payment-detail {
            word-break: break-all;
        }
    </style>
</head>
<body>
    <div class="modal-body">
       

        <div class="invoice" id="printableArea">
            <div class="invoice-print">
                <div class="row">
                    <div class="col-lg-12">
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                            <!-- Left Logo -->
                            <div style="flex: 1;">
                                <img src="{{ $logo.'/logo.svg' }}" alt="Company Logo" style="height: 101px; width: 101px;">
                            </div>
                            
                            <!-- Center Title -->
                            <div style="flex: 1; text-align: center;">
                                <h2 style="margin: 0;">{{ __('Booking Form') }}</h2>
                            </div>
                            
                            <!-- Right Button -->
                            <div style="flex: 1; text-align: right;">
                                <a href="#" class="btn btn-sm btn-primary" onclick="saveAsPDF()" style="background-color: #0d6efd; color: white; padding: 5px 10px; text-decoration: none; border-radius: 4px;">
                                    <span>{{ __('Download') }}</span>
                                </a>
                            </div>
                        </div>
                    </div>

                        <hr>
                        
                        <!-- Employee Information -->
                        @if($booking->employee_name)
                        <div class="section-title">{{ __('Employee Information') }}</div>
                        <div class="row">
                            <div class="col-md-6">
                                <address>
                                    <strong>{{ __('Employee Name') }}:</strong> {{ $booking->employee_name }}<br>
                                </address>
                            </div>
                        </div>
                        @endif
                        
                        <!-- Project & Unit Information -->
                        <div class="section-title">{{ __('Project & Unit Information') }}</div>
                        <div class="row">
                            <div class="col-md-4">
                                <address>
    <strong>{{ __('Project') }}:</strong> {{ $booking->project->project_name ?? $booking->project_name ?? 'No project specified' }}<br>
    <strong>{{ __('Unit') }}:</strong> {{ $booking->unit->unit_name ?? $booking->unit_name ?? 'No unit specified' }}<br>
</address>
                            </div>
                            <div class="col-md-4">
                                <address>
                                    <strong>{{ __('Unit Size') }}:</strong> {{ $booking->unit_size }} sq.ft<br>
                                    <strong>{{ __('Booking Date') }}:</strong> {{ \Auth::user()->dateFormat($booking->booking_date) }}<br>
                                </address>
                            </div>
                        </div>
                        
                        <!-- Primary Applicant Details -->
                        <div class="section-title">{{ __('Primary Applicant Details') }}</div>
                        <div class="row">
                            <div class="col-md-4">
                                <address>
                                    <strong>{{ __('Name') }}:</strong> {{ $booking->primary_applicant_name }}<br>
                                    <strong>{{ __('Contact No') }}:</strong> {{ $booking->primary_applicant_contact_no }}<br>
                                    <strong>{{ __('Email') }}:</strong> {{ $booking->primary_applicant_email }}<br>
                                </address>
                            </div>
                            <div class="col-md-4">
                                <address>
                                    <strong>{{ __('Occupation') }}:</strong> {{ $booking->primary_applicant_occupation }}<br>
                                    <strong>{{ __('Company') }}:</strong> {{ $booking->primary_applicant_company }}<br>
                                    <strong>{{ __('Designation') }}:</strong> {{ $booking->primary_applicant_designation }}<br>
                                </address>
                            </div>
                            <div class="col-md-4">
                                <address>
                                    <strong>{{ __('Birth Date') }}:</strong> {{ \Auth::user()->dateFormat($booking->primary_applicant_birth_date) }}<br>
                                    <strong>{{ __('Nationality') }}:</strong> {{ $booking->primary_applicant_nationality }}<br>
                                    <strong>{{ __('PAN No') }}:</strong> {{ $booking->primary_applicant_pan_no }}<br>
                                    <strong>{{ __('Aadhar No') }}:</strong> {{ $booking->primary_applicant_aadhar_no }}<br>
                                </address>
                            </div>
                        </div>
                        
                        <!-- Secondary Applicant Details -->
                        @if($booking->secondary_applicant_name)
                        <div class="section-title">{{ __('Secondary Applicant Details') }}</div>
                        <div class="row">
                            <div class="col-md-4">
                                <address>
                                    <strong>{{ __('Name') }}:</strong> {{ $booking->secondary_applicant_name }}<br>
                                    <strong>{{ __('Contact No') }}:</strong> {{ $booking->secondary_applicant_contact_no }}<br>
                                    <strong>{{ __('Email') }}:</strong> {{ $booking->secondary_applicant_email }}<br>
                                </address>
                            </div>
                            <div class="col-md-4">
                                <address>
                                    <strong>{{ __('Occupation') }}:</strong> {{ $booking->secondary_applicant_occupation }}<br>
                                    <strong>{{ __('Company') }}:</strong> {{ $booking->secondary_applicant_company }}<br>
                                    <strong>{{ __('Designation') }}:</strong> {{ $booking->secondary_applicant_designation }}<br>
                                </address>
                            </div>
                            <div class="col-md-4">
                                <address>
                                    <strong>{{ __('Birth Date') }}:</strong> {{ \Auth::user()->dateFormat($booking->secondary_applicant_birth_date) }}<br>
                                    <strong>{{ __('Nationality') }}:</strong> {{ $booking->secondary_applicant_nationality }}<br>
                                    <strong>{{ __('PAN No') }}:</strong> {{ $booking->secondary_applicant_pan_no }}<br>
                                    <strong>{{ __('Aadhar No') }}:</strong> {{ $booking->secondary_applicant_aadhar_no }}<br>
                                </address>
                            </div>
                        </div>
                        @endif
                        
                        <!-- Property Details -->
                        <div class="section-title">{{ __('Property Details') }}</div>
                        <div class="row">
                            <div class="col-md-6">
                                <address>
                                    <strong>{{ __('Plot Area') }}:</strong> {{ $booking->plot_area }} sq.ft<br>
                                    <strong>{{ __('Carpet Area') }}:</strong> {{ $booking->carpet_area }} sq.ft<br>
                                </address>
                            </div>
                            <!-- <div class="col-md-4">
                                <address>
                                    <strong>{{ __('Rate per sq.ft') }}:</strong> {{ \Auth::user()->priceFormat($booking->rate_per_sq_ft) }}<br>
                                </address>
                            </div> -->
                        </div>
                        
                        <!-- Cost Breakdown -->
                        <div class="section-title">{{ __('Cost Breakdown') }}</div>
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>{{ __('Rate per sq.ft') }}</td>
                                        <td class="text-right">{{ \Auth::user()->priceFormat($booking->rate_per_sq_ft) }}</td>
                                    </tr>
                                    <tr>
                                        <td>{{ __('Basic Cost Towards Plot/Unit') }}</td>
                                        <td class="text-right">{{ \Auth::user()->priceFormat($booking->basic_cost) }}</td>
                                    </tr>
                                    <tr>
                                        <td>{{ __('Cost Towards Infrastructure') }}</td>
                                        <td class="text-right">{{ \Auth::user()->priceFormat($booking->cost_infrastructure) }}</td>
                                    </tr>
                                    <tr>
                                        <td>{{ __('GST') }}</td>
                                        <td class="text-right">{{ \Auth::user()->priceFormat($booking->gst) }}</td>
                                    </tr>
                                    <tr>
                                        <td>{{ __('Stamp Duty') }}</td>
                                        <td class="text-right">{{ \Auth::user()->priceFormat($booking->stamp_duty) }}</td>
                                    </tr>
                                    <tr>
                                        <td>{{ __('Registration') }}</td>
                                        <td class="text-right">{{ \Auth::user()->priceFormat($booking->registration) }}</td>
                                    </tr>
                                    <tr>
                                        <td>{{ __('Other Charges') }}</td>
                                        <td class="text-right">{{ \Auth::user()->priceFormat($booking->other) }}</td>
                                    </tr>
                                    <tr>
                                        <td>{{ __('Maintenance Cost') }}</td>
                                        <td class="text-right">{{ \Auth::user()->priceFormat($booking->maintenance_cost) }}</td>
                                    </tr>
                                    <tr class="font-bold">
                                        <td>{{ __('Total Cost') }}</td>
                                        <td class="text-right">{{ \Auth::user()->priceFormat($booking->total_cost) }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <!-- Payment Summary -->
                        <div class="section-title">{{ __('Payment Summary') }}</div>
                        <div class="row">
                            <div class="col-md-4">
                                <address>
                                    <strong>{{ __('Total Cost') }}:</strong> {{ \Auth::user()->priceFormat($booking->total_cost) }}<br>
                                    <!-- <strong>{{ __('Total Paid') }}:</strong> {{ \Auth::user()->priceFormat($booking->total_paid) }}<br> -->
                                    <strong>{{ __('Remaining Amount') }}:</strong> {{ \Auth::user()->priceFormat($booking->remaining) }}<br>
                                </address>
                            </div>
                        </div>
                        
                        <!-- Payment Details -->
                        @if($booking->payment_data)
                        @php
                            $payments = is_string($booking->payment_data)
                                ? json_decode($booking->payment_data, true)
                                : $booking->payment_data;
                        @endphp
                            <div class="section-title">{{ __('Payment Transactions') }}</div>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>{{ __('#') }}</th>
                                            <th>{{ __('Mode') }}</th>
                                            <th>{{ __('Date') }}</th>
                                            <th>{{ __('Transaction Details') }}</th>
                                            <th class="text-right">{{ __('Amount') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($payments as $index => $payment)
                                        <tr>
                                            <td>{{ $index + 1 }}</td>
                                            <td>{{ ucfirst($payment['mode_of_payment']) }}</td>
                                            <td>{{ \Auth::user()->dateFormat($payment['date']) }}</td>
                                            <td class="payment-detail">
                                                @if($payment['mode_of_payment'] !== 'cash' && isset($payment['payment_detail']))
                                                    {{ $payment['payment_detail'] }}
                                                @else
                                                    -
                                                @endif
                                            </td>
                                            <td class="text-right">{{ \Auth::user()->priceFormat($payment['amount']) }}</td>
                                        </tr>
                                        @endforeach
                                        <tr class="font-bold">
                                            <td colspan="4">{{ __('Total Paid') }}</td>
                                            <td class="text-right">{{ \Auth::user()->priceFormat(array_sum(array_column($payments, 'amount'))) }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="{{ asset('js/html2pdf.bundle.min.js') }}"></script>
    <script>
        function saveAsPDF() {
            var element = document.getElementById('printableArea');
            var opt = {
                margin: 0.3,
                filename: 'Booking_Form_{{ $booking->primary_applicant_name }}',
                image: {
                    type: 'jpeg',
                    quality: 1
                },
                html2canvas: {
                    scale: 4,
                    dpi: 72,
                    letterRendering: true
                },
                jsPDF: {
                    unit: 'in',
                    format: 'A4',
                    orientation: 'portrait'
                }
            };
            html2pdf().set(opt).from(element).save();
        }
    </script>
</body>
</html>