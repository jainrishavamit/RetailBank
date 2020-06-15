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
  
    <script type="text/javascript" src="js/searchCustomer.js"> </script> 
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   





<%-- *****************  including header file ***************** --%>

	<%@include file="header.jsp" %>



    <!-- Begin page content -->
    <div class="container">
	
	<div class="boxcontainer">
	
	
		<form id="form1" action="SearchCustomerController" method="post" onsubmit="return checkFields();">
		
		<label class="warning">(*)Either one of the detail should be entered</label>
			
<h2>Search Customer</h2><br/><br/>
	
	<!-- Enter SSN ID:<input type="number" name="Customer_SSN_ID"><br/>
	OR
	Enter Customer ID:<input type="number" name="Customer_ID"><br/>
	
	<input type="submit" name="search" value="View"><br/>
 -->
	
	
	
	<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="loginheading">
				
				</div>
				</div>
				
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Enter SSN ID*</label>
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group" name="Customer_SSN_ID" id="CustSSNID" aria-describedby="emailHelp">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">OR</label>
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Enter Customer ID*</label>
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group" name="Customer_ID" id="CustId" aria-describedby="emailHelp">
				</div>
				</div>
				
				
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="btnbox" style="text-align:center;">
				<button type="submit" name="search" class="btn btn-primary ">VIEW</button>
				</div>
				</div>
				</div>
				<br/>
		
	<% if(session.getAttribute("searchCustomerNotFound")!=null)
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
                  session.removeAttribute("searchCustomerNotFound");
                  
                  %>
	
	
	
	
	
	
		
	<!-- ***************including footer **********************-->
	<%@include file="footer.jsp" %>
   </div>
      
  </body>
</html>