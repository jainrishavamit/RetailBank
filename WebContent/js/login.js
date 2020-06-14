function checkFields(){
	var password=document.getElementById("Password").value;
	if(document.getElementById("Userid").value.length<8 ){
		alert("Invalid User Id :\n User ID should be of atleast 8 characters");
		return false;
	}
	
	else if(document.getElementById("Userid").value.length > 20){
		alert("Invalid User Id :\nUser ID should be of atmost 20 characters");
		return false;
	}
	else if(password.length<10){
		alert("Invalid Password :\n Password should be of atleast 10 character\n Password should be of atmost 20 characters \n Password should contain atleast one upper case" +
		"\n Password should contain atleast one numeric digit\n Password should contain atleast one special character from (@#$%^&*)");
	return false;
	}
	else if(password.length>20){
		alert("Invalid Password :\n Password should be of atleast 10 character\n Password should be of atmost 20 characters \n Password should contain atleast one upper case" +
				"\n Password should contain atleast one numeric digit\n Password should contain atleast one special character from (@#$%^&*)");
		return false;
	}
	else if(!(/[A-Z]+/.test(password))){
		alert("Invalid Password :\n Password should be of atleast 10 character\n Password should be of atmost 20 characters \n Password should contain atleast one upper case" +
			"\n Password should contain atleast one numeric digit\n Password should contain atleast one special character from (@#$%^&*)");
		return false;
	}
	else if(!(/[0-9]+/.test(password))){
		alert("Invalid Password :\n Password should be of atleast 10 character\n Password should be of atmost 20 characters \n Password should contain atleast one upper case" +
			"\n Password should contain atleast one numeric digit\n Password should contain atleast one special character from (@#$%^&*)");
		return false;
	}
	else if(!(/[@#$%^&*]+/.test(password))){
		alert("Invalid Password :\n Password should be of atleast 10 character\n Password should be of atmost 20 characters \n Password should contain atleast one upper case" +
			"\n Password should contain atleast one numeric digit\n Password should contain atleast one special character from (@#$%^&*)");
		return false;
	}
	//alert("everything fine");
	return true;
}
