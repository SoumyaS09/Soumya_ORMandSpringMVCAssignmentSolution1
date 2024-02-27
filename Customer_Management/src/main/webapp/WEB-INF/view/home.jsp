<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Customer Relationship Management</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="addCus">Add
							Customer</a></li>
				</ul>

			</div>
		</div>
	</nav>
	<div class=" container">
		<div class="row">
			<div class=" col-md-12">
				<div class="card">
					<div class="card-header txt center">
						<h4>All Customer Details</h4>
						<c:if test="${not empty msg }">
							<h5 class="text-success">${msg }</h5>
							<c:remove var="msg" />
						</c:if>
					</div>
					<div class="card-body">
						<table class="table table-hover table-bordered border-primary ">
							<thead class="table-dark">

								<tr>
									<th scope="col">Id</th>
									<th scope="col">First Name</th>
									<th scope="col">Last Name</th>
									<th scope="col">Email</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${cusList }" var="cus">
									<tr>
										<th scope="row">${cus.id }</th>
										<td>${cus.firstName }</td>
										<td>${cus.lastName }</td>
										<td>${cus.email }</td>
										<td><a href="editCus/${cus.id}"
											class="btn btn-sm btn-primary">Edit</a> <a
											href="deleteCus/${cus.id }"
											onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false"
											class="btn btn-sm btn-danger">Delete</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>