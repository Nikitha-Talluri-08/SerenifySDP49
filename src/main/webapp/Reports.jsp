<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Responses</title>
<link rel="stylesheet" href="style.css">
<style>
body {
	font-family: Arial, sans-serif;
}

.users-container {
	max-width: 1000px;
	margin: 40px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.users-container h1 {
	text-align: center;
	font-size: 28px;
	color: #333;
	margin-bottom: 20px;
}

table {
	width: 50%;
	border-collapse: collapse;
}

th, td {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: center;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
	color: #333;
}

footer {
	background: #800000;
	color: #fff;
	text-align: center;
	padding: 10px;
	margin-top: 40px;
}
</style>
</head>
<body>
	<%@ include file="AdminNavBar.jsp"%>
	<div class="container">
		<h1>Contact Responses</h1>
		<%
		// Database connection details
		String dbURL = "jdbc:mysql://root:dUEWvgUyPeoWFxqTxasRnzqEbtrdbiox@junction.proxy.rlwy.net:49914/railway";
		String dbUser = "root";
		String dbPassword = "dUEWvgUyPeoWFxqTxasRnzqEbtrdbiox";

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			// Load the database driver

			// Establish connection
			conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

			// Query to fetch data from the contact_responses table
			String query = "SELECT id, name, email, message, created_at FROM contact_responses";
			stmt = conn.prepareStatement(query);
			rs = stmt.executeQuery();

			if (rs.next()) {
		%>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Message</th>
					<th>Response Date</th>
				</tr>
			</thead>
			<tbody>
				<%
				do {
				%>
				<tr>
					<td><%=rs.getInt("id")%></td>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("message")%></td>
					<td><%=rs.getDate("created_at")%></td>
				</tr>
				<%
				} while (rs.next());
				%>
			</tbody>
		</table>
		<%
		} else {
		%>
		<p class="no-data">No contact responses found.</p>
		<%
		}
		} catch (Exception e) {
		// Wrap JspWriter in PrintWriter
		java.io.PrintWriter writer = new java.io.PrintWriter(out);
		e.printStackTrace(writer); // Print stack trace using the wrapped writer
		writer.flush();
		} finally {
		// Close the resources
		if (rs != null)
		try {
			rs.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		if (stmt != null)
		try {
			stmt.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		if (conn != null)
		try {
			conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		}
		%>
	</div>
	<footer>
		<p>&copy; 2024 Serenify. All rights reserved.</p>
	</footer>
</body>
</html>
