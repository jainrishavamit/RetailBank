
package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean;
import service.UserService;

public class LoginController extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException,ServletException{
		String l_username=req.getParameter("Userid");
		String password = req.getParameter("Password");
		String msg="";
		UserBean user=new UserBean();
		user.setL_username(l_username);
		user.setL_password(password);
		UserService userService=new UserService();
		PrintWriter out=res.getWriter();

		HttpSession session=req.getSession();
		if(userService.verifyUser(user)) {
			session.setAttribute("isLoggedIn", true);
			session.setAttribute("loginUserRole",user.getL_role());
			//out.print("Welcome to the world of servlets");
			//out.print("user is : "+ user);
			RequestDispatcher rd=getServletContext().getRequestDispatcher("/welcome.html");
			rd.forward(req, res);
			
		}else {
				session.setAttribute("login_msg", "Incorrect user name or password");
				res.sendRedirect("login.jsp");
		}
	}
	

}
