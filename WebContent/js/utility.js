function onlyNumbers(e){
	var ascii_code=  e.which || e.keycode;
	
	if(ascii_code>=48 && ascii_code<=57){
		return true;
	}else{
		alert("only numbers allowed");
		return false;
	}
}

function onlyChars(e){
	//alert("called");
var ascii_code=  e.which || e.keycode;
	
	if((ascii_code>=97 && ascii_code<=122)||(ascii_code>=65 && ascii_code<=90) || ascii_code==32){
		return true;
	}else{
		alert("only characters and space allowed");
		return false;
	}
}

function validateLength(item,allowed){
	alert("-->"+item.value.length+"<--"+allowed);
	if(item.value.length!=allowed)
		return false
	return true;
}

