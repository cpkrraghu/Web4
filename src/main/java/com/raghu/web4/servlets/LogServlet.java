package com.raghu.web4.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.imcs.raghu.bonus.pojo.User;
import com.raghu.web4.util.LoginManager;

/**
 * Servlet implementation class LogServlet
 */
@WebServlet("/log")
public class LogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher rd;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("hidden");
		HttpSession session=request.getSession();
		
		if(action.equalsIgnoreCase("login")){
			validateLogin(request,response);
		}else{
			session.invalidate();
			request.setAttribute("loginMsg", "User logged out successfully!");
			rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}

	private void validateLogin(HttpServletRequest request, HttpServletResponse response) {
		String uName=request.getParameter("userId");
		String pwd=request.getParameter("pwd");
		User user=LoginManager.getUser(uName);
		if(user!=null && user.getPassword().equals(pwd)){
			request.getSession().setAttribute("user", uName);
			rd=request.getRequestDispatcher("pages/home.jsp");
		}else if(user!=null){
			request.setAttribute("loginMsg", "Password Incorrect");
			rd=request.getRequestDispatcher("login.jsp");
		}else{
			request.setAttribute("loginMsg", "User does not Exist. Please try again!");
			rd=request.getRequestDispatcher("login.jsp");
		}
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
