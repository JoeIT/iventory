<?php

class App_Util_MailSender
{
	public function __construct()
	{
		
	}
	
	public function sendMail($to, $subject, $message)
	{
		$headers = '';
		$sendMail = 'C:\xampp\htdocs\zf\sendmail\sendmail.exe -t';

		return mail($to, $subject, $message, $headers, $sendMail);
	}
}

?>