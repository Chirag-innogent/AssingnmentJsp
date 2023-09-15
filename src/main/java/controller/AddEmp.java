package controller;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

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
 * Servlet implementation class AddEmp
 */
@WebServlet("/AddEmp")
public class AddEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmployeeServices es = new EmployeeServices();
	RequestDispatcher rd;
	HttpSession session;
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddEmp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session= request.getSession();
		Employee employee=(Employee)session.getAttribute("emp");
		int id=Integer.parseInt(request.getParameter("id")) ;
		List <Employee> list= es.getData();
		Optional<Employee> delete=list.stream().filter(e->e.getId()==id).findFirst();
		if(delete.isPresent()) {
			if(!(delete.get().isAdmin())) {
				list.remove(delete.get()); 
			}
			
			request.setAttribute("msg", "Successfully Deleted");
		}
		request.setAttribute("list", es.getData());
		rd = request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		session = request.getSession();
//		Employee loginEmp=(Employee)session.getAttribute("emp");
		String firstname = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String userName = request.getParameter("userName");
		int sal = Integer.parseInt(request.getParameter("salary"));
		String password = request.getParameter("password");
		List<Employee> list = es.getData();
		boolean isAdmin = Boolean.valueOf(request.getParameter("isAdmin"));
		String operation = request.getParameter("operation");
		int id;
		if (!isAdmin)
			isAdmin = false;
		Optional<Employee> max = list.stream().max(Comparator.comparing(Employee::getId));
		Employee emp;
		System.out.println(operation);
		if (operation.equals("edit")) {
			id = Integer.parseInt(request.getParameter("id"));
			emp = new Employee(id, firstname, lastName, password, isAdmin, sal, userName);
			es.update(emp);
			
		} else if (operation.equals("add")) {
			if (max.isPresent()) {
				id = max.get().getId();
				id++;
			} else {
				id = 101;
			}
			emp = new Employee(id, firstname, lastName, password, isAdmin, sal, userName);
			Optional<Employee> first = list.stream().filter(e -> e.getId() == emp.getId()).findFirst();
			if (!first.isPresent()) {
				boolean addEmployee = es.addEmployee(emp);
				if (addEmployee) {
					request.setAttribute("msg", "successfully");				
				}
			} else {
				request.setAttribute("msg", "Employee Already exists");
			}
		} else {
			id = Integer.parseInt(request.getParameter("id"));
			emp = new Employee(id, firstname, lastName, password, isAdmin, sal, userName);
			es.deleteEmp(emp);
			request.setAttribute("msg", "Successfully Deleted");
			
		}
		request.setAttribute("list", es.getData());
		rd = request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);
	
	}
}
