<?php

// app/Models/DailyQuote.php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DailyQuote extends Model
{
    use HasFactory;

    protected $fillable = ['quote'];
}
