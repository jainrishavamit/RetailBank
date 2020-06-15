package com.tcs.ilp.controller;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.bean.SearchExist;
import com.tcs.ilp.service.SearchService;

public class SearchExistServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
		String custId = request.getParameter("CustId");
		String accId =  request.getParameter("CustAccountId");
		SearchExist search = new SearchExist();
		
		if(custId.length()==0)
		{
			search.setAccId(Long.parseLong(accId));
			search.setCustId(0);
		}
		else if(accId.length()==0)
		{
			search.setCustId(Long.parseLong(custId));
			search.setAccId(0);
			
		}
		HttpSession session=request.getSession();
		SearchService serve = new SearchService();

		if(serve.findId(search))
		{
				session.setAttribute("searchCustomerStatus", "found");
				session.setAttribute("searchCustomerNotFound", null);
				session.setAttribute("customer_ssn_id", search.getCustomer_ssn_id());
				session.setAttribute("customer_id", search.getCustId());
				session.setAttribute("customer_name", search.getCustomer_name());
				session.setAttribute("customer_age", search.getCustomer_age());
				session.setAttribute("customer_address", search.getCustomer_address());
				session.setAttribute("customer_state", search.getCustomer_state());
				session.setAttribute("customer_city", search.getCustomer_city());
				
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/searchACC.jsp");
				rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/searchAC.jsp");
			session.setAttribute("searchCustomerStatus", null);
			session.setAttribute("searchCustomerNotFound", "not found");
			rd.forward(request, response);
		}
	}
}
