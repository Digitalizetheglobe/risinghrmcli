<!DOCTYPE html>
<html>
<head>
    <title>Employee Clock In Notification</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; }
        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
        .header { background-color: #f8f9fa; padding: 10px; text-align: center; }
        .content { padding: 20px; }
        .footer { margin-top: 20px; font-size: 12px; color: #6c757d; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Employee Clock In Notification</h2>
        </div>
        
        <div class="content">
            <p>Hello,</p>
            
            <p><strong><?php echo e($details['employee_name']); ?></strong> has clocked in at <strong><?php echo e($details['clock_in_time']); ?></strong> on <strong><?php echo e($details['date']); ?></strong>.</p>
        </div>
        
        <div class="footer">
            <p>This is an automated notification. Please do not reply to this email.</p>
        </div>
    </div>
</body>
</html><?php /**PATH C:\xampp\htdocs\hrm\resources\views/emails/clock_in_notification.blade.php ENDPATH**/ ?>