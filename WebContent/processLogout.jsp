<%
	session.removeAttribute("isLoggedIn");
	session.removeAttribute("loginUserRole");

	session.setAttribute("login_msg", "You have been successfully logged out");
	response.sendRedirect("login.jsp");

%>