<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student List</title>
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
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}" style="color: black;">Dashboard</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/instructor/list" >Instructor</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/course/list" >Course</a></li>
					<li class="nav-item"><a class="nav-link active" href="#" >Student</a></li>
					<%-- <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/address/list" >Address</a></li> --%>
				</ul>
				<!-- Left links -->
			</div>
			<!-- Collapsible wrapper -->

			<!-- Right elements -->
			<div class="d-flex align-items-center">
				<div class="navbar-nav ms-auto">
					<div class="dropdown">
						<a href="#" style="margin-right: 10px; text-decoration: none; color: black;" class="dropdown-toggle" data-bs-toggle="dropdown">Account</a>
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
		<h3 class="title">STUDENT</h3>
		<br>
		<br>

		<button type="button" class="btn btn-success"
			onclick="window.location.href='addStudentForm'; return false;">Add
			Student</button>
		<br>
		<br>
		<br>


		<table class="table table-hover table-dark">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
			</thead>

			<!-- loop over and print customers -->
			<c:forEach var="tempStudent" items="${student}">
			
				<!-- update link with customer id  -->
				<c:url var="viewStudent" value="/student/view">
					<c:param name="studentId" value="${tempStudent.id }" />
				</c:url>

				<tr>
					<td>${tempStudent.firstName }</td>
					<td>${tempStudent.lastName }</td>
					<td>${tempStudent.email }</td>
					<td><a href="${viewStudent }"><button type="button" class="btn btn-success">View</button></a></td>
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