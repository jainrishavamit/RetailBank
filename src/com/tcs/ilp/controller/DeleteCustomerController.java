package com.tcs.ilp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.bean.CustomerBean;
import com.tcs.ilp.service.CustomerService;

/**
 * Servlet implementation class DeleteCustomerController
 */

//@WebServlet("/DeleteCustomerController")
public class DeleteCustomerController extends HttpServlet {
	//private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		CustomerBean fetchedCustomer=new CustomerBean();
		CustomerService cusService=new CustomerService();
		PrintWriter out=response.getWriter();
		
		HttpSession session=request.getSession();
		
		
		//search customer by ID or SSN ID
		
		if(request.getParameter("btn_operation").equals("Search"))
		{
			String search_criteria=request.getParameter("searchCriteria");
			int search_value=Integer.parseInt(request.getParameter("searchValue"));
			session.setAttribute("search_value", search_value);
		
			fetchedCustomer=cusService.searchCustomer(search_value, search_criteria,false);
		
			if(fetchedCustomer!=null)
			{
				
				//set customer details in session
				
				session.setAttribute("searchCustomerStatus", "found");
				//session.setAttribute("searchCustomerNotFound", null);
				session.setAttribute("customer_ssn_id", fetchedCustomer.getCustomer_ssn_id());
				session.setAttribute("customer_id", fetchedCustomer.getCustomer_id());
				session.setAttribute("customer_name", fetchedCustomer.getCustomer_name());
				session.setAttribute("customer_age", fetchedCustomer.getCustomer_age());
				session.setAttribute("customer_address", fetchedCustomer.getCustomer_address());
				session.setAttribute("customer_state", fetchedCustomer.getCustomer_state());
				session.setAttribute("customer_city", fetchedCustomer.getCustomer_city());
			
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/DeleteCustomer.jsp");
				out=response.getWriter();
				rd.forward(request, response);
				
			}
			else
			{
				session.setAttribute("searchCustomerStatus", "notFound");
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/DeleteCustomer.jsp");
				//session.setAttribute("searchCustomerStatus", null);
				//session.setAttribute("searchCustomerNotFound", "not found");
				rd.forward(request, response);
			}
		
		}
		
		
		
		//delete customer on clicking delete button
		
		if(request.getParameter("btn_operation").equals("Delete"))
		{
		
			
			CustomerBean cus=new CustomerBean();
			int cus_id=Integer.parseInt(request.getParameter("Customer_ID"));
			cus.setCustomer_id(cus_id);
			if(cusService.hasActiveAccounts(cus)) {

				session.setAttribute("customer_deleted", "hasActiveAccount");
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/DeleteCustomer.jsp");
				rd.forward(request, response);
			}
			
//			if(request.getParameter("Customer_SSN_ID")!="" || request.getParameter("Customer_SSN_ID")!=null)
//			{
			
//				int ssn_id=Integer.parseInt(request.getParameter("Customer_SSN_ID"));
//				String name=request.getParameter("Customer_Name");
//				int age=Integer.parseInt(request.getParameter("Age"));
//				String address=request.getParameter("Address");
//				String state=request.getParameter("State");
//				String city=request.getParameter("City");
			
//				CustomerBean cus_obj=new CustomerBean(ssn_id,cus_id,new_name,new_age_of_cus,new_address,state,city);
				
					else{
						boolean customerDeletedStatus=cusService.deleteCustomer(cus_id,"CI_Customer_ID");
						if(customerDeletedStatus) {
							//customer deleted successfully
							
							session.setAttribute("customer_deleted", "deleted");
							//session.setAttribute("customer_not_updated", null);
							RequestDispatcher rd=getServletContext().getRequestDispatcher("/DeleteCustomer.jsp");
							out=response.getWriter();
							rd.forward(request, response);
						}
						else
						{
							//failed to delete customer
							
							session.setAttribute("customer_deleted", "notDeleted");
							//session.setAttribute("customer_not_updated", "not updated");
							RequestDispatcher rd=getServletContext().getRequestDispatcher("/DeleteCustomer.jsp");
							rd.forward(request, response);
						}
					}
//			}
//			else
//			{
//				
//				RequestDispatcher rd=getServletContext().getRequestDispatcher("/DeleteCustomer.jsp");
//				out=response.getWriter();
//				rd.forward(request, response);
//			}
		
		}
		
		
	}
	

}
