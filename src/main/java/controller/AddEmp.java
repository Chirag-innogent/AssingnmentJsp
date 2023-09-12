package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Services.EmployeeServices;
import entities.Employee;

/**
 * Servlet implementation class AddEmp
 */
@WebServlet("/AddEmp")
public class AddEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
    EmployeeServices es= new EmployeeServices();
    RequestDispatcher rd;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstname = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String userName=request.getParameter("userName");
		int sal=Integer.parseInt(request.getParameter("salary"));
		String password=request.getParameter("password");
		boolean isAdmin=Boolean.valueOf(request.getParameter("isAdmin"));
		int id= Integer.parseInt(request.getParameter("id"));
		Employee emp=new Employee(id,firstname,lastName,password,isAdmin,sal,userName);
		es.addEmployee(emp);
		
	}

}
