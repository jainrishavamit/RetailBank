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

//import org.graalvm.compiler.nodes.calc.IsNullNode;

import com.tcs.ilp.bean.CustomerBean;
import com.tcs.ilp.service.CustomerService;


//@WebServlet("/UpdateCustomerController")
public class UpdateCustomerController extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	
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
			
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/UpdateCustomer.jsp");
				out=response.getWriter();
				rd.forward(request, response);
				
			}
			else
			{
				session.setAttribute("searchCustomerStatus", "notFound");
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/UpdateCustomer.jsp");
				//session.setAttribute("searchCustomerStatus", null);
				//session.setAttribute("searchCustomerNotFound", "not found");
				rd.forward(request, response);
			}
		
		}
		
		
		
		//update customer info on clicking Update btn
		
		if(request.getParameter("btn_operation").equals("Update"))
		{
		
			
			if(request.getParameter("Customer_SSN_ID")!="" || request.getParameter("Customer_SSN_ID")!=null)
			{
			
				int ssn_id=Integer.parseInt(request.getParameter("Customer_SSN_ID"));
				int cus_id=Integer.parseInt(request.getParameter("Customer_ID"));
				String old_name=request.getParameter("Old_Customer_Name");
				String new_name=request.getParameter("New_Customer_Name");
				String old_address=request.getParameter("Old_Address");
				String new_address=request.getParameter("New_Address");
				int old_age=Integer.parseInt(request.getParameter("Old_Age"));
				//int new_age=Integer.parseInt(request.getParameter("New_Age"));
				String new_age=request.getParameter("New_Age");
				int new_age_of_cus;
				if(new_age==null || new_age.equals(""))
				{
					new_age_of_cus=old_age;
				}
				else
				{
					new_age_of_cus=Integer.parseInt(new_age);
				}
				
				if(new_name==null || new_name.equals(""))
				{
					new_name=old_name;
				}
							

				if(new_address==null || new_address.equals(""))
				{
					new_address=old_address;
				}
		

				String state=request.getParameter("State");
				String city=request.getParameter("City");
			
				CustomerBean cus_obj=new CustomerBean(ssn_id,cus_id,new_name,new_age_of_cus,new_address,state,city);
				boolean customerUpdatedStatus=cusService.updateCustomer(cus_obj);
				
				if(customerUpdatedStatus)
				{
					//customer information updated successfully
					
					session.setAttribute("customer_updated", "updated");
					//session.setAttribute("customer_not_updated", null);
					RequestDispatcher rd=getServletContext().getRequestDispatcher("/UpdateCustomer.jsp");
					out=response.getWriter();
					rd.forward(request, response);
				}
				else
				{
					//failed to update customer information
					
					session.setAttribute("customer_updated", "NotUpdated");
					//session.setAttribute("customer_not_updated", "not updated");
					RequestDispatcher rd=getServletContext().getRequestDispatcher("/UpdateCustomer.jsp");
					rd.forward(request, response);
				}
				
			}
			else
			{
				
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/UpdateCustomer.jsp");
				out=response.getWriter();
				rd.forward(request, response);
			}
		
		}
		
	}

}
