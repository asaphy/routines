<?php 
if(isset($_POST['submit'])){
    $to = "iagreewithanthony@gmail.com"; // this is your Email address
    $from = $_POST['email']; // this is the sender's Email address
    $first_name = $_POST['first_name'];
    $subject = "Form submission";
    $message = $first_name . " is interested in: " . $_POST['moreInfo'];

    $headers = "From:" . $from;
    mail($to,$subject,$message,$headers);
    $thankyou = "Mail Sent. Thank you " . $first_name . "! We will be in touch.";
	echo "<script type='text/javascript'>alert('$thankyou');</script>";
    // You can also use header('Location: thank_you.php'); to redirect to another page.
    }
?>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

	<!-- Basic Page Needs
  ================================================== -->
	<meta charset="utf-8">
	<title>I Agree with Anthony</title>
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS
  ================================================== -->
	<link rel="stylesheet" href="stylesheets/base.css">
	<link rel="stylesheet" href="stylesheets/skeleton.css">
	<link rel="stylesheet" href="stylesheets/layout.css">

	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- Favicons
	================================================== -->
	<link rel="shortcut icon" href="images/favicon.ico">
	<link rel="apple-touch-icon" href="images/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">

</head>
<body>



	<!-- Primary Page Layout
	================================================== -->

	<!-- Delete everything in this .container and get started on your own site! -->

	<div class="container">
		<div class="sixteen columns">
			<h1 class="remove-bottom" style="margin-top: 40px">I Agree with Anthony</h1>
			<br/><br/>
		</div>
		<div class="seven columns">
			<img src="images/anthony.png" alt="anthony">
		</div>
		<div class="nine columns">
			<h3>Some question?</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

			<form action="" method="post">
			<div id="first_name_text">First Name: </div><input type="text" id="first_name" name="first_name"><br>
			<div id="email">Email: <input type="email" name="email" id="emailForm"></div>
			<p id="idliketoknow">I'd like to know more about:</p>
			<select  id="moreInfo" name="moreInfo">
			  <option value="Anthony">Anthony</option>
			  <option value="the Event">the Event</option>
			  <option value="Cru">Cru-a Christian community</option>
			  <option value="the meaning of Christianity">What it means to be a Christian</option>
			  <option value="a personal relationship with Jesus">How I have a personal relationship with God</option>
			</select>
			<input type="submit" id="submit_button" name="submit" value="Submit">
			</form>

		</div>
		<div id="footer">
			<h2>September 28, 2014</h2>
			<h3>8PM @ Location Here</h3>
		</div>

	</div><!-- container -->


<!-- End Document
================================================== -->
</body>
</html>