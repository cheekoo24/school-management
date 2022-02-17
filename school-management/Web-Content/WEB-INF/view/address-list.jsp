<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Course List</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body class="bg-secondary text-white">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<!-- Container wrapper -->
		<div class="container-fluid">
			<!-- Toggle button -->
			<button class="navbar-toggler" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<!-- Navbar brand -->
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}" style="color: black;">Dashboard</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/instructor/list" >Instructor</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/course/list" >Course</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/student/list" >Student</a></li>
					<!-- <li class="nav-item"><a class="nav-link active" href="#" >Address</a></li> -->
				</ul>
				<!-- Left links -->
			</div>
			<!-- Collapsible wrapper -->

			<!-- Right elements -->
			<div class="d-flex align-items-center">
				<div class="navbar-nav ms-auto">
					<div class="dropdown">
						<a href="#" style="margin-right: 10px; text-decoration: none; color: black; width: 20px" class="dropdown-toggle" data-bs-toggle="dropdown">Account</a>
						<div class="dropdown-menu dropdown-menu-end">
							<a href="#" class="dropdown-item">Profile</a> 
							<a href="#" class="dropdown-item">Settings</a>
							<a href="#" class="dropdown-item">Log Out</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Right elements -->
		</div>
		<!-- Container wrapper -->
	</nav>
	<!-- Navbar -->

	<div class="container mt-3">
		<h3 class="title">STUDENT ADDRESS</h3>
		<br>
		<br>

		<!-- <button type="button" class="btn btn-primary"
			onclick="window.location.href='addAddressForm'; return false;">Add
			Address</button> -->
		<br>
		<br>
		<br>

		<table class="table table-hover table-dark">
			<thead>
				<tr>
					<th>Address</th>
					<th>City</th>
					<th>Province</th>
					<th>Postal Code</th>
					<!-- <th>Action</th> -->
				</tr>
			</thead>

			<!-- loop over and print customers -->
			<c:forEach var="tempAddress" items="${address}">

				<!-- update link with customer id  -->
			<%-- 	<c:url var="updateAddress" value="/address/updateAddressForm">
					<c:param name="addressId" value="${tempAddress.id }" />
				</c:url>

				<!-- delete link with customer id  -->
				<c:url var="deleteAddress" value="/address/deleteAddress">
					<c:param name="addressId" value="${tempAddress.id }" />
				</c:url> --%>


				<tr>
					<td>${tempAddress.address }</td>
					<td>${tempAddress.city }</td>
					<td>${tempAddress.province }</td>
					<td>${tempAddress.postalCode }</td>
					<%-- <td><a href="${updateAddress }"><i style="color: white;" class='far fa-edit'></i></a>
						| <a href="${deleteAddress }"
						onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">
							<i style="color: white;" class='far fa-trash-alt'></i>
					</a></td> --%>
				</tr>
			</c:forEach>

		</table>

		<br>
		<br>
		<br> <a href="${pageContext.request.contextPath}/index.jsp"><button
				type="button" class="btn btn-dark">Back</button></a>
	</div>
</body>
</html>