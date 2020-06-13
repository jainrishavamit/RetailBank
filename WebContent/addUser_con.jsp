<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.HashMap,java.util.List,java.util.Arrays" %>
<html lang="en">




<%-- login status validation --%><%--
<%
	String roleAllowed="customer_account_exe";  // change to "cashier" for cashier specific pages

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
  
	--%>
	


	

%>





  <head>
  <!-- you can include other files from here -->
  
   <script type="text/javascript" src="js/addUser.js"> </script>
   





<%-- *****************  including header file ***************** --%>

	<%@include file="header.jsp" %>



    <!-- Begin page content -->
    <div class="container">
	
	<div class="boxcontainer">
	
	
<%
	HashMap<String,List<String>> statesAndCities=new HashMap<String,List<String>>();

	statesAndCities.put("Madhya Pradesh", Arrays.asList("Bhopal","Indore","Jabalpur","Gwalior"));
	statesAndCities.put("Maharashtra", Arrays.asList("Dhule","Jalgaon","Pune"));
	statesAndCities.put("Uttar Pradesh", Arrays.asList("Agra","Lucknow","Moradabad"));
	
%>	

		<form id="form1" action="AddCustomerServlet" method="post" onsubmit="return checkFields();">
		
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="loginheading">
				<label> Create Customer</label>
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Customer SSN Id* </label>
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group" name="cusSsnId" id="cusSsnId" required onkeypress="return onlyNumbers(event);"  aria-describedby="SSN Id of customer" 
					<%
						if(request.getParameter("cusSsnId")!=null){
							out.print(" value='"+request.getParameter("cusSsnId")+"'");
						}else{
							out.print(" autofocus");
						}
					%>>
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Customer Name* </label>
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group" name="cusName" id="cusName" required onkeypress="return onlyChar(event);"  aria-describedby="Name of customer"
					<%
						if(request.getParameter("cusName")!=null){
							out.print(" value='"+request.getParameter("cusName")+"'");
						}
					%>>
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Age* </label>
					<input type="number" class=" col-md-8 col-xs-8 col-sm-8 control-group" name="age" id="age"  required aria-describedby="Enter age" min=1 max=125 
					<%
						if(request.getParameter("age")!=null){
							out.print(" value='"+request.getParameter("age")+"'");
						}
					%>>
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Address* </label>
					<input type="text" name="address" class=" col-md-8 col-xs-8 col-sm-8 control-group" id="address" required aria-describedby="address of customer"
					<%
						if(request.getParameter("address")!=null){
							out.print("value='"+request.getParameter("address")+"'");
						}
					%>>
				</div>
				</div>
				
				
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">State * </label>
				<select class="col-md-8 col-xs-8 col-xs-8 control-group" name="state" id="state" onchange="submitToSelf()">
				<option value=0 selected disabled>Select</option>
				
				<% 
					String states[]=statesAndCities.keySet().toArray(new String[statesAndCities.keySet().size()]);
					for(String state:states){
						out.print("<option"); 
								
								if(request.getParameter("state")!=null)
									if(request.getParameter("state").equals(state))
										out.print(" selected ");
							out.print(">"+state+"</option>");
					}
				%>
				</select>
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">City* </label>
				<select class="col-md-8 col-xs-8 col-xs-8 control-group" name=city id=city>
				<option value=0 selected disabled>Select</option>
				<%
				
				if(request.getParameter("state")!=null){
					List<String> cities=statesAndCities.get(request.getParameter("state"));
					Object []citiesArray=cities.toArray();
					for(Object city:citiesArray){
						String c=city.toString();
						out.print("<option value='"+c+"'>"+c+"</option>");
					}
				}else
					out.println("<option disabled>Select state first</option>");
				
				%>
				</select>
				</div>
				</div>
				<label class="warning">(*)Fields are compulsory</label>
				
				
					<div class="form-group">
	<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="btnbox" style="text-align:center;">
				<button type="submit" class="btn btn-primary ">Submit</button>
				<button type="reset" class="btn btn-primary ">Reset</button>
				</div>
				</div>
				</div>
				
			</form>
</div>

	<!-- ***************including footer **********************-->
	<%@include file="footer.jsp" %>
   </div>
      
  </body>
</html>