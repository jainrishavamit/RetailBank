<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.HashMap,java.util.List,java.util.Arrays" %>
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
  }%>
  
	


	

<!-- %> -->





  <head>
  <!-- you can include other files from here -->
  
   <!-- <script type="text/javascript" src="js/addUser.js"> </script>  -->
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   





<%-- *****************  including header file ***************** --%>

	<%@include file="header.jsp" %>



    <!-- Begin page content -->
 
<% //String foundStatus=(String)session.getAttribute("searchCustomerStatus");
		if(session.getAttribute("searchCustomerStatus")!=null)
		{  %>
				<form id="form1">
				<div class="container">
				<div class="boxcontainer">
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="loginheading">
				
				
				
				</div>
				</div>
				
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Customer SSN ID: </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" readonly value="<%  out.print(session.getAttribute("customer_ssn_id"));%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Customer ID: </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" readonly value="<%  out.print(session.getAttribute("customer_id"));%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Customer Name: </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" readonly value="<%  out.print(session.getAttribute("customer_name"));%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Customer Age:  </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" readonly value="<%  out.print(session.getAttribute("customer_age"));%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Customer Address: </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" readonly value="<%  out.print(session.getAttribute("customer_address"));%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Customer State:  </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" readonly value="<%  out.print(session.getAttribute("customer_state"));%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Customer City:  </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" readonly value="<%  out.print(session.getAttribute("customer_city"));%>">
				</div>
				</div>
				</div>
				</div>
					</form>
					
					<%-- Customer SSN ID:<%  out.print(session.getAttribute("customer_ssn_id"));  %> <br/>
					Customer ID:<%  out.print(session.getAttribute("customer_id"));  %><br/>
					Customer Name:<%  out.print(session.getAttribute("customer_name"));  %> <br/>
					Customer Age:<%  out.print(session.getAttribute("customer_age"));  %> <br/>
					Customer Address:<%  out.print(session.getAttribute("customer_address"));  %> <br/>
					Customer State:<%  out.print(session.getAttribute("customer_state"));  %> <br/>
					Customer City:<%  out.print(session.getAttribute("customer_city"));  %> <br/>
					 --%>
					<%            	
                	 
                		  
                  }
                  else if(session.getAttribute("searchCustomerNotFound")!=null)
                  { 
                  
                  
                  	%><script>alert("No Customer exists with the specified ID/SSN ID!")</script><%
                  
                  
                 
                  }
                  session.removeAttribute("searchCustomerStatus");
                  session.removeAttribute("customer_ssn_id");
                  session.removeAttribute("customer_id");
                  session.removeAttribute("customer_name");
                  session.removeAttribute("customer_age");
                  session.removeAttribute("customer_address");
                  session.removeAttribute("customer_state");
                  session.removeAttribute("customer_city");
                  
                  %>
			
		
		
			
		</form>
</div>

</body>
</html>