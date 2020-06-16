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
  }
  
 %>
  





  <head>
  <!-- you can include other files from here -->

	<title>Update Customer</title>  
   <script type="text/javascript" src="js/updateCustomer.js"> </script>
   





<%-- *****************  including header file ***************** --%>

	<%@include file="header.jsp" %>

	
	
	    <!-- Begin page content -->
    <div class="container">
	
	<div class="boxcontainer">
	
	
		<form id="form1" action="UpdateCustomerController" method="post" onsubmit="return checkFields();">
		
		<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="loginheading">
				<label> Update Customer </label>
				</div>
				</div>
				
				
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Select:</label>
					<select name="searchCriteria" id="searchCriteria" class=" col-md-8 col-xs-8 col-sm-8 control-group">
						<option  disabled selected value="None">Select Searching Criteria</option>
						<option value="CI_Customer_ID" 
						<%if(request.getParameter("searchCriteria")!=null && request.getParameter("searchCriteria").equals("CI_Customer_ID")) out.print(" selected "); %>
						>Customer ID</option>
						<option value="CI_Cus_SSN_ID"
						<%if(request.getParameter("searchCriteria")!=null && request.getParameter("searchCriteria").equals("CI_Cus_SSN_ID")) out.print(" selected "); %>
						>Customer SSN ID</option>
					</select>
				</div>
				</div>
				
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Value:</label>
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group" id="CustSSNID" name="searchValue"  onkeypress="return onlyNumbers(event);" value="<% if(session.getAttribute("search_value")!=null){ out.print(session.getAttribute("search_value")); } %>" aria-describedby="emailHelp">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="btnbox" style="text-align:center;">
				<input type="submit" name="btn_operation" class="btn btn-primary " value="Search">
				</div>
				</div>
				</div>
				
				
				<%
	
		if(session.getAttribute("searchCustomerStatus")!=null && session.getAttribute("searchCustomerStatus").equals("found"))
		{
	
	%>
				
				
				
				
<!-- 				<div class="col-md-12 col-sm-12 col-xs-12"> -->
<!-- 				<div class="loginheading"> -->
<!-- 				<label> Enter the new details: </label> -->
<!-- 				</div> -->
<!-- 				</div>				 -->
				
				
				
				
				<!-- 	input fields -->
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Customer SSN Id </label>
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group" id="CustSSNID" aria-describedby="emailHelp" value="<%=session.getAttribute("customer_ssn_id") %>" disabled>
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Customer Id </label>
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group" id="CustId" aria-describedby="emailHelp" value="<%=session.getAttribute("customer_id") %>" disabled>
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Old Customer Name </label>
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group" id="CustName" aria-describedby="emailHelp" value="<%=session.getAttribute("customer_name") %>" disabled>
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">New Customer Name* </label>
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group"  onkeypress="return onlyChars(event);" id="CustNameNew" aria-describedby="emailHelp" placeholder="Enter the new name" required>
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Old Address </label>
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group" id="CustAddress" aria-describedby="emailHelp" value="<%=session.getAttribute("customer_address") %>" disabled>
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">New Address* </label>
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group" id="CustAddressNew"  name="New_Address" placeholder="Enter the new address" required>
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Old Age </label>
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group" id="CustAge" aria-describedby="emailHelp" value="<%=session.getAttribute("customer_age") %>" disabled>
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">New Age* </label>
					<input type="number" min=0 max=125 required class=" col-md-8 col-xs-8 col-sm-8 control-group" id="CustAgeNew" aria-describedby="emailHelp" name="New_Age" placeholder="Enter the new age">
				</div>
				</div>
				
				
			
			<!-- 	hidden fields -->
	
	<input type="hidden" name="Customer_SSN_ID" value="<%=session.getAttribute("customer_ssn_id") %>"><br/>
	<input type="hidden" name="Customer_ID" value="<%=session.getAttribute("customer_id") %>"><br/>
	<input type="hidden" name="Old_Customer_Name" value="<%=session.getAttribute("customer_name") %>"><br/>
	<input type="hidden" name="Old_Address" value="<%=session.getAttribute("customer_address") %>"><br/>
	<input type="hidden" name="Old_Age" value="<%=session.getAttribute("customer_age") %>"><br/>
	<input type="hidden" name="State" value="<%=session.getAttribute("customer_state") %>"><br/>
	<input type="hidden" name="City" value="<%=session.getAttribute("customer_city") %>"><br/>
			
				
				
				
			
<!-- 				<label class="warning">(*)Fields are compulsory</label> -->
				
			
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="btnbox" style="text-align:center;">
				<input type="submit" class="btn btn-primary " name="btn_operation" value="Update" >
				</div>
				</div>
				</div>	
				
				
				<%
	
		}
		else if(session.getAttribute("searchCustomerStatus")!=null && session.getAttribute("searchCustomerStatus").equals("notFound"))
		{
			%><script>alert("Either customer is not found or customer is inactive!")</script><%
			
		}
		

	session.removeAttribute("searchCustomerStatus");
	
	
	if(session.getAttribute("customer_updated")!=null && session.getAttribute("customer_updated").equals("updated"))
	{
		%><script>alert("Customer Details Updated Successfully!")</script><%
		//session.removeAttribute("customer_not_updated");
		session.removeAttribute("customer_updated");
		
	}
	else if(session.getAttribute("customer_updated")!=null && session.getAttribute("customer_updated").equals("NotUpdated"))
	{
		%><script>alert("Failed to update Customer Details!")</script><%
		session.removeAttribute("customer_updated");
	}
	

	session.removeAttribute("customer_updated");
	session.removeAttribute("search_value");
	
	%>
				
				
					
			
		</form>
</div>

	<!-- ***************including footer **********************-->
	<%@include file="footer.jsp" %>
   </div>
      
	

</body>
</html>