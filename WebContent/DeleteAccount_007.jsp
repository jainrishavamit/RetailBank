<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>


<%-- login status validation --%>
<%
	String roleAlloweded="customer_account_executive";  // change to "cashier" for cashier specific pages

	if(session.getAttribute("isLoggedIn")==null || !(session.getAttribute("isLoggedIn").equals("true"))){

		session.setAttribute("login_msg", "Please login first to continue");
		response.sendRedirect("login.jsp");
	}

	else if(session.getAttribute("loginUserRole")==null || !(session.getAttribute("loginUserRole").equals(roleAlloweded))){
	
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
<meta charset="ISO-8859-1">
<title>Delete Account</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
html {
	position: relative;
	min-height: 100%;
}

body {
	margin-bottom: 60px;
}

.form-group {
	display: block;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	margin-bottom: 10px;
}

.loginheading {
	font-size: 25px;
	position: absolute;
	top: -66px;
	right: 125px;
}

.btnbox {
	text-align: center;
	margin-bottom: 10px;
}
</style>
<script type="text/javascript">
 
 $(document).ready(function(){
	$("#custAccountId").keypress(function(e) {
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

			<form action="DeleteAccountController" method="post">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="loginheading">
						<label> Delete Account </label>
					</div>
				</div>
				<%
					if (session.getAttribute("DeleteMessage") != null) {
				%>
				<span style="color: green; font-size: 15px; margin-left: 30%;"><%=session.getAttribute("DeleteMessage")%>
				</span>
				<%
					}

					session.removeAttribute("DeleteMessage");
				%>

				<div class="form-group">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<label class="col-md-4 col-xs-4 col-sm-4">Account ID</label> <input
							type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group"
							id="custAccountId" aria-describedby="emailHelp" name="CustomerId"
							required="required">
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<label class="col-md-4 col-xs-4 col-sm-4">Account Type</label> <select
							class="col-md-8 col-xs-8 col-xs-8 control-group"
							name="AccountType" required="required">
							<option></option>
							<option>Savings</option>
							<option>Current</option>

						</select>
					</div>
				</div>


				<div class="form-group">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="btnbox" style="text-align: center;">
							<button type="submit" class="btn btn-primary ">Delete
								Account</button>
						</div>
					</div>
				</div>


			</form>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	</div>
</body>
</html>