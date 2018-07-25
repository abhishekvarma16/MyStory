<?php	
	
	
	$input_1932 = $_POST['input_1932'];
	$input_2229 = $_POST['input_2229'];
	$input_996 = $_POST['input_996'];
	$input_1103 = $_POST['input_1103'];
	
	$to = 'receiver@yoursite.com'; // Email submissions are sent to this email

	// Create email	
	$email_subject = "Message from a Blocs website.";
	$email_body = "You have received a new message. \n\n".
				  "Input_1932: $input_1932 \nInput_2229: $input_2229 \nInput_996: $input_996 \nInput_1103: $input_1103 \n";
	$headers = "MIME-Version: 1.0\r\nContent-type: text/plain; charset=UTF-8\r\n";	
	$headers .= "From: contact@yoursite.com\n";
	$headers .= "Reply-To: DoNotReply@yoursite.com";	
	
	mail($to,$email_subject,$email_body,$headers); // Post message
	return true;			
?>