<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>

<html lang="en">  



<%-- login status validation --%>
<%
	String roleAllowed="customer_account_executive";  // change to "cashier" for cashier specific pages

	if(session.getAttribute("isLoggedIn")==null || !(session.getAttribute("isLoggedIn").equals("true"))){

		session.setAttribute("login_msg", "Please login first to continue");
		response.sendRedirect("login.jsp");
	}

	else if(session.getAttribute("loginUserRole")==null || !(session.getAttribute("loginUserRole").equals(roleAllowed))){
	
		session.setAttribute("redirect_msg", "You dont have rights to access previous page that you tried to access ");
		response.sendRedirect("welcome.jsp");
	}
	
	else if(session.getAttribute("redirect_msg")!=null){  %>
	<script>alert("<%=session.getAttribute("redirect_msg")%>")</script>
	<% 
		session.removeAttribute("redirect_msg");  
  }
  
 %>
  


<head>
<title>Create Account</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.btnbox {
	text-align: center;
	margin-bottom: 10px;
}

.warning {
	color: red;
	color: red;
	position: absolute;
	left: 23%;
	top: 50%;
}

.container {
	width: 100%
}

.loginheading {
	font-size: 25px;
	position: absolute;
	top: -66px;
	right: 125px;
}

.form-group {
	display: block;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	margin-bottom: 10px;
}



.boxcontainer {
	width: 100%;
	margin: 11% 0% 0% 19%;
}

form {
	padding-top: 10px;
	font-size: 14px;
	margin-top: 30px;
	width: 50%;
}

html {
	position: relative;
	min-height: 100%;
}

body {
	margin-bottom: 60px;
}
</style>
</head> 
<script type="text/javascript">
 
 $(document).ready(function(){
	$("#depAmt").keypress(function(e) {
		if(e.which != 8 && e.which !=0 && (e.which < 48 || e.which > 57)){
			return false;
		}
	}); 
 });
 
 $(document).ready(function(){
		$("#custId").keypress(function(e) {
			if(e.which != 8 && e.which !=0 && (e.which < 48 || e.which > 57)){
				return false;
			}
		}); 
	 });
</script>

<body>
	<%
		response.setHeader("Cache-Control", "no-store,must-revalidate");
	%>
	<%@include file="header.jsp"%>
	<!-- Begin page content -->
	<div class="container">

		<div class="boxcontainer">

			<form action="CreateAccountController" method="post">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="loginheading">
						<label> Create Account </label>
					</div>
				</div>
				<%
					if (session.getAttribute("message") != null) {
				%>
				<span style="color: green; font-size: 18px; margin-left: 40%;"><%=session.getAttribute("message")%>
				</span>
				<%
					}

					session.removeAttribute("message");
				%>
				<%
					if (session.getAttribute("AccExist") != null) {
				%>
				<span style="color: green; font-size: 18px; margin-left: 40%;"><%=session.getAttribute("AccExist")%>
				</span>
				<%
					}

					session.removeAttribute("AccExist");
				%>
				

				<div class="form-group">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<label class="col-md-4 col-xs-4 col-sm-4">Customer ID*</label> <input
							type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group"
							id="custId" aria-describedby="emailHelp" name="CustomerId"
							required="required">
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<label class="col-md-4 col-xs-4 col-sm-4">Account Type*</label> 
						<select
							class="col-md-8 col-xs-8 col-xs-8 control-group"
							name="AccountType" required="required">

							<option>Savings</option>
							<option>Current</option>

						</select>
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<label class="col-md-4 col-xs-4 col-sm-4">Deposit Amount*</label>
						<input type="text"
							 id="depAmt"
							aria-describedby="emailHelp" name="DepositAmount"> 
							
					</div>
				</div>

				<label class="warning">(*)Fields are compulsory</label>
				
				<%
					if (session.getAttribute("minbal") != null) {
				%>
				<span style="color: red; font-size: 14px;margin-left: 30%"><%=session.getAttribute("minbal")%>
				</span>
				<%
					}

					session.removeAttribute("minbal");
				%>

				<div class="form-group">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="btnbox" style="text-align: center;">
							<button type="submit" class="btn btn-primary ">Submit</button>
						</div>
					</div>
				</div>


			</form>
		</div>
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>