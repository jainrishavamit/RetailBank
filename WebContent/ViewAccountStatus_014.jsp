<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%--Importing all the dependent classes--%>
    
<%@page import="java.util.ArrayList"%>      
<%@page import="com.tcs.ilp.bean.AccountBean"%>
<%@ page import = "java.io.*,java.util.*,javax.servlet.*,java.text.*"%>



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
				
			<div id="div_to_print">	
						
<!-- 				<table border="1" class="table table-bordered table-hover" id="result_table" > -->
				
					<table  border="1" id="dataTablegrid" >
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
				
			</div>	
				
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
			
			<a id="print_as_pdf" href="#" onClick="javascript:PrintDiv();">PRINT AS PDF</a>
			<input type="button" name="save_as_excel" value="save_as_excel" id="save_as_excel" onClick="javascript:window.location.href='xyz.jsp'" >
<!-- 			<input type="button" value="Export To Excel" onClick="javascript:window.location.href='xyz.jsp'"/> -->
		
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

<script language="javascript">
        function PrintDiv() {
            var divToPrint = document.getElementById('div_to_print');
            var popupWin = window.open('', '_blank', 'width=766,height=300');
            popupWin.document.open();
            popupWin.document.write('<html><body onload="window.print()">' + divToPrint.innerHTML + '</body></html>');
            popupWin.document.close();
        }

    </script>
    
    
    <script type="text/javascript">
        function fnExcelReport() {
            var tab_text = 'html xmlns:x="urn:schemas-microsoft-com:office:excel">';
            tab_text = tab_text + '<head><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>';
            tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
            tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
            tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';

            tab_text = tab_text + "<center><b>Transaction Statement</b></center>"

            tab_text = tab_text + "<table border='1px solid'>";
            tab_text = tab_text + $('#dataTablegrid').html();
            tab_text = tab_text + '</table></body></html>';

            var data_type = 'data:application/vnd.ms-excel';

            $('#save_as_excel').attr('href', data_type + ',' + encodeURIComponent(tab_text));
            $('#save_as_excel').attr('download', 'TransactionStatement.xls');

        }

    </script>
    
    <script>
//     response.setContentType("application/vnd.ms-excel");
//     response.setHeader("Pragma", "public");
//     response.setHeader("Cache-Control", "max-age=0");
    
    </script>
</html>