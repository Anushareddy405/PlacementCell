/**
 * 
 */

function changePassword(){

	var oldPassword = document.getElementById("studentOldPassword").value;
	var newPassword = document.getElementById("newPassword").value;
	var conformNewPassword = document.getElementById("conformNewPassword").value;
	if(newPassword  != conformNewPassword){
		alert("lkfjgskjdf");
		return;
	}
	

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("changedPassowrdResult").innerHTML = xhttp.responseText;
			document.getElementById("changedPassowrdResult").setAttribute("style", "color: green;");
		}
	};
	xhttp.open("GET", "ChangePassword?password="+newPassword+"&method=1", true);
	xhttp.send();

}
function checkOldPassword(){
	var oldPassword = document.getElementById("studentOldPassword").value;

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("oldPasswordResult").innerHTML = xhttp.responseText;
			document.getElementById("oldPasswordResult").setAttribute("style", "color: green;");
		}
	};
	xhttp.open("GET", "ChangePassword?password="+oldPassword+"&method=2", true);
	xhttp.send();
}