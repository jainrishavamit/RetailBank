package com.tcs.ilp.controller;

import java.io.IOException;
import java.io.PrintWriter;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.ilp.dao.NewCustDAo;
import com.tcs.ilp.bean.NewCustomer;
public class AddCustomerServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/* Get values from jsp to create new customer
	 * validation is done at UI using JS 
	 * 
	 * 
	 * */
	 protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
		
		 Long custSSNId = Long.parseLong(request.getParameter("cusSsnId"));
		String custName = request.getParameter("cusName");
		int age = Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		
			
			NewCustomer newCust = new NewCustomer();
			newCust.setAddress(address);
			newCust.setAge(age);
			newCust.setCity(city);
			newCust.setCusomerName(custName);
			newCust.setCustomerSSNId(custSSNId);
			newCust.setState(state);
			PrintWriter out = response.getWriter();
			
			
			if(NewCustDAo.insertCust(newCust)) {
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Customer added Sucessfully');");
				out.println("location='addUser.jsp';");
				out.println("</script>");
			}
			else
			{
				if(newCust.getCustomerSSNId()== -1)
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Failed: Customer with same SSN Id exists');");
					out.println("location='addUser.jsp';");
					out.println("</script>");
				}
				else if(newCust.getCustomerSSNId()== -2)
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Failed: DBConnection error');");
					out.println("location='addUser.jsp';");
					out.println("</script>");
				}
				else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Failed');");
				out.println("location='addUser.jsp';");
				out.println("</script>");
				}
			}
	}	
}
