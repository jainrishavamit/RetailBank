<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%--Importing all the dependent classes--%>
    
<%@page import="java.util.ArrayList"%>      
<%@page import="com.tcs.ilp.bean.AccountBean"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>

<!DOCTYPE html>
<html>
   


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
  
   <script type="text/javascript" src="js/viewCustomerStatus.js"> </script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   





<%-- *****************  including header file ***************** --%>

	<%@include file="header.jsp" %>

  
  
      <!-- Begin page content -->
    <div class="container">
	
	<div class="boxcontainer">
	
	
	<form id="form1" action="ViewAccountStatusController" method="post" onsubmit="">
		
			
		<h2>Account Status</h2><br/><br/>
		
	
	<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="loginheading">
				</div>
	</div>
	
	
	
	<%
	
	if(session.getAttribute("accountStatus")!=null && session.getAttribute("accountStatus").equals("accountsFound"))
	{
		
		
	

		
	%>
	
				
<!-- 			<div class="table-responsive mt-3" id="div_to_print">	 -->
						
<!-- 				<table border="1" class="table table-bordered table-hover" id="result_table" > -->
				
				
				
					<table  border="1" id="dataTablegrid">
	
	<!-- 					table header -->
				
					<tr>
                          <th>Customer ID</th>
                          <th>Account ID</th>
                          <th>Account Type</th>
                          <th>Account Status</th>
                          <th>Message</th>
                          <th>Last Updated</th>
                          <th>Operations</th>              
                    </tr>
					
					
					

					
					<%


					ArrayList<AccountBean> accList=(ArrayList<AccountBean>)request.getAttribute("accountListinrequest");
					for(AccountBean acc: accList)
					{

						
						
						       
					
					%>
					
					
					
<!-- 					table row entries -->
					
					<tr>
					
						<td><% out.print(acc.getCustomer_id()); %></td>
						<td><% out.print(acc.getAccount_id()); %></td>
						<td><% out.print(acc.getAccount_type()=="S"?"<P>Savings</P>":"<P>Current</P>"); %></td>
						<td><% out.print(acc.getAccount_status()==1?"<P STYLE=COLOR:GREEN>ACTIVE</P>":"<P STYLE=COLOR:RED>INACTIVE</P>"); %></td>
						<td><% out.print(acc.getAccount_message()); %></td>
						<td>
							<%
								SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss aa");
								out.print(ft.format(acc.getLast_updated())); 
						
							%>
						</td>
						<td><a href="ViewAccountStatusController">Refresh</a></td>
					
						
						
					</tr>
				
				<%
					}
				
				%>
				
				</table>
				
				
				
				<%
					
				session.removeAttribute("accountStatus");
	}
	else if(session.getAttribute("accountStatus")!=null && session.getAttribute("accountStatus").equals("noAccountsToDisplay"))
	{
		
		%><script>alert("No Accounts Found!")</script><%
		session.removeAttribute("accountStatus");
	}
	//else
	//{
		
		//session.removeAttribute("accountStatus");
	//}
				
				%>
				

		
	</form>
</div>

	<!-- ***************including footer **********************-->
	<%@include file="footer.jsp" %>
	
   </div>
      


</body>
<script>

$(document).ready(function() {
	  var totalRows = $('#dataTablegrid').find('tbody tr:has(td)').length;
	  var recordPerPage = 5;
	  var totalPages = Math.ceil(totalRows / recordPerPage);
	  var $pages = $('<div id="pages"></div>');
	  for (i = 0; i < totalPages; i++) {
	    $('<A style="cursor:pointer"><span class="pageNumber">&nbsp;' + (i + 1) + '</span></A>').appendTo($pages);
	  }
	  $pages.appendTo('#dataTablegrid');

	  $('.pageNumber').hover(
	    function() {
	      $(this).addClass('focus');
	    },
	    function() {
	      $(this).removeClass('focus');
	    }
	  );

	  $('table').find('tbody tr:has(td)').hide();
	  var tr = $('table tbody tr:has(td)');
	  for (var i = 0; i <= recordPerPage - 1; i++) {
	    $(tr[i]).show();
	  }
	  $('span').click(function(event) {
	    $('#dataTablegrid').find('tbody tr:has(td)').hide();
	    var nBegin = ($(this).text() - 1) * recordPerPage;
	    var nEnd = $(this).text() * recordPerPage - 1;
	    for (var i = nBegin; i <= nEnd; i++) {
	      $(tr[i]).show();
	    }
	  });
	});


</script>

<script type="text/css">

.focus {
  background-color: #ff00ff;
  color: #fff;
  cursor: pointer;
  font-weight: bold;
}

.pageNumber {
  padding: 2px;
}

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td,
th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}



</script>
</html>