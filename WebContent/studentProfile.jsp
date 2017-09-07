<%@ page import="model.DatabaseConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>

<%
	String studentName = "";
	String studentDOB = "";
	String studentFatherName = "";
	String studentMotherName = "";
	String studentGender = "";
	String studentAlternateEmail = "";
	
	String mobileNumber = "";
	String landlineNumber = "";
	String address = "";
	String city = "";
	String state = "";
	String pincode = "";
	
	String sscSchoolName = "";
	String sscYearCompleted = "";
	String sscBoard = "";
	String sscYearAggregate = "";
	
	String twelthCollegeName = "";
	String twelthYearCompleted = "";
	String twelthBoard = "";
	String twelthAggregate = "";
	
	
	String graduationUniversity = "";
	String graduationCollegeName = "";
	String graduationSpecialization = "";
	String graduationStarted = "";
	String graduationCompleted = "";
	String graduationPrefinalAggregate = "";
	String graduationFinalAggregate = "";
	
	
	String pgUniversity = "";
	String pgSpecialization = "";
	String pgStarted = "";
	String pgCompleted = "";
	String pgPrefinalAggregate = "";
	String pgFinalAggregate = "";
	
	String skills = "";
	String certification = "";
	
	ResultSet isProfileFilled = null;
	ResultSet mResultSet = null;
	String userFullName = "";
	String user_id = "";
	session = request.getSession(false);
	if (session != null && session.getAttribute("user_type_id") != null) {
		String user_type = session.getAttribute("user_type_id").toString();
		user_id = session.getAttribute("user_id").toString();
		userFullName = session.getAttribute("full_name").toString();
		isProfileFilled = (ResultSet) DatabaseConnector
				.getResultSet("select is_profile_full from user where user_id = " + user_id+";", 1);
		String prfileFill = "0";
		if (isProfileFilled.next()) {
			prfileFill = isProfileFilled.getString("is_profile_full");
		}
		if (!prfileFill.equals("0")) {
			 mResultSet = (ResultSet) DatabaseConnector
					.getResultSet("select * from student_personal_information_td where user_id = " + user_id+";", 1);
			if (mResultSet.next()) {
				studentName = mResultSet.getString("name");
				studentDOB = mResultSet.getString("dob");
				studentFatherName = mResultSet.getString("father_name");
				studentMotherName = mResultSet.getString("mother_name");
				studentGender = mResultSet.getString("gender");
				studentAlternateEmail = mResultSet.getString("alternate_email");
				

			} 
			mResultSet = (ResultSet) DatabaseConnector
					.getResultSet("select * from student_contact_details_td where user_id = " + user_id+";", 1);
			if (mResultSet.next()) {
				mobileNumber = mResultSet.getString("mobile_no");
				landlineNumber = mResultSet.getString("landline_no");
				address = mResultSet.getString("address");
				city = mResultSet.getString("city");
				state = mResultSet.getString("state");
				pincode = mResultSet.getString("pincode");

			}
			mResultSet = (ResultSet) DatabaseConnector
					.getResultSet("select * from student_education_tenth_td where user_id = " + user_id+";", 1);
			if (mResultSet.next()) {
				sscSchoolName = mResultSet.getString("ssc_schoolname");
				sscYearCompleted = mResultSet.getString("year_completed");
				sscBoard = mResultSet.getString("board");
				sscYearAggregate = mResultSet.getString("aggregate");

			}
			
			mResultSet = (ResultSet) DatabaseConnector
					.getResultSet("select * from  student_education_twelfth_td where user_id = " + user_id+";", 1);
			if (mResultSet.next()) {
				twelthCollegeName = mResultSet.getString("college_name");
				twelthYearCompleted = mResultSet.getString("year_completed");
				twelthBoard = mResultSet.getString("board");
				twelthAggregate = mResultSet.getString("aggregate");

			}
			
			mResultSet = (ResultSet) DatabaseConnector
					.getResultSet("select * from  student_education_graduation_td where user_id = " + user_id+";", 1);
			if (mResultSet.next()) {
				
				graduationUniversity = mResultSet.getString("university");
				graduationCollegeName = mResultSet.getString("college_name");
				graduationSpecialization = mResultSet.getString("specializations");
				graduationStarted = mResultSet.getString("started_year");
				graduationCompleted = mResultSet.getString("completed_year");
				graduationPrefinalAggregate = mResultSet.getString("pre_final_aggregate");
				graduationFinalAggregate = mResultSet.getString("final_aggregate");

			}
			
			mResultSet = (ResultSet) DatabaseConnector
					.getResultSet("select * from  student_education_postgraduation_td  where  user_id= " + user_id+";", 1);
			if (mResultSet.next()) {
				pgUniversity = mResultSet.getString("university");
				pgSpecialization = mResultSet.getString("specializations");
				pgStarted = mResultSet.getString("started_year");
				pgCompleted = mResultSet.getString("completed_year");
				pgPrefinalAggregate = mResultSet.getString("pre_final_aggregate");
				pgFinalAggregate = mResultSet.getString("final_aggregate");
				
			}
			

			mResultSet = (ResultSet) DatabaseConnector
					.getResultSet("select * from  student_skills_certification_td where user_id= " + user_id+";", 1);
			if (mResultSet.next()) {
				skills = mResultSet.getString("skills");
				certification = mResultSet.getString("certification");
				
			}
			
			
			
		}

		if (user_type.equals("1")) {
			response.sendRedirect("adminDashboard.jsp");
		} else if (user_type.equals("3")) {
			response.sendRedirect("companyDashboard.jsp");
		}
	}
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Company Dashboard</title>


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
				class="fa fa-user"></i></a> <a href="changePassword.jsp"
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
		href="studentDashboard.jsp" class="w3-padding "><i
		class="fa fa-users fa-fw"></i>  Dashboard</a> <a
		href="companiesHiring.jsp" class="w3-padding"><i
		class="fa fa-eye fa-fw"></i>  Companies Hiring</a> <a
		href="appliedJobs.jsp" class="w3-padding"><i
		class="fa fa-users fa-fw"></i>  Applied Jobs</a> <a
		href="studentAskQueries.jsp" class="w3-padding"><i
		class="fa fa-bullseye fa-fw"></i> Ask Query</a> <a href="#"
		class="w3-padding w3-blue"><i class="fa fa-bullseye fa-fw"></i>
		Student Profile</a> <br>
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
			<h2>Student Profile</h2>
		</h5>
		</header>

		<!--Start your code from here-->

		<form action="StudentProfile" method="post" class="w3-container"
			style="padding-top: 22px">
			<div class="form-group">
				<h4 align="left">Personal Information</h4>
				<hr>
				<label>Name<sup style="color: red">*</sup></label> <input
					type="text" class="form-control" name="student_name"
					placeholder="as per 10th score card" required
					value="<%=studentName%>">
			</div>
			<div class="form-group">
				<label>Date of Birth<sup style="color: red">*</sup></label> <input
					name="student_dob" type="date" class="form-control"
					placeholder="eg: 10/01/2017" required value="<%=studentDOB%>" >
			</div>
			<div class="form-group">
				<label>Fathers Name<sup style="color: red">*</sup></label> <input
					name="student_father_name" type="text" class="form-control"
					placeholder="" required value="<%=studentFatherName%>" >
			</div>
			<div class="form-group">
				<label>Mothers Name<sup style="color: red">*</sup></label> <input
					name="student_mother_name" type="text" class="form-control"
					placeholder="" required value="<%=studentMotherName%>" >
			</div>

			<div class="form-group">
			
				<label>Gender<sup style="color: red">*</sup></label> <label
					class="radio-inline"> <input type="radio" name="gen" value="male">Male
				</label> <label class="radio-inline"> <input type="radio"
					name="gen" value="female">Female
				</label>
				
			</div>
			<div class="form-group">
				<label>Alternative email id</label> <input name="alternate_mail_id"
					type="text" class="form-control" placeholder="email" value="<%=studentAlternateEmail%>">
			</div>
			<br>
			<div>
				<h4>Contact details</h4>
				<hr>
			</div>

			<div class="form-group">
				<label>Mobile Number<sup style="color: red">*</sup></label> <input
					name="student_mobile_no" type="number" class="form-control"
					placeholder="number" required value="<%=mobileNumber%>">
			</div>

			<div class="form-group">
				<label>Landline Number</label> <input type="number"
					name="student_landline_no" class="form-control"
					placeholder="number" value="<%=landlineNumber%>">
			</div>

			<div class="form-group">
				<label>Address<sup style="color: red">*</sup></label>
				<textarea type="text" class="form-control" rows="8"
					name="student_address" placeholder=" D/no-534" required ><%=address%></textarea>
			</div>

			<div class="form-group">
				<label>City<sup style="color: red">*</sup></label> <input
					name="city" type="text" class="form-control"
					placeholder="hyderabad" required value="<%=city%>">
			</div>

			<div class="form-group">
				<label>State<sup style="color: red">*</sup></label> <input
					name="state" type="text" class="form-control"
					placeholder="hyderabad" required value="<%=state%>">
			</div>

			<div class="form-group">
				<label>PINCODE<sup style="color: red">*</sup></label> <input
					name="pincode" type="number" class="form-control"
					placeholder="516360" required value="<%=pincode%>">
			</div>
			<br>
			<div>
				<h3>Education</h3>
				<hr>
				<h4>
					10<sup>th</sup> Details
				</h4>
				<hr>
			</div>

			<div class="form-group">
				<label>SSC School Name<sup style="color: red">*</sup></label> <input
					name="student_10th_shcool_name" type="text" class="form-control"
					placeholder="" required value="<%=sscSchoolName%>">
			</div>

			<div class="form-group">
				<label>Year Completed<sup style="color: red">*</sup></label> <input
					name="student_10th_completed_year" type="number"
					class="form-control" placeholder="" required value="<%=sscYearCompleted%>">
			</div>

			<div class="form-group">
				<label>Board<sup style="color: red">*</sup></label> <input
					name="student_10th_board" type="text" class="form-control"
					placeholder="state" required value="<%=sscBoard%>">
			</div>

			<div class="form-group">
				<label>Aggregate in %<sup style="color: red">*</sup></label> <input
					name="student_10th_aggregate" type="number" class="form-control"
					placeholder="89%" required value="<%=sscYearAggregate%>">
			</div>
			<br>
			<div>
				<h4>
					12<sup>th</sup> Details
				</h4>
				<hr>
			</div>

			<div class="form-group">
				<label>School/College Name<sup style="color: red">*</sup></label> <input
					name="student_11th_collage_name" type="text" class="form-control"
					placeholder="JNTUH" required value="<%=twelthCollegeName%>">
			</div>

			<div class="form-group">
				<label>Year Completed<sup style="color: red">*</sup></label> <input
					name="student_11th_completed_year" type="number"
					class="form-control" placeholder="2016" required value="<%=twelthYearCompleted%>">
			</div>
			<div class="form-group">
				<label>Board<sup style="color: red">*</sup></label> <input
					name="student_11th_board" type="text" class="form-control"
					placeholder="eg: ntermediate" required value="<%=twelthBoard%>">
			</div>
			<div class="form-group">
				<label>Aggregate in %<sup style="color: red">*</sup></label> <input
					name="student_11th_aggregate" type="number" class="form-control"
					placeholder="89%" required value="<%=twelthAggregate%>">
			</div>
			<br>
			<div>
				<h4>Graduation details</h4>
				<hr>
			</div>

			<div class="form-group">
				<label>Degree</label> <select class="form-control"
					name="student_graduation_degree">
					<option>Btech</option>
					<option>Bioinformatics</option>
					<option>BPharm</option>
					<option>Bsc</option>
					<option>BArch</option>
				</select>
			</div>

			<div class="form-group">
				<label>University<sup style="color: red">*</sup></label> <input
					name="student_graduation_university" type="text"
					class="form-control" placeholder="JNTUH" required value="<%=graduationUniversity%>">
			</div>
			<div class="form-group">
				<label>Enter your College Name<sup style="color: red">*</sup></label>
				<input name="student_graduation_college_name" type="text"
					class="form-control" placeholder="" required value="<%=graduationCollegeName%>">
			</div>

			<div class="form-group">
				<label>Specialization<sup style="color: red">*</sup></label> <input
					name="student_graduation_specialization" type="text"
					class="form-control" placeholder="" required value="<%=graduationSpecialization%>">
			</div>

			<div class="form-group">
				<label>Started Year<sup style="color: red">*</sup></label> <input
					name="student_graduation_started_year" type="number"
					class="form-control" placeholder="Jan,2009" required value="<%=graduationStarted%>">
			</div>

			<div class="form-group">
				<label>Completed Year<sup style="color: red">*</sup></label> <input
					name="student_graduation_completed_year" type="number"
					class="form-control" placeholder="Dec,2016" required value="<%=graduationCompleted%>">
			</div>

			<div class="form-group">
				<label>Pre Final aggregate%<sup style="color: red">*</sup></label> <input
					name="student_graduation_prefinal_aggregate" type="number"
					class="form-control"
					placeholder="if you are in 4th year please enter the present %" value="<%=graduationPrefinalAggregate%>">
			</div>

			<div class="form-group">
				<label>Final aggregate%<sup style="color: red">*</sup></label> <input
					name="student_graduation_final_aggregate" type="number"
					class="form-control" placeholder="eg: 78%" value="<%=graduationFinalAggregate%>">
			</div>
			<br>

			<div>
				<h4>Post Graduation details</h4>
				<hr>
			</div>

			<div class="form-group">
				<label>Degree<sup style="color: red">*</sup></label> <select
					class="form-control" name="student_post_graduation_degree">
					<option value="">---Select Option---</option>
					<option value="M.tech">Msit</option>
					<option value="MCA">MCA</option>
					<option value="Msc">Msc</option>
					<option value="MBA">Mba</option>
					<option value="Mphar">MPhar</option>
				</select>
			</div>
			<div class="form-group">
				<label>University<sup style="color: red">*</sup></label> <input
					name="student_post_graduation_university" type="text"
					class="form-control" placeholder="Post Graduation University"
					required value="<%=pgUniversity%>">
			</div>
			<div class="form-group">
				<label>Specialization<sup style="color: red">*</sup></label> <input
					name="student_post_graduation_specialization" type="text"
					class="form-control" placeholder="" required value="<%=pgSpecialization%>">
			</div>

			<div class="form-group">
				<label>Started Year<sup style="color: red">*</sup></label> <input
					name="student_post_graduation_started_year" type="number"
					class="form-control" placeholder="Jan,2009" required value="<%=pgStarted%>">
			</div>

			<div class="form-group">
				<label>Completed Year<sup style="color: red">*</sup></label> <input
					name="student_post_graduation_completed_year" type="number"
					class="form-control" placeholder="Dec,2016" required value="<%=pgCompleted%>">
			</div>

			<div class="form-group">
				<label>Pre Final aggregate%<sup style="color: red">*</sup></label> <input
					name="student_post_graduation_prefinal_aggregate" type="number"
					class="form-control" placeholder="78%" value="<%=pgPrefinalAggregate%>">
			</div>

			<div class="form-group">
				<label>Final aggregate%<sup style="color: red">*</sup></label> <input
					name="student_post_graduation_final_aggregate" type="number"
					class="form-control" placeholder="78%" value="<%=pgFinalAggregate%>">
			</div>
			<br>
			<div>
				<h3>
					Proffessional Skills
					<h3>
						<hr>
			</div>
			<div class="form-group">
				<label>Skills<sup style="color: red">*</sup></label> <input
					type="text" name="student_skills" class="form-control"
					placeholder="" required value="<%=skills%>">
			</div>
			<br>
			<div>
				<h3>Certification/Training</h3>
				<hr>
			</div>
			<div class="form-group">
				<label>Certifications/Training<sup style="color: red">*</sup></label>
				<input type="text" name="student_certification" class="form-control"
					placeholder="" required value="<%=certification%>">
			</div>
			<br>
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
