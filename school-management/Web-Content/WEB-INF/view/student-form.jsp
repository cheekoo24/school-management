<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Student Form</title>
    <link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		
</head>
<body class="p-3 mb-2 bg-secondary text-white">
<div class="container mt-3">
	<h3 class="title">STUDENT FORM</h3>
	
	<div class="form">
        <form:form class="form" action="saveStudent" modelAttribute="student" method="POST">

            <!-- need to asscociate this data with customer id  -->
            <form:hidden path="id" />
            
            <div class="mb-3 mt-3">
            <label>First name:</label>
            <form:input path="firstName" class="form-control"/>
            <form:errors path="firstName" style="color: red;"/>
            </div><div class="mb-3 mt-3">
            <label>Last name:</label>
            <form:input path="lastName" class="form-control"/>
            <form:errors path="lastName" style="color: red;"/>
            </div><div class="mb-3 mt-3">
            <label>email:</label>
            <form:input path="email" class="form-control"/>
            </div><div class="mb-3 mt-3">
            <label>Phone Number:</label>
            <form:input path="phoneNo" class="form-control"/>
            <form:errors path="phoneNo" style="color: red;"/>
            </div>
            
            <!-- Address form -->
            <form:hidden path="address.id" />
            <div class="mb-3 mt-3">
            <label>Address:</label>
            <form:input path="address.address" class="form-control"/>
            <form:errors path="address.address" style="color: red;"/>
            </div><div class="mb-3 mt-3">
            <label>City:</label>
            <form:input path="address.city" class="form-control"/>
            <form:errors path="address.city" style="color: red;"/>
            </div><div class="mb-3 mt-3">
            <label>Province:</label>
            <form:input path="address.province" class="form-control"/>
            <form:errors path="address.province" style="color: red;"/>
            </div><div class="mb-3 mt-3">
            <label>Postal Code:</label>
            <form:input path="address.postalCode" class="form-control"/>
            <form:errors path="address.postalCode" style="color: red;"/>
            </div>
            
            <br><br>
            <button type="button" class="btn btn-danger" onclick="history.back()">Cancel</button>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>
        
    </div>
        
    </div>

</body>
</html>