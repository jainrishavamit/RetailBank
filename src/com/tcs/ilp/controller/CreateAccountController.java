package com.tcs.ilp.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.dao.CreateAccountdao;


@WebServlet
public class CreateAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CreateAccountController() {
        super();
        
    }

	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String CustomerId=req.getParameter("CustomerId");
		String AccountType = req.getParameter("AccountType");
		String DepositAmount=req.getParameter("DepositAmount"); 

	
		HttpSession session=req.getSession();
		
	CreateAccountdao cad = new CreateAccountdao();
	if(cad.Account(CustomerId)) {
		if(cad.InsertAccount(CustomerId, AccountType, DepositAmount)) {
			session.setAttribute("Success_msg", "Account Created Successfully"); 
			res.sendRedirect("CreateAccount.jsp");
		} 
		else {
			session.setAttribute("error_msg", "Something went Wrong"); 
			res.sendRedirect("CreateAccount.jsp");
		}
		
	} else {
		session.setAttribute("NotExist", "Customer Does Not Exist"); 
		res.sendRedirect("CreateAccount.jsp");
	}
	
	}

}
