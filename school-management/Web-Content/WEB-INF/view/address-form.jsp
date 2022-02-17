<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Address Form</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body class="p-3 mb-2 bg-secondary text-white">
	<div class="container mt-3">

		<h3 class="title">ADDRESS FORM</h3>

		<div class="form">
			<form:form class="form" action="saveAddress" modelAttribute="address"
				method="POST">

				<!-- need to asscociate this data with customer id  -->
				<form:hidden path="id" />
				
				<div class="mb-3 mt-3">
				<label>Address:</label>
				<form:input path="address" class="form-control"/>
				</div>
				<div class="mb-3 mt-3">
				<label>City:</label>
				<form:input path="city" class="form-control"/>
				</div>
				<div class="mb-3 mt-3">
				<label>Province:</label>
				<form:input path="province" class="form-control"/>
				</div>
				<div class="mb-3 mt-3">
				<label>Postal Code:</label>
				<form:input path="postalCode" class="form-control"/>
				<form:errors path="postalCode" style="color: red"/>
				</div>
				
				<br><br>
				<a href="${pageContext.request.contextPath}/address/list"><button type="button" class="btn btn-danger">Cancel</button></a>
				<button type="submit" class="btn btn-primary">Submit</button>
				
			</form:form>

		</div>

	</div>

</body>
</html>