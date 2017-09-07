<%@ page import="model.DatabaseConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String userFullName = "";
	session = request.getSession(false);
	if (session != null && session.getAttribute("user_type_id") != null) {
		String user_type = session.getAttribute("user_type_id").toString();
		userFullName = session.getAttribute("full_name").toString();
		if (user_type.equals("2")) {
			response.sendRedirect("studentDashboard.jsp");
		} else if (user_type.equals("1")) {
			response.sendRedirect("adminDashboard.jsp");
		}
	}
	String companyName = "";
	String employeeId = "";
	String emailid = "";
	String mobile_no = "";
	String website = "";
	String location = "";
	String about_us = "";
	String user_id = session.getAttribute("user_id").toString();
	String getCompanyprofile = "select * from user where user_id =" + user_id + ";";
	ResultSet mResultSet = (ResultSet) DatabaseConnector.getResultSet(getCompanyprofile, 1);
	try {
		if (mResultSet.next()) {
			companyName = mResultSet.getString("name");
			employeeId = mResultSet.getString("username");
			emailid = mResultSet.getString("email");
			mobile_no = mResultSet.getString("mobile_no");
			website = mResultSet.getString("website");
			location = mResultSet.getString("location");
			about_us = mResultSet.getString("about_us");
		}
	} catch (Exception e) {

	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Company Profile</title>


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
				href="#" id="nav_profile_button" title="Profile"
				class="w3-hover-none w3-hover-text-green w3-show-inline-block"><i
				class="fa fa-user"></i></a> <a href="#"
				class="w3-hover-none w3-hover-text-blue w3-show-inline-block"
				title="Change Password"><i class="fa fa-cog"></i></a>
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
		href="companyDashboard.jsp" class="w3-padding "><i
		class="fa fa-users fa-fw"></i>  Dashboard</a> <a href="#"
		class="w3-padding"><i class="fa fa-eye fa-fw"></i>  Companies
		Hiring</a> <a href="#" class="w3-padding"><i class="fa fa-users fa-fw"></i> 
		Applied Jobs</a> <a href="queries.jsp" class="w3-padding"><i
		class="fa fa-bullseye fa-fw"></i> Ask Query</a> <a href="#"
		class="w3-padding w3-blue"><i class="fa fa-bullseye fa-fw"></i>
		Company Profile</a> <br>
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
			<h2>Company Profile</h2>
		</h5>
		</header>

		<!--Start your code from here-->

		<form class="w3-container" style="padding-top: 22px"
			action="CompanyProfile" method="post">
			<div class="form-group">
				<label for="formGroupExampleInput">Company Name<sup
					style="color: red">*</sup></label> <input type="text" class="form-control"
					name="company_name" value="<%=companyName%>"
					placeholder="eg : ApptoZee Innovations Pvt. Ltd." readonly>
			</div>
			<div class="form-group">
				<label for="formGroupExampleInput">Employee Id<sup
					style="color: red">*</sup></label> <input type="text" class="form-control"
					name="employee_id" value="<%=employeeId%>"
					placeholder="eg: atz000547" readonly>
			</div>
			<div class="form-group">
				<label for="formGroupExampleInput">Email id<sup
					style="color: red">*</sup></label> <input type="text" class="form-control"
					name="email_id" placeholder="eg: aj@apptozee.com" value="<%=emailid %>" required>
			</div>

			<div class="form-group">
				<label>Mobile Number<sup style="color: red">*</sup></label> <input
					type="text" class="form-control" name="mobile_no"
					placeholder="eg: 040-23056644"  value="<%=mobile_no %>" required>
			</div>
			<div class="form-group">
				<label>Website<sup style="color: red">*</sup></label> <input
					type="text" class="form-control" name="website"
					placeholder="eg: www.apptozee.com"  value="<%=website %>" required>
			</div>
			<div class="form-group">
				<label>Location<sup style="color: red">*</sup></label> <input
					type="text" class="form-control"  value="<%=location %>" name="location"
					placeholder="eg: Hyderabad" required>
			</div>

			<div class="form-group">
				<label>About Us<sup style="color: red">*</sup></label>
				<textarea rows="5" name="about_us"
					placeholder="Short description about your company"
					class="form-control" required> <%=about_us %></textarea>
			</div>
			<div class="form-group">
				<label>Company Logo<sup style="color: red">*</sup></label> <input
					type="file" class="form-control" name="company_logo" multiple
					accept='image/*' required>
			</div>
			<button type="submit" class="btn btn-success btn-block">Submit</button>
			<br>

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

