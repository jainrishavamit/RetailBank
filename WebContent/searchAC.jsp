<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">

<%-- login status validation --%>
<%
	String roleAllowed="cashier";  // change to "customer_account_executive" for customer_account_executive specific pages

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
  
  <head>
  <!-- you can include other files from here -->
  
   <script type="text/javascript" src="js/searchAC.js"> </script>

<%-- *****************  including header file ***************** --%>

	<%@include file="header.jsp" %>



    <!-- Begin page content -->
    <div class="container">
	
	<div class="boxcontainer">
	
	
	
	
	
		<form id="form1" action="SearchExistServlet" method="post" onsubmit="return checkFields();">
	
				
	<label class="warningnew">(*)Either one of the detail should be entered</label>
	
<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="loginheading">
				
				</div>
				</div>
				
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-4 col-xs-4 col-sm-4">Account ID*</label>
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group" name=CustAccountId id="CustAccountId"  onkeypress="return onlyNumbers(event);" aria-describedby="emailHelp">
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
					<input type="text" class=" col-md-8 col-xs-8 col-sm-8 control-group" name=CustId id="CustId"  onkeypress="return onlyNumbers(event);" aria-describedby="emailHelp">
				</div>
				</div>
				
				
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="btnbox" style="text-align:center;">
				<button type="submit" class="btn btn-primary ">VIEW</button>
				</div>
				</div>
				</div>
				</form>
				<% if(session.getAttribute("searchCustomerNotFound")!=null)
                  { 

                  	%><script>alert("No Customer exists with the specified ACC/Cust ID!")</script><%

                  }
				%> <% if(session.getAttribute("searchCustomerFound")!=null)
                { 

                	%><script>alert("Customer exists with No account")</script><%

                }
				 if(session.getAttribute("depositStatus")=="done")
                { 

                	%>
                	<script>alert("Deposit Success");</script>
                	<form id="form2" action="SearchExistServlet" method="post">
                	
                	<input type="hidden" name=CustAccountId >
                	<input type="hidden" name="CustId" value="<%  out.print(session.getAttribute("CustId"));%>">
                	</form>
                		<script>document.forms["form2"].submit();
                		</script>
                	<%
                }
                if(session.getAttribute("WithdrawStatus")=="done")
                { 

                	%>
                	<script>alert("Withdrawl Success");</script>
                	<form id="form3" action="SearchExistServlet" method="post">
                	
                	<input type="hidden" name=CustAccountId >
                	<input type="hidden" name="CustId" value="<%  out.print(session.getAttribute("CustId"));%>">
                	</form>
                		<script>document.forms["form3"].submit();
                		</script>
                	<%
                }
                if(session.getAttribute("transferStatus")=="done")
                { 

                	%>
                	<script>alert("Transfer Success");</script>
                		<form id="form4" action="SearchExistServlet" method="post">
                	
                	<input type="hidden" name=CustAccountId >
                	<input type="hidden" name="CustId" value="<%  out.print(session.getAttribute("CustId"));%>">
                	</form>
                		<script>document.forms["form4"].submit();
                		</script>
                	<%
                }
                if(session.getAttribute("account")=="NoAcc")
                { 

                	%>
                	<script>alert("Destination Account not exist");</script>
                		<script>alert("Transfer Success");</script>
                		<form id="form5" action="SearchExistServlet" method="post">
                	
                	<input type="hidden" name=CustAccountId >
                	<input type="hidden" name="CustId" value="<%  out.print(session.getAttribute("CustId"));%>">
                	</form>
                		<script>document.forms["form5"].submit();
                		</script>
                	<%
                }
                if(session.getAttribute("accountStatus")=="InActive")
                { 

                	%>
                	<script>alert("Destination Account Id InActive");</script>
                		<script>alert("Transfer Success");</script>
                		<form id="form6" action="SearchExistServlet" method="post">
                	
                	<input type="hidden" name=CustAccountId >
                	<input type="hidden" name="CustId" value="<%  out.print(session.getAttribute("CustId"));%>">
                	</form>
                		<script>document.forms["form6"].submit();
                		</script>
                	<%
                }
				 if(session.getAttribute("depositStatus")=="failed")
	                { 

	                	%><script>alert("failed Transaction")</script><%

	                }
				 session.removeAttribute("account");
				 session.removeAttribute("accountStatus");
				 session.removeAttribute("transferStatus");
	            session.removeAttribute("WithdrawStatus");
				session.removeAttribute("CustId");
				session.removeAttribute("depositStatus");
				session.removeAttribute("customer_cid");
				session.removeAttribute("customer_acc_idC");
				session.removeAttribute("customer_balanceC");
				session.removeAttribute("customer_date_createC");
				session.removeAttribute("customer_date_updateC");
				session.removeAttribute("customer_stateC");
				session.removeAttribute("customer_acc_idS");
				session.removeAttribute("customer_balanceS");
				session.removeAttribute("customer_date_createS");
				session.removeAttribute("customer_date_updateC");
				session.removeAttribute("customer_stateS");
                  
                  %>
	
				
	
		
</div>

	<!-- ***************including footer **********************-->
	<%@include file="footer.jsp" %>
   </div>
      
  </body>
</html>