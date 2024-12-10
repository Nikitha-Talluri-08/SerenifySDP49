<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Resources</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding-top: 60px;  /* To prevent content from being hidden under the navbar */
        }

        h1 {
            color: #333;
            text-align: center;
        }

        .form-container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            font-size: 16px;
            color: #555;
            margin-bottom: 8px;
            display: block;
        }

        input[type="file"],
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px 0;
            border-radius: 4px;
            border: 1px solid #ddd;
            font-size: 14px;
        }

        button {
            padding: 12px 20px;
            background-color: #800000;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        button:hover {
            background-color: #cc3333;
        }

        #responseMessage {
            text-align: center;
            font-size: 16px;
            margin-top: 20px;
        }

        footer {
            background: #800000;
            color: #fff;
            text-align: center;
            padding: 10px;
            margin-top: 40px;
        }

        /* Fixed Navbar Styling */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #800000;
            color: white;
            padding: 15px 0;
            text-align: center;
            z-index: 1000;
        }

        /* Ensure the content below the navbar doesn't overlap */
        .content {
            padding-top: 60px;  /* Adjust content to ensure it doesn't overlap with the navbar */
        }
    </style>
</head>
<body>

    <!-- Include the Admin Navbar from AdminNavBar.jsp -->
    <%@ include file="AdminNavBar.jsp" %>

    <div class="content">
        <h1>Add Resources</h1>

        <div class="form-container">
            <form id="uploadForm" enctype="multipart/form-data">
                <label for="file">Choose PDF File:</label>
                <input type="file" id="file" name="file" accept="application/pdf" required><br>

                <label for="description">Description:</label>
                <input type="text" id="description" name="description" required><br>

                <button type="submit">Upload</button>
            </form>

            <p id="responseMessage"></p>
        </div>

        <footer>
            <p>&copy; 2024 Serenify. All rights reserved.</p>
        </footer>
    </div>

    <script>
        const form = document.getElementById('uploadForm');
        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            
            const formData = new FormData();
            formData.append('file', document.getElementById('file').files[0]);
            formData.append('description', document.getElementById('description').value);

            const response = await fetch('/admin/upload', {
                method: 'POST',
                body: formData
            });

            const message = document.getElementById('responseMessage');
            if (response.ok) {
                message.textContent = 'File uploaded successfully!';
                message.style.color = 'green';
            } else {
                message.textContent = 'File upload failed!';
                message.style.color = 'red';
            }
        });
    </script>

</body>
</html>
