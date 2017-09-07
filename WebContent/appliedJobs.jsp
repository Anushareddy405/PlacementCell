<%@ page import="model.DatabaseConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>

<%
	ResultSet isProfileFilled = null;
	String userFullName = "";
	String user_id = "";
	session = request.getSession(false);
	if (session != null && session.getAttribute("user_type_id") != null) {
		String user_type = session.getAttribute("user_type_id").toString();
		user_id = session.getAttribute("user_id").toString();
		isProfileFilled = (ResultSet) DatabaseConnector
				.getResultSet("select is_profile_full from user where user_id = " + user_id, 1);
		String prfileFill = "0";
		if (isProfileFilled.next()) {
			prfileFill = isProfileFilled.getString("is_profile_full");
		}
		userFullName = session.getAttribute("full_name").toString();
		if (prfileFill.equals("0")) {
			response.sendRedirect("studentProfile.jsp");
		} else {
			if (user_type.equals("1")) {
				response.sendRedirect("adminDashboard.jsp");
			} else if (user_type.equals("3")) {
				response.sendRedirect("companyDashboard.jsp");
			}
		}
	}

	ResultSet mResult = null;
	mResult = (ResultSet) DatabaseConnector
			.getResultSet("select job_id from applied_job where user_id = " + user_id + ";", 1);
	ArrayList<String> querySubject = new ArrayList<String>();
	while (mResult.next()) {
		String job_id = mResult.getString("job_id");
		String query = "select user_id from post_job_td where job_id =" + job_id + ";";
		ResultSet mSet = (ResultSet) DatabaseConnector.getResultSet(query, 1);
		if (mSet.next()) {
			String uid = mSet.getString("user_id");
			System.out.println("=------" + uid);
			String qq = "select name from user where user_id = " + uid + ";";
			ResultSet mRSet = (ResultSet) DatabaseConnector.getResultSet(qq, 1);
			if (mRSet.next()) {
				querySubject.add(mRSet.getString("name"));
			}
		}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Dashboard</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
<script type="text/javascript" src="js/dashboards.js"></script>
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
				class="fa fa-user"></i></a> <a href="changePassword.jsp"
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
		class="w3-padding "><i class="fa fa-users fa-fw"></i> 
		Dashboard</a> <a href="companiesHiring.jsp" class="w3-padding"><i
		class="fa fa-eye fa-fw"></i>  Companies Hiring</a> <a href="#"
		class="w3-padding w3-blue"><i class="fa fa-users fa-fw"></i>  Applied Jobs</a>
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
		<h5>
			<b><i></i>Applied Jobs</b>
		</h5>
		</header>
		<div class="col-md-11">
			<table class="table">
				<tbody>
					<%
						for (int i = 0; i < querySubject.size(); i++) {
					%>
					<tr>
						<td class="txt"><%=querySubject.get(i)%></td>
						<td>
							<form action="ViewCompanyProfile" method="post">
								<input type="hidden" name="company_name"
									value="<%=querySubject.get(i)%>">
								<button type="submit" style="float: right;"
									class="btn btn-primary">View Company Profile</button>
							</form>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
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

