<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Register for Workshop</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file="MainNavBar.jsp"%>

	<h1>Register for Workshop</h1>

	<form action="<c:url value='/workshops/${workshopId}/register' />"
		method="post">
		<label for="studentName">Name:</label><br> <input type="text"
			id="studentName" name="studentName" required><br>
		<br> <label for="studentEmail">Email:</label><br> <input
			type="email" id="studentEmail" name="studentEmail" required><br>
		<br>

		<button type="submit">Register</button>
	</form>

	<footer>
		<p>&copy; 2024 Serenify. All rights reserved.</p>
	</footer>
</body>
</html>
