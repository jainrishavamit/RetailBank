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
	login user role<%=session.getAttribute("loginUserRole") %>
	is logged in <%=
			session.getAttribute("isLoggedIn") %>
			<%		
	if(session.getAttribute("redirect_msg")!=null){  %>
	<script>alert("<%=session.getAttribute("redirect_msg")%>")</script>
	<% 
		session.removeAttribute("redirect_msg");  
  }%>
</div>
</body>
</html>