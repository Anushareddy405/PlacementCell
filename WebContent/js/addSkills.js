function addEntertedSkills(){
	var skills = document.getElementById("skills_input").value;

	if (skills == ""){
		alert("skills must be filled out");
		return false;
	}

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			if (xhttp.responseText == 1){
				window.location = "skillsList.jsp";
			}else {
				document.getElementById("showResult").innerHTML = "Skills Not Saves";
				document.getElementById("showResult").setAttribute("style", "color: red;");
			}
		}
	};
	xhttp.open("GET", "Skills?skills="+skills, true);
	xhttp.send();
}