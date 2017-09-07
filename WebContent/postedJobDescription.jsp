<%@ page import="model.DatabaseConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>

<%
	String userFullName = "";
	session = request.getSession(false);
	if (session != null && session.getAttribute("user_type_id") != null) {
		String user_type = session.getAttribute("user_type_id").toString();
		String isProfileFilled = session.getAttribute("isProfileFilled").toString();
		userFullName = session.getAttribute("full_name").toString();
		if (user_type.equals("1")) {
			response.sendRedirect("adminDashboard.jsp");
		} else if (user_type.equals("3")) {
			response.sendRedirect("companyDashboard.jsp");
		}
	}
	
	String job_id = request.getAttribute("job_id").toString();
	String job_title = request.getAttribute("job_title").toString();
	String job_location = request.getAttribute("job_location").toString();
	String event_date = request.getAttribute("event_date").toString();
	String salary_offered = request.getAttribute("salary_offered").toString();
	String eligibility = request.getAttribute("eligibility").toString();
	String role_description = request.getAttribute("role_description").toString();
	String any_note = request.getAttribute("any_note").toString();
	String skills = request.getAttribute("skills").toString();
	String companyName = request.getAttribute("companyName").toString();
	String website = request.getAttribute("website").toString();
	String location = request.getAttribute("location").toString();
	String about_us = request.getAttribute("about_us").toString();
	
	session.setAttribute("last_job_id", job_id);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Posted Job Description</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script type="text/javascript" src="js/dashboards.js"></script>
<script type="text/javascript" src="js/applyJob.js"></script>
</head>
<body>
	<!-- Top container -->
	<div class="w3-container w3-top w3-black w3-large w3-padding"
		style="z-index: 4">
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
				class="fa fa-envelope"></i></a> <a href="studentProfile.jsp"
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
		class="fa fa-remove fa-fw"></i>  Close Menu</a> <a href="studentDashboard.jsp"
		class="w3-padding"><i class="fa fa-users fa-fw"></i>
		Dashboard</a> <a href="companiesHiring.jsp" class="w3-padding w3-blue"><i
		class="fa fa-eye fa-fw"></i> Companies Hiring</a> <a href="appliedJobs.jsp"
		class="w3-padding"><i class="fa fa-users fa-fw"></i> Applied Jobs</a>
	<a href="studentAskQueries.jsp" class="w3-padding"><i
		class="fa fa-bullseye fa-fw"></i> Ask Query</a> <a
		href="studentProfile.jsp" class="w3-padding"><i
		class="fa fa-bullseye fa-fw"></i> Student Profile</a> <br>
	</nav>


	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px; margin-top: 43px;">
		<!-- Header -->
		<header class="w3-container" style="padding-top:22px">
		<h4>
			<b><i></i>Job Description</b>
		</h4>
		</header>
		<!-- STSRTING CODE -->
		<div class="container col-md-11">
			<table class="table table-bordered">

				<tbody>
					<tr class="active">
						<th style="font-weight: bold">Company:</th>
						<th><%=companyName%></th>
					</tr>
					<tr class="active">
						<th style="font-weight: bold">Position:</th>
						<th><%=job_title%></th>
					</tr>
					<tr>
						<th style="font-weight: bold">Job location:</th>
						<th><%=job_location%></th>
					</tr>
					<tr class="active">
						<th style="font-weight: bold">Event date:</th>
						<th><%=event_date%></th>

					</tr>
					<tr>
						<th style="font-weight: bold">Salary offered:</th>
						<th><%=salary_offered%></th>
					</tr>
					<tr class="active">
						<th style="font-weight: bold">Company URL:</th>
						<th><a href="http://<%=website%>"><%=website%></a></th>
					</tr>
				</tbody>
			</table>
			<input type="hidden" id="job_id" value="<%=job_id%>"></input> <br>
			<div>
				<div class="form-group">
					<h4 for="formGroupExampleInput2">Role Description:</h4>
					<textarea type="text" class="form-control" rows="5" readonly><%=role_description%></textarea>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput2">Knowledge and Skills:</label>
					<textarea type="text" class="form-control" rows="1" readonly><%=skills%></textarea>
				</div>

				<div class="form-group">
					<label for="formGroupExampleInput2">Any Note</label>
					<textarea type="text" class="form-control" rows="2" readonly><%=any_note%></textarea>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput2">About Company:</label>
					<textarea type="text" class="form-control" rows="5" readonly><%=about_us%></textarea>
				</div>
			</div>
			<center>
				<button class="btn btn-success" onclick="applyJob()">Apply
					Job</button>
			</center>
			<a href="studentAskQueriesCompany.jsp">Ask Query?</a>
			<center> <inutp id="Apply_job_result"></inutp> </center>
			
			<br> <br>

		</div>
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

