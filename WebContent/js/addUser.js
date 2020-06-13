function checkFields(){
	alert("form will not be submitted");
	return false;
}

function submitToSelf(){
	var form=document.getElementById("form1");
	form.action="#";
	form.submit();
}