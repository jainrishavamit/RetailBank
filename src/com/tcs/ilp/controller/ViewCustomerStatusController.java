package com.tcs.ilp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.tcs.ilp.bean.CustomerBean;
import com.tcs.ilp.service.CustomerService;

/**
 * Servlet implementation class ViewCustomerStatusController
 */

//@WebServlet("/ViewCustomerStatusController")
public class ViewCustomerStatusController extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doPost(request,response);
	}
	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CustomerService cusService=new CustomerService();
		PrintWriter out=response.getWriter();
		
		HttpSession session=request.getSession();
		
		ArrayList<CustomerBean> cus=new ArrayList<CustomerBean>();
		cus=cusService.viewCustomerStatus();
		
		if(cus!=null)
		{

			
			session.setAttribute("customerList", cus);
			request.setAttribute("customerListinrequest", cus);
			session.setAttribute("customerStatus", "customersFound");			
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/ViewCustomerStatus.jsp");
			out=response.getWriter();
			rd.forward(request, response);
			
			
		}
		else
		{
			session.setAttribute("customerStatus", "noCustomersToDisplay");
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/welcome.jsp");
			out=response.getWriter();
			rd.forward(request, response);
		}
		
		
	}
	

}
