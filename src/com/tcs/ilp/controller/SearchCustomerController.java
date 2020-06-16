package com.tcs.ilp.controller;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.bean.CustomerBean;
import com.tcs.ilp.service.CustomerService;
//import com.tcs.ilp.service.UserService;


//@WebServlet("/SearchCustomerController")
public class SearchCustomerController extends HttpServlet {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

//	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id;
		CustomerBean fetchedCustomer=new CustomerBean();
		CustomerService cusService=new CustomerService();
//		PrintWriter out=response.getWriter();
		
		HttpSession session=request.getSession();	
//		session.setAttribute("searchCustomerStatus", "");
		
		if(!(request.getParameter("Customer_SSN_ID").equals("") || request.getParameter("Customer_SSN_ID")==null ))
		{
			id=Integer.parseInt(request.getParameter("Customer_SSN_ID"));
			fetchedCustomer=cusService.searchCustomer(id,"CI_Cus_SSN_ID",true);
		}
		else if(!(request.getParameter("Customer_ID").equals("") || request.getParameter("Customer_ID")==null ))
		{
			id=Integer.parseInt(request.getParameter("Customer_ID"));
			fetchedCustomer=cusService.searchCustomer(id,"CI_Customer_ID",true);
		}
		
		
		
		if(fetchedCustomer!=null)
		{
			//show customer details
			session.setAttribute("searchCustomerStatus", "found");
			session.setAttribute("searchCustomerNotFound", null);
			session.setAttribute("customer_ssn_id", fetchedCustomer.getCustomer_ssn_id());
			session.setAttribute("customer_id", fetchedCustomer.getCustomer_id());
			session.setAttribute("customer_name", fetchedCustomer.getCustomer_name());
			session.setAttribute("customer_age", fetchedCustomer.getCustomer_age());
			session.setAttribute("customer_address", fetchedCustomer.getCustomer_address());
			session.setAttribute("customer_state", fetchedCustomer.getCustomer_state());
			session.setAttribute("customer_city", fetchedCustomer.getCustomer_city());
			session.setAttribute("customer_isActive", fetchedCustomer.getCustomer_is_active());
			
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/accDetails.jsp");
//			out=response.getWriter();
			rd.forward(request, response);

		}
		else
		{
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/SearchCustomer.jsp");
			session.setAttribute("searchCustomerStatus", null);
			session.setAttribute("searchCustomerNotFound", "not found");
//		    out=response.getWriter();
//			out.print("<font color=red>No customer exists with the specified ID!</font>");
			rd.forward(request, response);
		}
		
	}

}
