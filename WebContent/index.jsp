<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session = request.getSession(false);
	if (session != null && session.getAttribute("user_type_id") != null) {
		String user_type = session.getAttribute("user_type_id").toString();
		System.out.print(user_type);
		if (user_type.equals("1")) {
			response.sendRedirect("adminDashboard.jsp");
		} else if (user_type.equals("2")) {
			response.sendRedirect("studentDashboard.jsp");
		} else if (user_type.equals("3")) {
			response.sendRedirect("companyDashboard.jsp");
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign-Up/Login Form</title>
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="css/style.css">

<script type="text/javascript" src="js/index.js"></script>
</head>

<body>
	<div class="form">
		<ul class="tab-group">
			<li class="tab  active"><a href="#login">Log In</a></li>
			<li class="tab"><a href="#signup">Sign Up</a></li>

		</ul>

		<div class="tab-content">

			<div id="login">
				<h1 id="result">Welcome Back!</h1>

				<div class="field-wrap">
					<label> Username<span class="req">*</span>
					</label> <input id="username" name="username" type="text" required
						autocomplete="off" />
				</div>

				<div class="field-wrap">
					<label> Password<span class="req">*</span>
					</label> <input id="password" name="password" type="password" required
						autocomplete="off" />
				</div>

				<p class="forgot">
					<a href="#">Forgot Password?</a>
				</p>

				<button class="button button-block" onclick="login()" />
				Log In
				</button>

			</div>

			<div id="signup">
				<h1>Company SignUp</h1>
				<div class="field-wrap">
					<label>Company Name<span class="req">*</span>
					</label> <input id="company_name" name="company_name" type="text" required
						autocomplete="off" />
				</div>
				<div class="field-wrap">
					<label>Employee ID(username)<span class="req">*</span>
					</label> <input id="emp_id" name="employee_id" type="text" required />
				</div>
				<div class="field-wrap">
					<label> Password<span class="req">*</span>
					</label> <input id="password_signup" name="password" type="password"
						required autocomplete="off" />
				</div>
				<div class="field-wrap">
					<label> Conform Password<span class="req">*</span>
					</label> <input id="conform_password_signup" name="password"
						type="password" required autocomplete="off" />
				</div>

				<button class="button button-block" onclick="registration()" />
				Get Started
				</button>
			</div>
		</div>
		<!-- tab-content -->
	</div>
	<!-- /form -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/index.js"></script>

</body>
</html>
