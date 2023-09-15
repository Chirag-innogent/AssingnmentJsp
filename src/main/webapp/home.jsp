<%@page import="java.util.List"%>
<%@page import="entities.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>Home</title>
</head>
<body class="container">
	<nav class="navbar navbar-light bg-light justify-content-between">
		<h1 class="navbar-brand ">Employee Management Software</h1>
		<form class="form-inline">
			<a href="Logout"  class=" form-control mr-sm-2 btn btn-primary">Logout</a>
		</form>
	</nav>

	<%!Employee emp;%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		response.setHeader("Progma", "no-cache");
		response.setHeader("Expires", "0");
		if (session.getAttribute("emp") == null ) {
			System.out.println("No object found");
			request.getRequestDispatcher("login.jsp").forward(request, response);		

		}
		emp = (Employee) session.getAttribute("emp");
		System.out.print("*****************");
		System.out.print(emp);

		if (emp.isAdmin()) {
			List<Employee> listOfEmployee = (List<Employee>) session.getAttribute("list");
	%>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">First</th>
				<th scope="col">Last</th>
				<th scope="col">Salary</th>
				<th scope="col">Operations</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Employee e : listOfEmployee) {
			%>
			<tr>
				<td scope="row"><%=e.getId()%></td>
				<td><%=e.getFirstName()%></td>
				<td><%=e.getLastName()%></td>
				<td><%=e.getSal()%></td>
				<td>
					<%
					if (e.isAdmin()) {
					%><a class="btn btn-danger text-light" disabled="disabled"
					name="operation" value="delete">N/A</a> <%
 } else {
 %><a class="btn btn-danger" href="AddEmp?id=<%=e.getId()%>"
					type="hidden" name="operation" value="delete">Delete</a> <%
 }
 %> <!-- Button trigger modal -->
					<button type="button" class="btn btn-success" data-toggle="modal"
						data-target="#<%=e.getId()%>" <%=e.getId()%>>Edit</button> <!-- Modal -->
					<div class="modal fade" id="<%=e.getId()%>" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<form action="AddEmp" method="post">
									<div class="modal-body">
										<div scope="row">First Name</div>
										<div>
											<input class="form-control" type="text" name="firstName"
												placeholder="FIrst Name" value="<%=e.getFirstName()%>">
										</div>

										<div scope="row">Last Name</div>
										<div>
											<input class="form-control" type="text" name="lastName"
												placeholder="Lasr Name" value="<%=e.getLastName()%>">
										</div>

										<div scope="row">Salary</div>
										<div>
											<input class="form-control" type="number" name="salary"
												placeholder="Salary" value="<%=e.getSal()%>">
										</div>

										<div scope="row">Password</div>
										<div>
											<input class="form-control" type="password" name="password"
												placeholder="Enter Password" value="<%=e.getPassword()%>">
										</div>
										<div>
											<input type="hidden" name="id" placeholder="Enter the id"
												value="<%=e.getId()%>">
										</div>
										<div scope="row">IsAdmin</div>
										<div>
											<%if(e.isAdmin()){ %>
											<input type="radio" name="isAdmin" class="clicked" readonly checked="checked" value="<%=e.isAdmin()%>" >
											<%}else{ %>
											<input type="radio" name="isAdmin" class="clicked"  value="true">
											<%} %>
										</div>
										<div scope="row">User Name</div>
										<div>
											<input type="text" name="userName" placeholder="User Name"
												value="<%=e.getUserName()%>">
										</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary" name="operation"
											value="edit">Save changes</button>
									</div>
							</div>
							</form>
						</div>
					</div>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<!-- 	<a class="btn btn-primary" href="addForm.jsp">Add Employee</a>
 -->
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModal">Add Employee</button>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="AddEmp" method="post">
						<div class="card ">
							<div class="card-body">
								<h5 class="card-title"></h5>
								<p class="card-text">
								<table class="table">
									<tbody>
										<tr>
											<th scope="row">First Name</th>
											<td><input class="form-control" type="text"
												name="firstName" placeholder="FIrst Name"></td>
										</tr>
										<tr>
											<th scope="row">Last Name</th>
											<td><input class="form-control" type="text"
												name="lastName" placeholder="Lasr Name"></td>
										</tr>
										<tr>
											<th scope="row">Salary</th>
											<td><input class="form-control" type="number"
												name="salary" placeholder="Salary"></td>
										</tr>
										<tr>
											<th scope="row">Password</th>
											<td><input class="form-control" type="password"
												name="password" placeholder="Enter Passwoed"></td>
										</tr>

										<tr>
											<th scope="row">IsAdmin</th>
											<td>True<input type="radio" name="isAdmin" value="true"></td>
											<td>False<input type="radio" name="isAdmin" value="false"></td>
										</tr>
										<tr>
											<th scope="row">User Name</th>
											<td><input type="text" name="userName"
												placeholder="User Name"></td>
										</tr>
									</tbody>
								</table>
								</p>

							</div>


						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary" name="operation"
								value="add">Add Employee</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%
	} else {
	%>
	<div class="card align-center" style="width: 18rem;">
		<div class="card-body">
			<h5 class="card-title"><%=emp.getId()%></h5>
			<p class="card-text">
			<table class="table">
				<tbody>
					<tr>
						<th scope="row">First Name</th>
						<td><%=emp.getFirstName()%></td>
					</tr>
					<tr>
						<th scope="row">Last Name</th>
						<td><%=emp.getLastName()%></td>
					</tr>
					<tr>
						<th scope="row">Salary</th>
						<td><%=emp.getSal()%></td>
					</tr>
					<tr>
						<th scope="row">User Name</th>
						<td><%=emp.getUserName()%></td>
					</tr>
				</tbody>
			</table>
			</p>
			<a href="updateEmploee.jsp" class="btn btn-primary">Edit Profile</a>
		</div>
	</div>
	<%
	}
	
	%>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>