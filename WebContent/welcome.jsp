<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body>

<div align="center">
	<h1>Home Page</h1>
	<h3>
	login user role : <%=session.getAttribute("loginUserRole") %><br>
	login status :  <%=
			session.getAttribute("isLoggedIn") %>
			<%		
	if(session.getAttribute("redirect_msg")!=null){  %>
	<script>alert("<%=session.getAttribute("redirect_msg")%>")</script>
	<% 
		session.removeAttribute("redirect_msg");  
  }%>
  <br>
  
			 <a href="processLogout.jsp">Logout</a>
  </h3>
</div>
	<h4>for both</h4>

				<ol>
				
					<li><a href="processLogout.jsp">User Story 1 : login(this will log you out)</a><br>
				</ol>
				<br>
				
		<h4>Executive operations : operations</h4>
			<ol>
				
				<li><a href="addUser.jsp">User Story 2 : Add Customer</a><br>
				<li><a href="UpdateCustomer.jsp">User Story 3 : Update Customer</a><br>
				<li><a href="DeleteCustomer.jsp">User Story 4 : Delete Customer</a><br>
				<li><a href="ViewCustomerStatusController">User Story 5 : View all customer status</a>
				<li><a href="ViewAccountStatusController">User Story 8 : View all Account status</a>
				<li><a href="SearchCustomer.jsp">User Story 9 : Search customer</a><br>
				
	
			</ol>
		
		<br>
		
		<h4>Cashier operations : operations</h4>
			<ol>
				<li><a href="searchAC.jsp">User Story 10 : Search Account</a><br>
				
			</ol>

</body>
</html>