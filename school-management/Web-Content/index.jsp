<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>
<body class="bg-secondary text-white">
	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding-top: 10px; padding-bottom: 10px;">
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
				<ul class="navbar-nav me-auto mb-2 mb-lg-0" >
					<li class="nav-item"><a class="nav-link active" href="#" >Dashboard</a></li>
					<li class="nav-item"><a class="nav-link" href="instructor/list" >Instructor</a></li>
					<li class="nav-item"><a class="nav-link" href="course/list" >Course</a></li>
					<li class="nav-item"><a class="nav-link" href="student/list" >Student</a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="address/list" style="color: black;">Address</a></li> -->
				</ul>
				<!-- Left links -->
			</div>
			<!-- Collapsible wrapper -->

			<!-- Right elements -->
			<div class="d-flex align-items-center">
				<div class="navbar-nav ms-auto">
					<div class="dropdown">
						<a href="#" style="margin-right: 10px; text-decoration: none; color: black;" class="dropdown-toggle" data-bs-toggle="dropdown" >Account</a>
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
	
	<!-- Title Page -->
	<div class="p-5 bg-dark text-white text-center">
	  <h1>School Management</h1>
	  <p>Personal Project Created By: Herman Redona</p> 
	</div>

</body>


</html>