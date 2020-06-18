<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page import="java.util.ArrayList"%>      
<%@page import="com.tcs.ilp.bean.TransactionBean"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
	
	<%-- login status validation --%>
<%
	String roleAllowed="cashier";  // change to "cashier" for cashier specific pages

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
  
	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Statement</title>
</head>
<style>

.boxcontainer {
	width: 100%;
	margin: 11% 0% 0% 9%;
}

html {
	position: relative;
	min-height: 100%;
}

body {
	margin-bottom: 60px;
}

.loginheading {
	font-size: 25px;
	position: absolute;
	top: -66px;
	right: 125px;
}

.form-group {
	
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	margin-bottom: 10px;
}

input[type="text"] {
	font-size: 15px;
	width: 140px;
	min-width: 100px;
	padding: 1%;
	height: 30px
}

#transId {
	margin-top: 10%;
} 
.btnbox{
          color: yellow;
          background-color: black;
          text-align: center;
          padding: 1%;  
          width: 110px;  
          margin-left: 50%
          
}
</style> 
<script type="text/javascript">

    function getAccStatement(){
    	if(document.getElementById('lastTransaction').checked){
    		document.getElementById('not').style.visibility='visible';
    		document.getElementById('dtra').style.visibility='hidden';
    	} else {
    		document.getElementById('not').style.visibility='hidden';
    		document.getElementById('dtra').style.visibility='visible';
    	}
    }


</script>
<body>
	<%
		response.setHeader("Cache-Control", "no-store,must-revalidate");
	%>

	<%@include file="header.jsp"%>
	

		<div class="boxcontainer">

			<form action="AccStatementController_014" method="post">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="loginheading">
						<label> Account Statement</label>
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<label class="col-md-4 col-xs-4 col-sm-4">Account ID*</label> <input
							type="text" placeholder="Enter Account Id" id="custId"
							name="AccountId" required="required"> <br>
						<br> <input type="radio" name="ChooseTransaction" id="lastTransaction"
							value="LastTransaction" onclick="getAccStatement()"> <label> Last Number of
							Transaction</label> 
						<br> <input type="radio" name="ChooseTransaction" id="dateTransaction"
							value="TransactionBYDate" onclick="getAccStatement()"> <label> Start-End Dates</label>

					</div> </div> 
					<div style="font-size: 15px !important; padding-top: 20px !important;text-align: center; visibility: hidden; " id="not" > <br> <br>
				           <b><br>Number of Transaction </b> <select name="noOfTransaction"> 
				                <% for(int i=1;i<51;i++){ %>
				          <option value="<%=i%>" >&nbsp;&nbsp;<%=i %></option> 
				                <% } %>
				                </select>
</div>     
                             <div style="font-size: 15px !important; text-align: center; visibility: hidden;" id="dtra">
                   <b> Start Date</b> <input
							type="date" placeholder="dd/mm/yyyy" id="custId"
							name="StartDate" >
		
                      <b><br><br> End Date</b> <input
							type="date" placeholder="dd/mm/yyyy" id="custId"
							name="EndDate">
 
 </div>    <b style="color: red">(*)Fields are mandatory</b> <br>
		<button type="submit" class="btnbox">Submit</button>
		
		
		
		<%
		
				//show the fetched results
				if(session.getAttribute("transStatus")!=null && session.getAttribute("transStatus").equals("transFound"))
	{
		
					%><!--  <script>alert("Found!")</script>--><%
	

		
	%>
	
				
			<div id="div_to_print" class="center">	
						<h1>Account Statement </h1>
<!-- 				<table border="1" class="table table-bordered table-hover" id="result_table" > -->
				
				
				
					<table  border="1" id="dataTablegrid" >
	
	
				
					<tr>
                          <th>Transaction ID</th>
                          <th>Description</th>
                          <th>Date</th>
                          <th>Amount</th>
                                       
                    </tr>
					<%

					ArrayList<TransactionBean> transList=(ArrayList<TransactionBean>)request.getAttribute("transList");
					for(TransactionBean trans: transList)
					{

					%>
					
					<tr>
					
						<td><% out.print(trans.getT_id()); %></td>
						<td><% out.print(trans.getT_description()); %></td>
						<td>
							<%
								SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss aa");
								out.print(ft.format(trans.getT_transaction_date())); 
						
							%>
						</td>
						<td><% out.print(trans.getT_amount()); %></td>
					
						
						
					</tr>
				
				<%
					}
				
				%>

</table>
	</div>
				<button class="btn" id="print_as_pdf" href="#" onClick="javascript:PrintDiv();">PRINT AS PDF</button>
				<input type="button" class="btn" name="save_as_excel" value="save_as_excel" id="save_as_excel" onClick="javascript:window.location.href='xyz.jsp'" >
				
	         
	         <%
					
				session.removeAttribute("transStatus");
	}
	else if(session.getAttribute("transStatus")!=null && session.getAttribute("transStatus").equals("noTransactionsToDisplay"))
	{
		
		%><script>alert("No Transactions Found!"+session.getAttribute("Statementmessage"))</script><%
		session.removeAttribute("transStatus");
	}
	else if(session.getAttribute("Statementmessage")!=null)
	{
		%><script>alert(session.getAttribute("Statementmessage"))</script><%
		//session.removeAttribute("transStatus");
	}
				
				%>
				
				
				</form>
				
	         </div>
	                            
	<div>

		<%@include file="footer.jsp"%>

	</div>

</body>


<script language="javascript">
        function PrintDiv() {
            var divToPrint = document.getElementById('div_to_print');
            var popupWin = window.open('', '_blank', 'width=766,height=300');
            popupWin.document.open();
            popupWin.document.write('<html><body onload="window.print()">' + divToPrint.innerHTML + '</body></html>');
            popupWin.document.close();
        }

    </script>
    

</html>

