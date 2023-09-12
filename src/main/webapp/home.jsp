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

<title>Hello, world!</title>
</head>
<body class="container">
	<h1>Welcome To Home Page</h1>
	<%!Employee emp;%>
	<%
	emp = (Employee) session.getAttribute("emp");
	if (emp.isAdmin()) {
		List<Employee> listOfEmployee=(List<Employee>)request.getAttribute("list");
		
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
			<%for(Employee e:listOfEmployee) {%>
			<tr>
				<td scope="row"><%=e.getId() %>
				</th>
				<td><%=e.getFirstName() %></td>
				<td><%=e.getLastName() %></td>
				<td><%=e.getSal() %></td>
				<td><a></a></td>
			</tr>
			<% }%>
		</tbody>
	</table>
	<a class="btn btn-primary" href="addForm.jsp">Add Employee</a>
	<%
	}else{
	%>
	<div class="card align-center" style="width: 18rem;">
		<div class="card-body">
			<h5 class="card-title"><%=emp.getId() %></h5>
			<p class="card-text">
			<table class="table">
  <tbody>
    <tr>
      <th scope="row">First Name</th>
      <td><%=emp.getFirstName() %></td>
    </tr>
    <tr>
      <th scope="row">Last Name</th>
      <td><%=emp.getLastName() %></td>
    </tr><tr>
      <th scope="row">Salary</th>
      <td><%=emp.getSal() %></td>
    </tr>
    <tr>
      <th scope="row">User Name</th>
      <td><%=emp.getUserName() %></td>
    </tr>
  </tbody>
</table>
			</p>
			<a href="#" class="btn btn-primary">Go somewhere</a>
		</div>
	</div>
<% }%>
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