<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Workshop</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #800000;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="date"], textarea {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 90%;
            font-size: 16px;
        }

        textarea {
            resize: vertical;
        }

        button {
            display: block;
            width: 100%;
            padding: 12px;
            font-size: 1em;
            font-weight: bold;
            color: #fff;
            background: #800000	;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background-color: #800000;
        }

        footer {
            background-color: #800000;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <%@ include file="AdminNavBar.jsp"%>

    <div class="container">
        <h1>Add New Workshop</h1>
        <form action="<c:url value='/admin/workshops/add' />" method="post">
            <div>
                <label for="name">Workshop Name:</label>
                <input type="text" id="name" name="name" required placeholder="Enter the name of the workshop">
            </div>
            <div>
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="5" required placeholder="Provide a brief description of the workshop"></textarea>
            </div>
            <div>
                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>
            </div>
            <div>
                <label for="venue">Venue:</label>
                <input type="text" id="venue" name="venue" required placeholder="Enter the venue location">
            </div>
            <div>
                <button type="submit">Add Workshop</button>
            </div>
        </form>
    </div>

    <footer>
        <p>&copy; 2024 Serenify. All rights reserved.</p>
    </footer>
</body>
</html>
