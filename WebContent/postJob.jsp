<%@ page import="model.DatabaseConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>

<%
	String userFullName = "";
	session = request.getSession(false);
	if (session != null && session.getAttribute("user_type_id") != null) {
		String user_type = session.getAttribute("user_type_id").toString();
		String user_id = session.getAttribute("user_id").toString();
		userFullName = session.getAttribute("full_name").toString();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Post Job</title>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>


<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}

.light:hover {
	background: white;
	color: black;
}
</style>
</head>
<body>

	<!-- Top container -->
	<div class="w3-container w3-top w3-black w3-large w3-padding"
		style="z-index: 4">
		<button class="w3-btn w3-hide-large w3-padding-0 w3-hover-text-grey"
			onclick="w3_open();">
			<i class="fa fa-bars"></i>  Menu
		</button>
		<span class="w3-left" style="display: inline-block;">JNTUH
			Student Placements Portal</span> <a href="Logout" class="w3-right light">Logout</a>
	</div>

	<!-- Sidenav/menu -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left"
		style="z-index:3;width:300px;" id="mySidenav"> <br>
	<div class="w3-container w3-row">
		<div class="w3-col s4">
			<img src="/w3images/avatar2.png" class="w3-circle w3-margin-right"
				style="width: 46px">
		</div>
		<div class="w3-col s8">
			<span>Welcome, <strong><%=userFullName%></strong></span><br> <a
				href="#"
				class="w3-hover-none w3-hover-text-red w3-show-inline-block"><i
				class="fa fa-envelope"></i></a> <a href="companyProfile.jsp"
				id="nav_profile_button"
				class="w3-hover-none w3-hover-text-green w3-show-inline-block"><i
				class="fa fa-user"></i></a> <a href="#"
				class="w3-hover-none w3-hover-text-blue w3-show-inline-block"><i
				class="fa fa-cog"></i></a>
		</div>
	</div>
	<hr>
	<div class="w3-container">
		<h3>Menu</h3>
	</div>
	<a href="#"
		class="w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
		onclick="w3_close()" title="close menu"><i
		class="fa fa-remove fa-fw"></i>  Close Menu</a> <a
		href="companyDashboard.jsp" class="w3-padding"><i
		class="fa fa-users fa-fw"></i>  Dashboard</a> <a href="#"
		class="w3-padding  w3-blue"><i class="fa fa-eye fa-fw"></i>  Post
		Job</a> <a href="listOfPostedJobs.jsp" class="w3-padding"><i class="fa fa-bullseye fa-fw"></i> 
		Applied Students</a> <a href="companyListOfQueries.jsp" class="w3-padding"><i
		class="fa fa-diamond fa-fw"></i>  Queries</a> <br>
	<br>
	</nav>


	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px; margin-top: 43px;">

		<!-- Header -->
		<header class="w3-container" style="padding-top:22px">
		<h5>
			<h3>Post Job</h3>
		</h5>
		</header>

		<!--Start your code from here-->

		<form class="w3-container" style="padding-top: 22px" method="post"
			action="PostJob">
			<div class="form-group">
				<label for="formGroupExampleInput">Job Title<sup
					style="color: red">*</sup></label> <input type="text" name="job_title"
					class="form-control" placeholder="eg: Java Developer" required>
			</div>
			<div class="form-group">
				<label for="formGroupExampleInput2">Job Location<sup
					style="color: red">*</sup></label> <input type="text" class="form-control"
					name="job_location" placeholder="eg: Hyderabad" required>
			</div>

			<div class="form-group">
				<label for="formGroupExampleInput2">Event Date<sup
					style="color: red">*</sup></label> <input type="date" class="form-control"
					name="job_evenet_date" placeholder="eg: 10/01/2017" required>
			</div>

			<div class="form-group">
				<label for="formGroupExampleInput2">Salary Offered<sup
					style="color: red">*</sup></label> <input type="text" class="form-control"
					name="job_sal_offered"
					placeholder="eg: 2,40,000/- to 3,20,000/- OR 3,20,000/-" required>
			</div>

			<div class="form-group">
				<label for="formGroupExampleInput2">Eligibility<sup
					style="color: red">*</sup></label>
				<textarea type="text" class="form-control" rows="8"
					name="eligibility" placeholder="eg: 1.Btech should be 65% "
					required></textarea>
			</div>

			<div class="form-group">
				<label for="formGroupExampleInput2">Role Description<sup
					style="color: red">*</sup></label>
				<textarea type="text" class="form-control" rows="3" name="role_desc"
					placeholder="eg: You should be able to handle the development of software by software development process"
					required></textarea>
			</div>

			<div class="form-group">
				<label for="formGroupExampleInput2">Knowledge & Skills<sup
					style="color: red">*</sup></label> <input type="text" class="form-control"
					name="skills" placeholder="eg: Java, Android, C, C++" required>
			</div>

			<div class="form-group">
				<label for="formGroupExampleInput2">Any Notes</label> <input
					type="text" class="form-control" name="any_note"
					placeholder="eg:Should be welling to work all over the world">
			</div>

			<!-- <button type="button" class="btn btn-success">Post Job!</button> -->
			<button type="submit" class="btn btn-success btn-block">Post
				Job!</button>
		</form>
		<br>

		<!-- End your code here  -->

		<!-- Footer -->
		<footer class="w3-container w3-padding-16 w3-light-grey">
		<h4>Contact Us</h4>
		<p>
			Powered by <a href="http://www.monkeycoderz.com" target="_blank">@MonkeyCoderz</a>
		</p>
		</footer>

		<!-- End page content -->
	</div>

	<script>
		// Get the Sidenav
		var mySidenav = document.getElementById("mySidenav");

		// Get the DIV with overlay effect
		var overlayBg = document.getElementById("myOverlay");

		// Toggle between showing and hiding the sidenav, and add overlay effect
		function w3_open() {
			if (mySidenav.style.display === 'block') {
				mySidenav.style.display = 'none';
				overlayBg.style.display = "none";
			} else {
				mySidenav.style.display = 'block';
				overlayBg.style.display = "block";
			}
		}

		// Close the sidenav with the close button
		function w3_close() {
			mySidenav.style.display = "none";
			overlayBg.style.display = "none";
		}
	</script>

</body>
</html>

