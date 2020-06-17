<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.HashMap,java.util.List,java.util.Arrays" %>
<html lang="en">
<%-- login status validation --%>
 <%
	 String roleAllowed="cashier";  // change to "cashier" for cashier specific pages

	if(session.getAttribute("isLoggedIn")==null || !(session.getAttribute("isLoggedIn").equals("true"))){

		session.setAttribute("login_msg", "Please login first to continue");
		response.sendRedirect("login.jsp");
	}

	else if(session.getAttribute("loginUserRole")==null || !(session.getAttribute("loginUserRole").equals(roleAllowed))){
	
		session.setAttribute("redirect_msg", "You dont have rights to access previous page that you tried to access ");
		response.sendRedirect("welcome.html");
	}
	
	else if(session.getAttribute("redirect_msg")!=null){   %>
 	<script>alert("<%=session.getAttribute("redirect_msg") %>")</script> 
	<% 
		session.removeAttribute("redirect_msg");  
  }
  %>
   
  <head>
  <!-- you can include other files from here -->
  
  	
  <title>Search Account</title>
   <script type="text/javascript" src="js/searchAC.js"> </script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 </head>
	<%@ include file="header.jsp" %>
 
<% //String foundStatus=(String)session.getAttribute("searchCustomerStatus");
		if(session.getAttribute("searchCustomerStatus")!=null)
		{ %>
			
			
				
				<div class="container">
				<div class="boxcontainer">
				
			
				<form id="form1" action="DepositServlet" method="post">
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Customer ID: </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" name="custId" readonly value="<%  out.print(session.getAttribute("customer_cid"));%>">
				</div>
				</div>
				
				<% if(session.getAttribute("customer_acc_idC")!=null){ %>
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Current Account ID: </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" name="accId" readonly value="<%  out.print(session.getAttribute("customer_acc_idC"));%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Current Account Balance: </label>
<input type="text" id="availableCurrentBalance" class=" col-md-6 col-xs-6 col-sm-6 control-group" readonly value="<%  out.print(session.getAttribute("customer_balanceC")+".00");%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Current account created on:  </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" readonly value="<%  out.print(session.getAttribute("customer_date_createC"));%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Current account updated on: </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" readonly value="<%  out.print(session.getAttribute("customer_date_updateC"));%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Current account Status:  </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" name="status" readonly value="<%  out.print(session.getAttribute("customer_stateC"));%>">
				</div>
				</div>
				<hr style="height:1px;width:100%;background-color:#000;">
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Deposit Amount :  </label>
<input type="number" min=1 required id="depSelfCurrent" class=" col-md-6 col-xs-6 col-sm-6 control-group" name="depAmt">
				</div>
				</div>
				<input type="hidden" value="C" name="type">
				
				
					<% if(session.getAttribute("customer_acc_idC")!=null){ %>
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="btnbox" style="text-align:center;">
				<button type="submit" class="btn btn-primary " >Deposit To Current Account</button>
				</div>
				</div>
				</div>
				</form>
				</div>
				</div>
				<form id="currWithdraw" action="DepositServlet" method="post">
				<div class="container">
				<div class="boxcontainer">
				<div class="form-group">
				<input type="hidden" name="custId" value="<%  out.print(session.getAttribute("customer_cid"));%>">
				<input type="hidden" name="accId" value="<%  out.print(session.getAttribute("customer_acc_idC"));%>">
				<input type="hidden" name="status" value="<%  out.print(session.getAttribute("customer_stateC"));%>">
				<input type="hidden" name="type" value="W">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Withdraw Amount :  </label>
<input type="number" min=1 max=<%=session.getAttribute("customer_balanceC")%> required class=" col-md-6 col-xs-6 col-sm-6 control-group" name="withAmt">
				</div>
				</div>
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="btnbox" style="text-align:center;">
				<button type="submit" class="btn btn-primary " >Withdraw From Current Account</button>
				</div>
				</div>
				</div>
				</div>
				</div>
				</form>
				<form id="Transfer" action="DepositServlet" method="post"   onsubmit="return checkAccIdC();">
				<div class="container">
				<div class="boxcontainer">
				<div class="form-group">
				<input type="hidden" name="custId" value="<%  out.print(session.getAttribute("customer_cid"));%>">
				<input type="hidden" name="accId" value="<%  out.print(session.getAttribute("customer_acc_idC"));%>">
				<input type="hidden" name="status" value="<%  out.print(session.getAttribute("customer_stateC"));%>">
				<input type="hidden" name="type" value="T">
				<input type="hidden" name="source" value="C">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-3 col-xs-3 col-sm-3">Transfer Amount :  </label>
<input type="number" min=1 max=<%=session.getAttribute("customer_balanceC")%> required class=" col-md-3 col-xs-3 col-sm-3 control-group" name="TrfAmt">
					<label  class="col-md-3 col-xs-3 col-sm-3">To Account Id :  </label>
<input type="number" required class=" col-md-3 col-xs-3 col-sm-3 control-group" name="ToAcc" id="toAccIdC">
				</div>
				</div>
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="btnbox" style="text-align:center;">
				<button type="submit" class="btn btn-primary "  >Transfer From Current Account</button>
				</div>
				
				</div>
				</div>
				</div>
				</div>
				<br>	
				<% } %>
				<hr style="height:2px;width:100%;background-color:#000;">
				

				</form>
				
				<% }if(session.getAttribute("customer_acc_idS")!=null){  %>
				
				<div class="container">
				<div class="boxcontainer">
				
			
				<form id="form1" action="DepositServlet" method="post">
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Saving Account ID: </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" name="accId" readonly value="<%  out.print(session.getAttribute("customer_acc_idS"));%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Saving Acc Balance: </label>
<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" readonly value="<%  out.print(session.getAttribute("customer_balanceS")+".00");%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Saving account created:  </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" readonly value="<%  out.print(session.getAttribute("customer_date_createS"));%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Saving account updated: </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" readonly value="<%  out.print(session.getAttribute("customer_date_updateC"));%>">
				</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Saving account Status:  </label>
					<input type="text" class=" col-md-6 col-xs-6 col-sm-6 control-group" name="status" readonly value="<%  out.print(session.getAttribute("customer_stateS"));%>">
				</div>
				</div>
				
				<hr style="height:1px;width:100%;background-color:#000;">
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Deposit Amount :  </label>
<input  type="number" min=1  required  class=" col-md-6 col-xs-6 col-sm-6 control-group" name="depAmt">
				</div>
				</div>
				<input type="hidden" name="custId" value="<%  out.print(session.getAttribute("customer_cid"));%>">
				<input type="hidden" value="S" name="type">
					<% if(session.getAttribute("customer_acc_idS")!=null){ %>
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="btnbox" style="text-align:center;">
				<button type="submit" class="btn btn-primary " >Deposit To Saving Account</button>
				</div>
				</div>
				</div>
				</form>
				</div>
				</div>
				<form id="saveWithdraw" action="DepositServlet" method="post">
				<div class="container">
				<div class="boxcontainer">
				<div class="form-group">
				<input type="hidden" name="custId" value="<%  out.print(session.getAttribute("customer_cid"));%>">
				<input type="hidden" name="accId" value="<%  out.print(session.getAttribute("customer_acc_idS"));%>">
				<input type="hidden" name="status" value="<%  out.print(session.getAttribute("customer_stateS"));%>">
				<input type="hidden" name="type" value="W">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-6 col-xs-6 col-sm-6">Withdraw Amount :  </label>
<input  type="number" min=1 max=<%=session.getAttribute("customer_balanceS")%> required  class=" col-md-6 col-xs-6 col-sm-6 control-group" name="withAmt">
				</div>
				</div>
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="btnbox" style="text-align:center;">
				<button type="submit" class="btn btn-primary " >Withdraw From Saving Account</button>
				</div>
				</div>
				</div>
				</div>
				</div>
				</form>
				<form id="TransferSave" action="DepositServlet" method="post"  onsubmit="return checkAccIdS();">
				<div class="container">
				<div class="boxcontainer">
				<div class="form-group">
				<input type="hidden" name="custId" value="<%  out.print(session.getAttribute("customer_cid"));%>">
				<input type="hidden" name="accId" value="<%  out.print(session.getAttribute("customer_acc_idS"));%>">
				<input type="hidden" name="status" value="<%  out.print(session.getAttribute("customer_stateS"));%>">
				<input type="hidden" name="type" value="T">
				<input type="hidden" name="source" value="S">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<label  class="col-md-3 col-xs-3 col-sm-3">Transfer Amount :  </label>
<input  type="number" min=1 max=<%=session.getAttribute("customer_balanceS")%> required  class=" col-md-3 col-xs-3 col-sm-3 control-group" name="TrfAmt">
					<label  class="col-md-3 col-xs-3 col-sm-3">To Account Id :  </label>
<input type="number" required class=" col-md-3 col-xs-3 col-sm-3 control-group" name="ToAcc"  id="toAccIdS">
				</div>
				</div>
				<div class="form-group">
				<div class="col-md-12 col-sm-12 col-xs-12"> -->
				<div class="btnbox" style="text-align:center;">
				<button type="submit" class="btn btn-primary " >Transfer From Saving Account</button>
				</div>
				</div>
				</div>
				</div>
				</div>
				<br>	
				<% } %>
				<hr style="height:2px;width:100%;background-color:#000;">
				

				</form>
				
					<%            		  
                  }
		}
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
	</body>
</html>