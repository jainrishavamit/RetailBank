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

import com.tcs.ilp.bean.TransactionBean;
import com.tcs.ilp.dao.AccStatementdao_014;
import com.tcs.ilp.service.TransactionService;


@WebServlet
public class AccStatementController_014 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AccStatementController_014() {
        super();
       
    }
    
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	doPost(req,res);
    }
    
    
   
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException { 
		int AccountId=Integer.parseInt(req.getParameter("AccountId"));
		String ChooseTransaction=req.getParameter("ChooseTransaction");
		int noOfTransaction = Integer.parseInt(req.getParameter("noOfTransaction")); 
		String StartDate  = req.getParameter("StartDate"); 
		String EndDate = req.getParameter("EndDate");  
		
		HttpSession session=req.getSession();
		
		AccStatementdao_014 asd = new AccStatementdao_014();
		TransactionService transService=new TransactionService();
		ArrayList<TransactionBean> transList=new ArrayList<TransactionBean>();
		PrintWriter out=res.getWriter();
		

		
		
		if(asd.Account(AccountId)) 
		{
			if(ChooseTransaction.equals("LastTransaction")) 
			{
				
				//find transactions by no of transactions
				transList=transService.getTransaction(AccountId, noOfTransaction);
				if(transList!=null)
				{
					//transactions available
					session.setAttribute("transList", transList);
					req.setAttribute("transList",transList);
					session.setAttribute("xyz", transList);
					session.setAttribute("transStatus", "transFound");			
					if(req.getParameter("save_as_excel")!=null)
					{
						
						RequestDispatcher rd=getServletContext().getRequestDispatcher("/xyz.jsp");
						out=res.getWriter();
						rd.forward(req, res);
					}
					else
					{
						RequestDispatcher rd=getServletContext().getRequestDispatcher("/AccStatement_014.jsp");
						out=res.getWriter();
						rd.forward(req, res);
					}
					

				}
				else
				{
					//transactions not available
					session.setAttribute("transStatus", "noTransactionsToDisplay");
					RequestDispatcher rd=getServletContext().getRequestDispatcher("/AccStatement_014.jsp");
					out=res.getWriter();
					rd.forward(req, res);
					
				}
			} 
			else if(ChooseTransaction.equals("TransactionBYDate"))
			{
				
				
				//find transactions by no of transactions
				transList=transService.getTransactionBetweenDates(AccountId, StartDate,EndDate);
				if(transList!=null)
				{
					//transactions available
					session.setAttribute("transList", transList);
					req.setAttribute("transList",transList);
					session.setAttribute("xyz", transList);
					session.setAttribute("transStatus", "transFound");			
					if(req.getParameter("save_as_excel")!=null)
					{
						
						RequestDispatcher rd=getServletContext().getRequestDispatcher("/xyz.jsp");
						out=res.getWriter();
						rd.forward(req, res);
					}
					else
					{
						RequestDispatcher rd=getServletContext().getRequestDispatcher("/AccStatement_014.jsp");
						out=res.getWriter();
						rd.forward(req, res);
					}
					


				}
				else
				{
					//transactions not available
					session.setAttribute("transStatus", "noTransactionsToDisplay");
					RequestDispatcher rd=getServletContext().getRequestDispatcher("/AccStatement_014.jsp");
					out=res.getWriter();
					rd.forward(req, res);
					
				}				
				
				
			}
		}
		else 
		{
			session.setAttribute("Statementmessage", "Accounts Does Not Exist"); 
			res.sendRedirect("AccStatement_014.jsp");
		}
	}

}
