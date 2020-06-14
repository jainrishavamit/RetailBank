function checkFields(){
	var password=document.getElementById("Password").value;
	var msg="";
	if(document.getElementById("Userid").value.length<8 ){
		msg=("Invalid User Id :<br> User ID should be of atleast 8 characters");
		 
	}
	
	else if(document.getElementById("Userid").value.length > 20){
		msg=("Invalid User Id :<br>User ID should be of atmost 20 characters");
		 
	}
	else if(password.length<10){
		msg=("Invalid Password :<br> Password should be of atleast 10 character<br> Password should be of atmost 20 characters <br> Password should contain atleast one upper case" +
		"<br> Password should contain atleast one numeric digit<br> Password should contain atleast one special character from (@#$%^&*)");
	 
	}
	else if(password.length>20){
		msg=("Invalid Password :<br> Password should be of atleast 10 character<br> Password should be of atmost 20 characters <br> Password should contain atleast one upper case" +
				"<br> Password should contain atleast one numeric digit<br> Password should contain atleast one special character from (@#$%^&*)");
		 
	}
	else if(!(/[A-Z]+/.test(password))){
		msg=("Invalid Password :<br> Password should be of atleast 10 character<br> Password should be of atmost 20 characters <br> Password should contain atleast one upper case" +
			"<br> Password should contain atleast one numeric digit<br> Password should contain atleast one special character from (@#$%^&*)");
		 
	}
	else if(!(/[0-9]+/.test(password))){
		msg=("Invalid Password :<br> Password should be of atleast 10 character<br> Password should be of atmost 20 characters <br> Password should contain atleast one upper case" +
			"<br> Password should contain atleast one numeric digit<br> Password should contain atleast one special character from (@#$%^&*)");
		 
	}
	else if(!(/[@#$%^&*]+/.test(password))){
		msg=("Invalid Password :<br> Password should be of atleast 10 character<br> Password should be of atmost 20 characters <br> Password should contain atleast one upper case" +
			"<br> Password should contain atleast one numeric digit<br> Password should contain atleast one special character from (@#$%^&*)");
		 
	}
	//msg=("everything fine");
	if(msg!=""){
		document.getElementById("errorMsg").innerHTML=msg;
		return false;
	}
	return true;
}
