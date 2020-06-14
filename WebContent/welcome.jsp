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
		<h4>Executive operations : operations</h4>
			<ol>
				<li><a href="addUser.jsp">User Story 2 : Add User(Customer)</a><br>
				<li><a href="SearchCustomer.jsp">Search customer</a><br>
			</ol>
		
		<br>
		
		<h4>Cashier operations : operations</h4>
			<ol>
				<li><a href="searchAC.jsp">User Story 10 : Search Account</a><br>
			</ol>


</body>
</html>