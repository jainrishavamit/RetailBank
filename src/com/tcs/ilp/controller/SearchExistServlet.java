package com.tcs.ilp.controller;

import java.io.IOException;
//import java.io.PrintWriter;
import java.io.PrintWriter;

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
			session.setAttribute("customer_cid", search.getCustId());
				if(search.getAccIdC()>0)
				{
					session.setAttribute("searchCustomerStatus", "found");
					session.setAttribute("searchCustomerNotFound", null);
					session.setAttribute("customer_acc_idC", search.getAccIdC());
					session.setAttribute("customer_balanceC", search.getBalanceC());
					session.setAttribute("customer_date_createC", search.getDateCreationC());
					session.setAttribute("customer_date_updateC", search.getDateUpdateC());
					session.setAttribute("customer_stateC", search.getStatusC());					
				}
				if(search.getAccIdS()>0)
				{
					session.setAttribute("searchCustomerStatus", "found");
					session.setAttribute("searchCustomerNotFound", null);
					session.setAttribute("customer_acc_idS", search.getAccIdS());
					session.setAttribute("customer_balanceS", search.getBalanceS());
					session.setAttribute("customer_date_createS", search.getDateCreationS());
					session.setAttribute("customer_date_updateC", search.getDateUpdateS());
					session.setAttribute("customer_stateS", search.getStatusS());
				}
				if(!(search.getAccIdS()>0) && !(search.getAccIdC()>0))
				{PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Failed: error occured');");
					out.println("location='searchAC.jsp';");
					out.println("</script>");
				}
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/searchACC.jsp");
				rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/searchAC.jsp");
			
			if(search.getCust()==1)
			{
				
				session.setAttribute("searchCustomerFound", "found");
				rd.forward(request, response);
			}
			else {
				session.setAttribute("searchCustomerStatus", null);
				session.setAttribute("searchCustomerNotFound", "not found");
				rd.forward(request, response);
				}
			
		}
	}
}
