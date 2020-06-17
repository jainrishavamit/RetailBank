package com.tcs.ilp.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.dao.CreateAccountdao_006;


@WebServlet
public class CreateAccountController_006 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CreateAccountController_006() {
        super();
        
    }

	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String CustomerId=req.getParameter("CustomerId");
		String AccountType = req.getParameter("AccountType");
		String DepositAmount=req.getParameter("DepositAmount"); 

	
		HttpSession session=req.getSession(); 
		
		if(AccountType.equals("Savings")){
			
			if(Integer.parseInt(DepositAmount)<500) {   
				session.setAttribute("minbal", "Minimum account balance for Savings account is 500"); 
				res.sendRedirect("CreateAccount_006.jsp");
			} else { 
				CreateAccountdao_006 cad = new CreateAccountdao_006(); 
				
			
				if(cad.Account(CustomerId)) { 
					if(!cad.checkcustomer(CustomerId, AccountType)) {
					if(cad.InsertAccount(CustomerId, AccountType, DepositAmount)) { 
					String AccID=cad.FindAccID(CustomerId, AccountType); 
					cad.AddTransection(AccID,DepositAmount,AccountType);
						session.setAttribute("message", "Account Created Successfully");  
					
						res.sendRedirect("CreateAccount_006.jsp");
					} 
					else {
						session.setAttribute("message", "Something went Wrong"); 
						res.sendRedirect("CreateAccount_006.jsp");
					}
					
				} else {
					session.setAttribute("AccExist", "Account already exist"); 
					res.sendRedirect("CreateAccount_006.jsp");
				}
				}
					else {
					session.setAttribute("message", "Customer Does Not Exist"); 
					res.sendRedirect("CreateAccount_006.jsp");
				}
				
				}
				}
				
			
			
		
		 else{
			 if(Integer.parseInt(DepositAmount)<1000) {  
				 session.setAttribute("minbal", "Minimum account balance for Current account is 1000");
				 res.sendRedirect("CreateAccount_006.jsp");
			 } else {
				 CreateAccountdao_006 cad = new CreateAccountdao_006();
					if(cad.Account(CustomerId)) {
						if(!cad.checkcustomer(CustomerId, AccountType)) {
						if(cad.InsertAccount(CustomerId, AccountType, DepositAmount)) {
							String AccID=cad.FindAccID(CustomerId, AccountType); 
							cad.AddTransection(AccID,DepositAmount,AccountType);
							session.setAttribute("message", "Account Created Successfully"); 
							res.sendRedirect("CreateAccount_006.jsp");
						} 
						else {
							session.setAttribute("message", "Something went Wrong"); 
							res.sendRedirect("CreateAccount_006.jsp");
						}
						
						} else {
							session.setAttribute("AccExist", "Account already exist"); 
							res.sendRedirect("CreateAccount_006.jsp");
						}
						
					} else {
						session.setAttribute("message", "Customer Does Not Exist"); 
						res.sendRedirect("CreateAccount_006.jsp");
					}
					
					}
			 }
		 
			 
	}	

}
