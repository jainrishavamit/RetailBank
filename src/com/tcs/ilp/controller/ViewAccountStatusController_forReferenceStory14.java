package com.tcs.ilp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.bean.AccountBean;
//import com.tcs.ilp.bean.CustomerBean;
import com.tcs.ilp.service.AccountService;
//import com.tcs.ilp.service.CustomerService;


/**
 * Servlet implementation class ViewAccountStatusController
 */

//@WebServlet("/ViewAccountStatusController")

public class ViewAccountStatusController_forReferenceStory14 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		AccountService accService=new AccountService();
		PrintWriter out=response.getWriter();
		
		HttpSession session=request.getSession();
		
		ArrayList<AccountBean> acc=new ArrayList<AccountBean>();
		acc=accService.viewAccountStatus();
		
		if(acc!=null)
		{

			
			session.setAttribute("accountList", acc);
			request.setAttribute("accountListinrequest", acc);
			session.setAttribute("accountStatus", "accountsFound");			
			if(request.getParameter("save_as_excel")!=null)
			{
				
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/xyz.jsp");
				out=response.getWriter();
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/ViewAccountStatus.jsp");
				out=response.getWriter();
				rd.forward(request, response);
			}
			
			
		}
		else
		{
			session.setAttribute("accountStatus", "noAccountsToDisplay");
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/welcome.jsp");
			out=response.getWriter();
			rd.forward(request, response);
		}
		
		
		
	}

}
