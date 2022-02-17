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
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
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
					<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/instructor/list" >Instructor</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/course/list" >Course</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/student/list" >Student</a></li>
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
		<h3 class="title">INSTRUCTOR INFO</h3><br><br>
		<h1 style="font-weight: 550;">${ instructor.firstName} ${ instructor.lastName} </h1>
		<h4>${instructor.email }</h4>
		<br><br>
		
		<!-- add course link with instructor id  -->
		<c:url var="addCourse" value="/instructor/courseList">
			<c:param name="instructorId" value="${instructor.id }" />
		</c:url>
		
		
		<a href="${addCourse }"><button type="button" class="btn btn-success">Add Course</button></a><br><br><br>
		
		<!-- Start table courses -->
		<table class="table table-hover table-dark">
			<thead>
				<tr>
					<th colspan="4" style="text-align: center;">COURSES</th>
				</tr>
				<tr>
					<th>Course Code</th>
					<th>Course Name</th>
					<th>Description</th>
					<th>Action</th>
				</tr>
			</thead>
			<c:forEach var="tempInstructor" items="${instructor.courses}">
					<!-- remove course link with instructor id  -->
				<c:url var="removeCourse" value="/instructor/removeCourse">
					<c:param name="courseId" value="${tempInstructor.id }" />
					<c:param name="instructorId" value="${instructor.id }" />
				</c:url>
				<tr>
					<td>${tempInstructor.courseCode}</td>
					<td>${tempInstructor.courseName}</td>
					<td>${tempInstructor.description}</td>
					<td><a href="${removeCourse }"><button type="button" class="btn btn-danger" onclick="if (!(confirm('Are you sure you want to remove this course?'))) return false">Remove</button></a></td>
				</tr>
			</c:forEach>
		</table>
		<!-- End table courses -->
		
		<!-- update link with customer id  -->
		<c:url var="updateInstructor" value="/instructor/updateInsctructorForm">
			<c:param name="instructorId" value="${instructor.id }" />
		</c:url>

		<!-- delete link with customer id  -->
		<c:url var="deleteInstructor" value="/instructor/deleteInstructor">
			<c:param name="instructorId" value="${instructor.id }" />
		</c:url>
		
		<br><br>
		<a href="${updateInstructor }"><button type="button" class="btn btn-primary">Edit</button></a>  
		<a href="${deleteInstructor }" onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">
							<button type="button" class="btn btn-danger">Delete</button></a>
							
		<!-- Back button -->
		<br><br><br> 
		<button type="button" class="btn btn-dark" onclick="window.location.href='list'; return false;">Back</button>
	</div>

</body>
</html>