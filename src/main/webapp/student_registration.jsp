<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Registration</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<style>
/* General Styles */
body, html {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

/* Navbar */
.navbar {
	background: linear-gradient(90deg, #4a90e2, #9013fe);
	height: 60px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Main Container */
.form-container {
	max-width: 600px;
	margin: 60px auto;
	padding: 30px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.form-container h2 {
	text-align: center;
	color: #800000;
	margin-bottom: 20px;
}

/* Common Form Field Styles */
.form-container label {
	font-weight: bold;
	color: #333;
}

.form-container input, .form-container select {
	width: 100%;
	padding: 10px;
	margin: 20px 0 0; /* Increased vertical spacing */
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
}

/* Align error messages neatly */
.error-message {
	color: red;
	font-size: 0.85em;
	margin: 5px 0 0;
	display: block;
}

/* Submit Button */
.form-container button {
	width: 100%;
	padding: 10px;
	background-color: #800000;
	border: none;
	border-radius: 25px;
	color: white;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.form-container button:hover {
	background-color: #800000;
}
</style>


<script>
	// Validate Full Name
	function validateName() {
		const nameField = document.getElementById('name');
		const nameError = document.getElementById('nameError');
		const regex = /^[A-Za-z ]+$/;

		if (!regex.test(nameField.value)) {
			nameError.textContent = "Name must only contain alphabets and spaces.";
			return false;
		}
		nameError.textContent = "";
		return true;
	}

	// Validate Date of Birth
	function validateDOB() {
		const dobField = document.getElementById('dateofbirth');
		const dobError = document.getElementById('dobError');
		const today = new Date();
		const selectedDOB = new Date(dobField.value);

		if (selectedDOB > today) {
			dobError.textContent = "Date of birth cannot be a future date.";
			return false;
		}
		dobError.textContent = "";
		return true;
	}

	// Validate Password
	function validatePassword() {
		const passwordField = document.getElementById('password');
		const passwordError = document.getElementById('passwordError');
		const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

		if (!regex.test(passwordField.value)) {
			passwordError.textContent = "Password must include uppercase, lowercase, number, special char, and at least 8 characters.";
			return false;
		}
		passwordError.textContent = "";
		return true;
	}

	function validateForm() {
		const isNameValid = validateName();
		const isDOBValid = validateDOB();
		const isPasswordValid = validatePassword();

		return isNameValid && isDOBValid && isPasswordValid;
	}
</script>
</head>

<body>
	<%@ include file="MainNavBar.jsp"%>

	<div class="form-container">
		<h2>Student Registration</h2>
		<form action="${pageContext.request.contextPath}/registerStudent"
			method="post" onsubmit="return validateForm()">

			<!-- Full Name -->
			<label for="name">Full Name:</label> <input type="text" id="name"
				name="name" onblur="validateName()"> <span
				class="error-message" id="nameError"></span>

			<!-- Gender -->
			<label for="gender">Gender:</label> <select id="gender" name="gender"
				required>
				<option value="Male">Male</option>
				<option value="Female">Female</option>
				<option value="Other">Other</option>
			</select>

			<!-- Date of Birth -->
			<label for="dateofbirth">Date of Birth:</label> <input type="date"
				id="dateofbirth" name="dateofbirth" onblur="validateDOB()">
			<span class="error-message" id="dobError"></span>

			<!-- Email -->
			<label for="email">Email:</label> <input type="email" id="email"
				name="email" required>

			<!-- Password -->
			<label for="password">Password:</label> <input type="password"
				id="password" name="password" onblur="validatePassword()"> <span
				class="error-message" id="passwordError"></span>

			<!-- Contact -->
			<label for="contact">Contact:</label> <input type="text" id="contact"
				name="contact" required>

			<!-- Location -->
			<label for="location">Location:</label> <input type="text"
				id="location" name="location" required>

			<!-- Submit -->
			<button type="submit">Register</button>
		</form>
	</div>

</body>

</html>
