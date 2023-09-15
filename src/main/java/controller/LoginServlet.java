package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Services.EmployeeServices;
import entities.Employee;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmployeeServices es= new EmployeeServices();
		RequestDispatcher rd;
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String operation = request.getParameter("operation");
		if(operation.equals("login")) {
			Employee emp = es.login(userName, password);
			System.out.println(emp);
			if(emp!=null) {
				if(emp.isAdmin())
				request.setAttribute("list", es.list);
				
				HttpSession session= request.getSession(true);
				session.setAttribute("emp", emp);
				session.setAttribute("list", es.list);
				
				response.sendRedirect("home.jsp");
			}else {
				request.setAttribute("msg", "Invalid UserName or Password");
				
				rd= request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		}
		
	}

}
