<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<style>
/* Matching Navbar Styling */
body {
	margin: 0;
	font-family: 'Poppins', sans-serif;
}

.navbar {
	background: linear-gradient(90deg, #800000, #b22222); /* Maroon-red gradient */
	color: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
}

.logo {
	display: flex;
	align-items: center;
}

.logo img {
	height: 60px; /* Adjust logo size */
	margin-right: 10px;
}

.logo h3 {
	margin: 0;
	font-size: 36px;
	color: white;
}

.nav-links {
	list-style: none;
	display: flex;
	margin: 0;
	padding: 0;
}

.nav-links li {
	margin-left: 20px;
}

.nav-links a {
	text-decoration: none;
	color: white; /* White text for links */
	font-size: 16px;
	font-weight: bold;
	transition: color 0.3s ease;
}

.nav-links a:hover {
	color: #ffd700; /* Golden hover effect */
}
</style>
</head>
<body>
	<nav class="navbar">
		<div class="logo">
			<img
				src="${pageContext.request.contextPath}/images/university-logo.png"
				alt="University Logo">
			<h3>Serenify</h3>
		</div>
		<ul class="nav-links">
			<li><a href="${pageContext.request.contextPath}/adminDashboard.jsp">Dashboard</a></li>
			<li><a href="${pageContext.request.contextPath}/ManageUsers.jsp">Manage Users</a></li>
			<li><a href="${pageContext.request.contextPath}/AdminPDFUpload.jsp">Add Resources</a></li>
			<li><a href="${pageContext.request.contextPath}/Reports.jsp">Reports</a></li>
			<li><a href="${pageContext.request.contextPath}/login.jsp">Logout</a></li>
		</ul>
	</nav>
</body>
</html>
