<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>      
<%@page import="com.tcs.ilp.bean.TransactionBean"%>
<%@ page import = "java.io.*,java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Account Statement</h1>
      <form action="exporttoexcel" method="post">
         <%response.setHeader("Content-Disposition","attachment;filename=Account_Statement.xls"); %>
<table  border="1" id="dataTablegrid" >
	
		
					<tr>
                          <th>Transaction ID</th>
                          <th>Description</th>
                          <th>Date</th>
                          <th>Amount</th>
                                       
                    </tr>
					<%

					ArrayList<TransactionBean> transList=(ArrayList<TransactionBean>)session.getAttribute("xyz");
					
					//out.print(transList);
					
						
					for(TransactionBean trans: transList)
					{

					%>
					
					<tr>
					
						<td><% out.print(trans.getT_id()); %></td>
						<td><% out.print(trans.getT_description()); %></td>
						<td>
							<%
								SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
								out.print(ft.format(trans.getT_transaction_date())); 
						
							%>
						</td>
						<td><% out.print(trans.getT_amount()); %></td>
					
						
						
					</tr>
				
			
				<%
					}
				
				session.removeAttribute("xyz");
				%>
					
					
					
					
</table>         

      </form>

</body>
</html>