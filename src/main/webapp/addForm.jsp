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
<body class="container text-center">
	<h1>Hello, world!</h1>
	<form action="AddEmp" method="post">
	<div class="card " style="width: 50rem;">
		<div class="card-body">
			<h5 class="card-title"></h5>
			<p class="card-text">
			<table class="table">
				<tbody>
					<tr>
						<th scope="row">First Name</th>
						<td><input class="form-control" type="text" name="firstName" placeholder="FIrst Name"></td>
					</tr>
					<tr>
						<th scope="row">Last Name</th>
						<td><input class="form-control" type="text" name="lastName" placeholder="Lasr Name"></td>
					</tr>
					<tr>
						<th scope="row">Salary</th>
						<td><input class="form-control" type="number" name="salary" placeholder="Salary"></td>
					</tr>
					<tr>
						<th scope="row">Password</th>
							<td><input class="form-control" type="password" name="password" placeholder="Enter Passwoed"></td>
					</tr>
					<tr>
						<th scope="row">Id</th>
							<td><input class="form-control" type="number" name="id" placeholder="Enter the id"></td>
					</tr>
					<tr>
						<th scope="row">IsAdmin</th>
							<td><input class="form-control" type="checkbox" name="isAdmin" value="true" ></td>
					</tr>
					<tr>
						<th scope="row">User Name</th>
							<td><input class="form-control" type="text" name="userName" placeholder="User Name"></td>
					</tr>
				</tbody>
			</table>
			</p>
			<button  class="btn btn-primary" type="submit">Add</input>
		</div>
		</form>
	</div>
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