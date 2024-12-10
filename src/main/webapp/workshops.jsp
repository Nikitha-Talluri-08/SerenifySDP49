<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workshops - Serenify</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .workshops-container {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .workshops-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .workshop-item {
            margin-bottom: 15px;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            background: #fff;
        }

        .workshop-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }

        .workshop-description {
            margin: 10px 0;
            color: #555;
        }

        .workshop-location, .workshop-date {
            font-style: italic;
            color: #666;
        }

        .register-button {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 12px;
            background-color: #800000;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }

        .register-button:hover {
            background-color: #5c0000;
        }

        footer {
            background: #800000;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%@ include file="StudentNavBar.jsp"%>

    <div class="workshops-container">
        <h1>Upcoming Workshops</h1>
        <p>Explore our upcoming workshops designed to help you manage stress and improve well-being:</p>

        <%
        try {
            java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:mysql://root:dUEWvgUyPeoWFxqTxasRnzqEbtrdbiox@junction.proxy.rlwy.net:49914/railway", "root", "dUEWvgUyPeoWFxqTxasRnzqEbtrdbiox");
            String query = "SELECT id, name, description, venue, date FROM workshop";
            java.sql.PreparedStatement ps = conn.prepareStatement(query);
            java.sql.ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                // Check if the student is already registered for the current workshop
                String email = "student@example.com";  // Replace with actual student email
                String checkQuery = "SELECT COUNT(*) FROM workshop_registrations WHERE workshop_id = ? AND student_email = ?";
                java.sql.PreparedStatement checkPs = conn.prepareStatement(checkQuery);
                checkPs.setInt(1, rs.getInt("id"));
                checkPs.setString(2, email);
                java.sql.ResultSet checkRs = checkPs.executeQuery();
                checkRs.next();
                boolean isRegistered = checkRs.getInt(1) > 0;
        %>
        <div class="workshop-item">
            <p class="workshop-title"><%= rs.getString("name") %></p>
            <p class="workshop-description"><%= rs.getString("description") %></p>
            <p class="workshop-location">Location: <%= rs.getString("venue") %></p>
            <p class="workshop-date">Date: <%= rs.getDate("date") %></p>
            <% if (isRegistered) { %>
                <button class="register-button" disabled>Registered</button>
            <% } else { %>
                <form action="registerWorkshop" method="post">
                    <input type="hidden" name="workshopId" value="<%= rs.getInt("id") %>">
                    <button type="submit" class="register-button">Register</button>
                </form>
            <% } %>
        </div>
        <%
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error fetching workshops: " + e.getMessage() + "</p>");
        }
        %>
    </div>

    <footer>
        <p>&copy; 2024 Serenify. All rights reserved.</p>
    </footer>
</body>
</html>
