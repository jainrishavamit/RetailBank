function checkFields(){
	if(document.getElementById("cusSsnId").value.length!=9){
		alert("Invalid SSN ID\nHint:SSN Id has to be 9 digit numeric value");
		return false;
	}
	
	else if(document.getElementById("state").value==0){
		alert("Please select state");
		return false;
	}
	

	else if(document.getElementById("city").value==0){
		alert("Please select city");
		return false;
	}
	return true;
}

function submitToSelf(){
	var form=document.getElementById("form1");
	form.action="#";
	form.submit();
}