<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="AdminNavBar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Resources</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #f4f4f4;
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
    </style>
</head>
<body>

    <div class="container">
        <h1 style="text-align: center;">Manage Uploaded Resources</h1>
        <p style="text-align: center;">Below is a list of uploaded PDF resources. You can delete any resource.</p>

        <%
        try {
            // Database connection
            java.sql.Connection conn = java.sql.DriverManager.getConnection(
                "jdbc:mysql://root:dUEWvgUyPeoWFxqTxasRnzqEbtrdbiox@junction.proxy.rlwy.net:49914/railway", "root", "dUEWvgUyPeoWFxqTxasRnzqEbtrdbiox");

            // Handle deletion if requested
            if (request.getParameter("deleteId") != null) {
                int deleteId = Integer.parseInt(request.getParameter("deleteId"));
                String deleteQuery = "DELETE FROM pdf_file WHERE id = ?";
                java.sql.PreparedStatement deletePs = conn.prepareStatement(deleteQuery);
                deletePs.setInt(1, deleteId);
                int rowsAffected = deletePs.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<p style='color: green; text-align: center;'>Resource deleted successfully.</p>");
                } else {
                    out.println("<p style='color: red; text-align: center;'>Error deleting resource.</p>");
                }
                deletePs.close();
            }

            // Fetch and display resources
            String query = "SELECT id, name, description, upload_date FROM pdf_file";
            java.sql.PreparedStatement ps = conn.prepareStatement(query);
            java.sql.ResultSet rs = ps.executeQuery();

            if (!rs.isBeforeFirst()) {
        %>
            <p style="text-align: center; color: red;">No resources found in the database.</p>
        <%
            } else {
        %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>File Name</th>
                        <th>Description</th>
                        <th>Upload Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
        <%
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("description") %></td>
                        <td><%= rs.getDate("upload_date") %></td>
                        <td>
                            <form method="get" onsubmit="return confirm('Are you sure you want to delete this resource?');">
                                <input type="hidden" name="deleteId" value="<%= rs.getInt("id") %>">
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

            // Close resources
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
        %>
            <p style="color: red; text-align: center;">Error: <%= e.getMessage() %></p>
        <%
        }
        %>
    </div>
</body>
</html>
