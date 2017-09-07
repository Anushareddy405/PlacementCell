function applyJob(){
	var job_id = document.getElementById("job_id").value;
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			if (xhttp.responseText == 1){
				document.getElementById("Apply_job_result").innerHTML = "Applied Successfully";
				console.log("Applied Successfully");
			} else if (xhttp.responseText == 3){
				document.getElementById("Apply_job_result").innerHTML = "Already Applied";
				document.getElementById("Apply_job_result").setAttribute("style", "color: green;");
			}
		}
	};
	xhttp.open("GET", "ApplyJob?job_id="+job_id, true);
	xhttp.send();
}

