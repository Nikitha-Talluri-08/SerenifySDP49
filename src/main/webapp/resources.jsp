<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page errorPage="error.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resources - Serenify</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .files-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .files-container h1 {
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
    <%@ include file="StudentNavBar.jsp" %>

    <div class="files-container">
        <h1>Resources</h1>
        <p style="text-align: center; color: #555;">Here is a list of all uploaded PDF files. You can download any file from the list.</p>

        <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List<String> fileNames = new ArrayList<>();

        try {
            // Database connection
            String dbURL = "jdbc:mysql://root:dUEWvgUyPeoWFxqTxasRnzqEbtrdbiox@junction.proxy.rlwy.net:49914/railway";
            String dbUser = "root";
            String dbPassword = "dUEWvgUyPeoWFxqTxasRnzqEbtrdbiox";
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Query to get all file names
            String sql = "SELECT name FROM pdf_file";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            // Process the result set
            while (rs.next()) {
                fileNames.add(rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            // Clean up the resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        %>

        <% if (fileNames.isEmpty()) { %>
            <p>No files uploaded yet.</p>
        <% } else { %>
            <table>
                <thead>
                    <tr>
                        <th>File Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (String fileName : fileNames) { %>
                        <tr>
                            <td><%= fileName %></td>
                            <td>
                                <!-- Link to download the file -->
                                <a href="/uploads/<%= fileName %>" download>Download</a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>

    <footer>
        <p>&copy; 2024 Serenify. All rights reserved.</p>
    </footer>
</body>
</html>
