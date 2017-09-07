$('.form').find('input, textarea').on('keyup blur focus', function (e) {
	var $this = $(this),
	label = $this.prev('label');

	if (e.type === 'keyup') {
		if ($this.val() === '') {
			label.removeClass('active highlight');
		} else {
			label.addClass('active highlight');
		}
	} else if (e.type === 'blur') {
		if( $this.val() === '' ) {
			label.removeClass('active highlight'); 
		} else {
			label.removeClass('highlight');   
		}   
	} else if (e.type === 'focus') {

		if( $this.val() === '' ) {
			label.removeClass('highlight'); 
		} 
		else if( $this.val() !== '' ) {
			label.addClass('highlight');
		}
	}
});

//tabe clicks
$('.tab a').on('click', function (e) {
	e.preventDefault();

	$(this).parent().addClass('active');
	$(this).parent().siblings().removeClass('active');

	target = $(this).attr('href');

	$('.tab-content > div').not(target).hide();

	$(target).fadeIn(800);

});

//login ajax
function login() {
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;

	if (username == ""){
		alert("Username must be filled out");
		return false;
	}
	if (password == ""){
		alert("Password must be filled out");
		return false;
	}

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			if (xhttp.responseText === "1"){
				window.location="adminDashboard.jsp";
			} else if (xhttp.responseText === "2"){
				window.location = "studentDashboard.jsp";
			} else if (xhttp.responseText === "3"){
				window.location = "companyDashboard.jsp";
			} else {
				document.getElementById("result").innerHTML = "Password MisMatch!!";
				document.getElementById("result").setAttribute("style", "color: red;");
			}
		}
	};
	xhttp.open("GET", "Login?username="+username+"&password="+password, true);
	xhttp.send();
}

//function registration
function registration() {
	var company_name = document.getElementById("company_name").value;
	var emp_id = document.getElementById("emp_id").value;
	var password_signup = document.getElementById("password_signup").value;
	var conform_password_signup = document.getElementById("conform_password_signup").value;

	if (password == conform_password_signup){
		alert("Password must be filled out");
		return false;
	}

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			if (this.responseText == 1){
				window.location = "index.jsp";
			} else {
				alert(this.responseText);
			}
		}
	};
	xhttp.open("GET", "SignUp?company_name="+company_name+"&emp_id="+emp_id+"&password_signup="+password_signup, true);
	xhttp.send();
}