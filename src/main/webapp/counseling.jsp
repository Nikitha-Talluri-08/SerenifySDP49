<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counseling Sessions - Serenify</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
            margin: 0;
            padding: 0;
        }

        .sessions-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .sessions-container h1 {
            text-align: center;
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        .session-item {
            display: inline-block;
            width: 280px;
            margin: 15px;
            padding: 15px;
            background: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }

        .session-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .session-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
            text-transform: capitalize;
        }

        .session-details {
            color: #555;
            font-size: 14px;
            margin: 10px 0;
        }

        .session-location,
        .session-date {
            font-style: italic;
            color: #777;
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
    <%@ include file="StudentNavBar.jsp"%>

    <div class="sessions-container">
        <h1>Counseling Sessions</h1>
        <p style="text-align: center; color: #555;">Explore our counseling sessions and their details below:</p>

        <%
        try {
            // Establish database connection
            java.sql.Connection conn = java.sql.DriverManager.getConnection(
                "jdbc:mysql://root:dUEWvgUyPeoWFxqTxasRnzqEbtrdbiox@junction.proxy.rlwy.net:49914/railway", "root", "dUEWvgUyPeoWFxqTxasRnzqEbtrdbiox");

            // Query to fetch session details
            String query = "SELECT counselor_name, venue, session_date FROM counselling_session";
            java.sql.PreparedStatement ps = conn.prepareStatement(query);
            java.sql.ResultSet rs = ps.executeQuery();

            // Display each session
            while (rs.next()) {
        %>
        <div class="session-item">
            <p class="session-title"><%= rs.getString("counselor_name") %></p>
            <p class="session-details">
                <span class="session-location">Venue: <%= rs.getString("venue") %></span><br>
                <span class="session-date">Date: <%= rs.getDate("session_date") %></span>
            </p>
        </div>
        <%
            }

            // Close database resources
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            // Print error message
        %>
        <p style="color: red; text-align: center;">Error fetching sessions: <%= e.getMessage() %></p>
        <%
        }
        %>
    </div>

    <footer>
        <p>&copy; 2024 Serenify. All rights reserved.</p>
    </footer>
</body>
</html>
