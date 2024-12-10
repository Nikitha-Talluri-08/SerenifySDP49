<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Serenify</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        /* Admin Dashboard specific styles (optional adjustments) */
        .dashboard-content {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            text-align: center;
            font-family: 'Poppins', sans-serif;
        }

        .dashboard-content a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background-color: #800000; /* Maroon color */
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .dashboard-content a:hover {
            background-color: #ffd700; /* Golden hover effect */
            color: black;
        }
    </style>
</head>
<body>
    <%@ include file="AdminNavBar.jsp" %>

    <div class="dashboard-content">
        <h1>Welcome to the Admin Dashboard</h1>
        <p>Manage the workshops, counseling sessions, and more.</p>
        <!-- Add links to manage resources -->
        <a href="${pageContext.request.contextPath}/AdminAddWorkshop.jsp">Manage Workshops</a>
        <a href="${pageContext.request.contextPath}/addCounsellingSession.jsp">Manage Counseling</a>
        <a href="${pageContext.request.contextPath}/ManageResources.jsp">Manage Resources</a>
    </div>
</body>
</html>
