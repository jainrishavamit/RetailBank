package com.tcs.ilp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.dao.DeleteAccountdao_007;

@WebServlet
public class DeleteAccountController_007 extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2719867873185253049L;

	/**
	 * 
	 */

	public DeleteAccountController_007() {
		super();

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String CustomerId = req.getParameter("CustomerId");
		String AccountType = req.getParameter("AccountType");
		DeleteAccountdao_007 del = new DeleteAccountdao_007();
		HttpSession session = req.getSession();

		boolean result = del.DeleteAccount(CustomerId, AccountType);
		if (result) {
			session.setAttribute("DeleteMessage", "Account is deleted successfully");
			res.sendRedirect("DeleteAccount_007.jsp");
		} else {
			session.setAttribute("DeleteMessage", "Please Enter correct Account id or Account type");
			res.sendRedirect("DeleteAccount_007.jsp");
		}
	}
}
