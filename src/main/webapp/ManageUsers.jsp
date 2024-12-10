<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Serenify</title>
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
            width: 100%;
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

        .delete-button {
            padding: 6px 12px;
            background-color: #d9534f;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .delete-button:hover {
            background-color: #c9302c;
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
    <%@ include file="AdminNavBar.jsp" %>

    <div class="users-container">
        <h1>Manage Users</h1>
        <p style="text-align: center; color: #555;">Here is a list of all registered students. You can delete any student account from the list.</p>

        <%
        try {
            java.sql.Connection conn = java.sql.DriverManager.getConnection(
                "jdbc:mysql://root:dUEWvgUyPeoWFxqTxasRnzqEbtrdbiox@junction.proxy.rlwy.net:49914/railway", "root", "dUEWvgUyPeoWFxqTxasRnzqEbtrdbiox");

            // If a deletion request was made
            if (request.getParameter("deleteId") != null) {
                int deleteId = Integer.parseInt(request.getParameter("deleteId"));
                String deleteQuery = "DELETE FROM student WHERE student_id = ?";
                java.sql.PreparedStatement deletePs = conn.prepareStatement(deleteQuery);
                deletePs.setInt(1, deleteId);
                int rowsAffected = deletePs.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<p style='color: green; text-align: center;'>Student with ID " + deleteId + " deleted successfully.</p>");
                } else {
                    out.println("<p style='color: red; text-align: center;'>Error: Could not delete student with ID " + deleteId + ".</p>");
                }

                deletePs.close();
            }

            // Query to fetch student details
            String query = "SELECT student_id, student_name, student_email FROM student";
            java.sql.PreparedStatement ps = conn.prepareStatement(query);
            java.sql.ResultSet rs = ps.executeQuery();

            // Check if there are any students
            if (!rs.isBeforeFirst()) {
        %>
        <p style="color: red; text-align: center;">No students found in the database.</p>
        <%
            } else {
        %>
        <table>
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%
                // Display each student in a row
                while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getInt("student_id") %></td>
                    <td><%= rs.getString("student_name") %></td>
                    <td><%= rs.getString("student_email") %></td>
                    <td>
                        <form method="get" onsubmit="return confirm('Are you sure you want to delete this student?');">
                            <input type="hidden" name="deleteId" value="<%= rs.getInt("student_id") %>">
                            <button type="submit" class="delete-button">Delete</button>
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <%
            }

            // Close database resources
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
        %>
        <p style="color: red; text-align: center;">Error fetching users: <%= e.getMessage() %></p>
        <%
        }
        %>
    </div>

    <footer>
        <p>&copy; 2024 Serenify. All rights reserved.</p>
    </footer>
</body>
</html>
