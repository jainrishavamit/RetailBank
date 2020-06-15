function checkFields(){
	var selectionCriteria=document.getElementById("searchCriteria");
	var selectionCriteriaValue=selectionCriteria.value;
	var selectionCriteriaSelectedText=selectionCriteria.options[selectionCriteria.selectedIndex].text;

	if(selectionCriteriaValue=="None"){
		alert("Kindly select search criteria from drop down");
		selectionCriteria.focus();
		return false;
	}else if(document.getElementById("CustSSNID").value.length!=9){
		alert("Invalid "+selectionCriteriaSelectedText+"\n Hint : "+selectionCriteriaSelectedText+" has to be 9 digit numeric value");
		document.getElementById("CustSSNID").focus();
		return false;
	}

	//alert("everything fine");
	//return false;
	return true;
}
