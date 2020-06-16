package com.tcs.ilp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.bean.DepWithBean;
import com.tcs.ilp.service.Deposervice;


public class DepositServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
		;
		String  type =  request.getParameter("type");
		Long accId = Long.parseLong(request.getParameter("accId"));
		String  status =  request.getParameter("status");
		Long custId = Long.parseLong(request.getParameter("custId"));
		
		if(type.matches("W"))
		{
			
			Long  depAmt =  Long.parseLong(request.getParameter("withAmt"));
			DepWithBean depo = new DepWithBean();
			depo.setAccId(accId);
			depo.setAmount(depAmt);
			depo.setStatus(status);
			depo.setType(type);
			depo.setCustId(custId);
			HttpSession session=request.getSession();
			Deposervice serve = new Deposervice();
			if(serve.doWith(depo))
			{
				session.setAttribute("WithdrawStatus", "done");
				session.setAttribute("CustId", depo.getCustId());
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/searchAC.jsp");
				rd.forward(request, response);
			}
			else 
			{
				session.setAttribute("depositStatus", "failed");
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/searchAC.jsp");
				rd.forward(request, response);
			}
		}
		else if(type.matches("T"))
		{
			String  source =  request.getParameter("source");
			Long DesAccId = Long.parseLong(request.getParameter("ToAcc"));
			Long  depAmt =  Long.parseLong(request.getParameter("TrfAmt"));
			DepWithBean depo = new DepWithBean();
			depo.setAccId(accId);
			depo.setCustId(custId);
			depo.setStatus(status);
			depo.setType(type);
			depo.setAmount(depAmt);
			depo.setDesAccId(DesAccId);
			depo.setSource(source);
			HttpSession session=request.getSession();
			Deposervice serve = new Deposervice();
			if(serve.doTransfer(depo)) 
			{
				session.setAttribute("transferStatus", "done");
				session.setAttribute("CustId", depo.getCustId());
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/searchAC.jsp");
				rd.forward(request, response);
			}
			else
			{
				if(depo.getDesAccId()<0) 
				{
					session.setAttribute("account", "NoAcc");
					session.setAttribute("CustId", depo.getCustId());
					RequestDispatcher rd=getServletContext().getRequestDispatcher("/searchAC.jsp");
					rd.forward(request, response);
				}
			else if(depo.getStatus().equals("InActive"))
				{
					session.setAttribute("accountStatus", "InActive");
					session.setAttribute("CustId", depo.getCustId());
					RequestDispatcher rd=getServletContext().getRequestDispatcher("/searchAC.jsp");
					rd.forward(request, response);
				}
				else
				{
					session.setAttribute("depositStatus", "failed");
					RequestDispatcher rd=getServletContext().getRequestDispatcher("/searchAC.jsp");
					rd.forward(request, response);
				}
				
			}
		}
		else
		{
			
			Long  depAmt =  Long.parseLong(request.getParameter("depAmt"));
			DepWithBean depo = new DepWithBean();
			depo.setAccId(accId);
			depo.setAmount(depAmt);
			depo.setStatus(status);
			depo.setType(type);
			depo.setCustId(custId);
			HttpSession session=request.getSession();
			Deposervice serve = new Deposervice();
			if(serve.doAdd(depo))
			{
				session.setAttribute("depositStatus", "done");
				session.setAttribute("CustId", depo.getCustId());
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/searchAC.jsp");
				rd.forward(request, response);
			}
			else
			{
				session.setAttribute("depositStatus", "failed");
				RequestDispatcher rd=getServletContext().getRequestDispatcher("/searchAC.jsp");
				rd.forward(request, response);
			}
		}
			
	}
	

}
