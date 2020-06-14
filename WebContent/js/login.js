function checkFields(){
	if(document.getElementById("Userid").value.length<8 ){
		alert("Invalid User Id :\n User ID should be of atleast 8 characters");
		return false;
	}
	
	else if(document.getElementById("Userid").value.length > 20){
		alert("Invalid User Id :\nUser ID should be of atmost 20 characters");
		return false;
	}
	else if(document.getElementById("Password").value.length){
		
	}
	
	alert("everything fine");
	return true;
}
