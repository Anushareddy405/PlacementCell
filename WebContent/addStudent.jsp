<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Students</title>

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
			<span>Welcome, <strong>Admin</strong></span><br> <a href="adminListOfQueries.jsp"
				class="w3-hover-none w3-hover-text-red w3-show-inline-block"><i
				class="fa fa-envelope"></i></a>  <a href="#"
				class="w3-hover-none w3-hover-text-blue w3-show-inline-block"><i
				class="fa fa-cog"></i></a>
		</div>
	</div>
	<hr>
	<div class="w3-container">
		<h3>Menu</h3>
	</div>
	<a href="adminDashboard.jsp" class="w3-padding"><i
		class="fa fa-users fa-fw"></i>  Dashboard</a> <a
		href="adminListOfQueries.jsp" class="w3-padding"><i
		class="fa fa-eye fa-fw"></i>  Check Queries</a> <a href="#"
		class="w3-padding w3-blue"><i class="fa fa-history fa-fw"></i> Add
		Student</a> <a href="listOfCompanies.jsp" class="w3-padding"><i
		class="fa fa-history fa-fw"></i> List of Companies</a> <br>
	<br>
	</nav>

	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px; margin-top: 43px;">
		<header class="w3-container" style="padding-top:22px">
		<h5>
			<b>Add Student</b>
		</h5>
		</header>
		<form class="w3-container" style="padding-top: 22px"
			action="UploadStudentList" method="post"
			enctype="multipart/form-data">
			<!-- <div class="form-group">
				<label for="formGroupExampleInput">Student Name<sup
					style="color: red">*</sup></label> <input type="text" class="form-control"
					id="formGroupExampleInput" placeholder="eg: Rajinikanth">
			</div>

			<div class="form-group">
				<label for="formGroupExampleInput">Student Roll Number<sup
					style="color: red">*</sup></label> <input type="text" class="form-control"
					id="formGroupExampleInput" placeholder="eg: 16031J0055">
			</div>

			<div class="form-group">
				<label for="formGroupExampleInput">Password<sup
					style="color: red">*</sup></label> <input type="text" class="form-control"
					id="formGroupExampleInput" placeholder="eg:*************">
			</div>
			<button type="submit" class="btn btn-success btn-block">Submit</button>
			<hr>
			<label style="text-align: center; width: 100%">Or</label>
			<hr> -->

			<div class="form-group">
				<label>Upload Excell<sup style="color: red">*</sup></label> <input
					type="file" accept="csv" name="file" class="form-control"
					placeholder="eg: student.csv">
			</div>
			<input type="submit" class="btn btn-success btn-block"
				value="Upload!" />
		</form>
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
