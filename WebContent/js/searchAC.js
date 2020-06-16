function checkFields(){
	if(document.getElementById("CustAccountId").value==""){
		if( document.getElementById("CustId").value==""){
			alert("Both fields can not be empty");			
			return false;
		}else if(document.getElementById("CustId").value.length!=9){
				alert("Customer Id has to be of 9 digits");
				return false;
		}
	}else if(document.getElementById("CustAccountId").value.length!=9){
		if(document.getElementById("CustId").value==""){
			alert("Account Id has to be of 9 digits");
			return false;
		}else if(document.getElementById("CustId").value.length!=9){
			alert("Either of the ID has to be of 9 digits");
			return false;
		}
	}
	

	//alert("everything fine");
	return true;
}


function checkAccIdC(){
	if(document.getElementById("toAccIdC").value.length!=9){
		alert("Account Id has to be of 9 digits");
		document.getElementById("toAccIdC").focus();
		return false;
	}
	return true;
	
	//return false;
}

function checkAccIdS(){
	if(document.getElementById("toAccIdS").value.length!=9){
		alert("Account Id has to be of 9 digits");
		document.getElementById("toAccIdS").focus();
		return false;
	}
	return true;
	
	//return false;
}