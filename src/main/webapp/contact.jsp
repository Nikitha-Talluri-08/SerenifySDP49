<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us - Serenify</title>
<link rel="stylesheet" href="style.css">
<style>
/* Center alignment and styling for contact form */
.contact-section {
    max-width: 800px;
    margin: auto;
    padding: 20px;
    text-align: center;
    font-family: Arial, sans-serif;
}

/* Improved styling for form sections */
.contact-details, .contact-form, .social-media {
    margin-bottom: 30px;
}

/* Contact form container */
.contact-form form {
    width: 100%;
    max-width: 500px;
    margin: auto;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 20px;
}

/* Label and input field styling */
.contact-form label {
    font-weight: bold;
    width: 100%;
    font-size: 20px;
    color: #333;
}

/* Input fields and textarea styling */
.contact-form input, 
.contact-form textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
}

/* Consistent height for the textarea */
.contact-form textarea {
    resize: vertical;
    min-height: 100px;
}

/* Submit button styling */
.submit-button {
    background-color: #800000;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    align-self: center;
}

.submit-button:hover {
    background-color: #990000;
}

/* Social media link styling */
.social-media a {
    margin: 0 10px;
    color: #333;
    font-size: 20px;
    text-decoration: none;
}

.social-media a:hover {
    color: #800000;
}

/* Form result message styling */
#form-result {
    text-align: center;
    margin-bottom: 15px;
    font-size: 16px;
    font-weight: bold;
}
</style>

</head>
<body>
	<%@ include file="MainNavBar.jsp"%>

	<!-- Contact Page Content -->
	<div class="page-content">
		<section class="contact-section">
			<h1>Contact Us</h1>
			<p>We’re here to help! Reach out to us anytime for support or
				questions.</p>

			<!-- Contact Details -->
			<div class="contact-details">
				<h2>Get in Touch</h2>
				<p>
					<strong>Email:</strong> <a href="mailto:2200033217@kluniversity.in">serenify</a>
				</p>
				<p>
					<strong>Phone:</strong> +91 9876543210
				</p>
				<p>
					<strong>Address:</strong> Green Fields, Vaddeswaram, Andhra Pradesh
					522302
				</p>
			</div>

			<!-- Contact Form -->
			<div class="contact-form">
				<h2>Send Us a Message</h2>
				<div id="form-result" style="color: green; font-weight: bold;"></div>

				<form id="contactForm">
					<label for="name">Name:</label> <input type="text" id="name"
						name="name" required> <label for="email">Email:</label> <input
						type="email" id="email" name="email" required> <label
						for="message">Message:</label>
					<textarea id="message" name="message" rows="5" required></textarea>

					<button type="button" class="submit-button" onclick="submitForm()">Submit</button>
				</form>

				<script>
function submitForm() {
    const form = document.getElementById('contactForm');
    const formData = new FormData(form);

    fetch('/api/contact/submit', {
        method: 'POST',
        body: new URLSearchParams(formData),
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        }
    })
    .then(response => response.text())
    .then(data => {
        document.getElementById('form-result').innerText = data;
        form.reset();
    })
    .catch(error => {
        console.error('Error:', error);
        document.getElementById('form-result').innerText = 'An error occurred. Please try again.';
    });
}
</script>

			</div>

			<!-- Social Media Links -->
			<div class="social-media">
				<h2>Follow Us</h2>
				<a href="https://facebook.com" target="_blank"
					rel="noopener noreferrer"> <i class="fab fa-facebook-f"></i>
					Facebook
				</a> <a href="https://twitter.com" target="_blank"
					rel="noopener noreferrer"> <i class="fab fa-twitter"></i>
					Twitter
				</a> <a href="https://instagram.com" target="_blank"
					rel="noopener noreferrer"> <i class="fab fa-instagram"></i>
					Instagram
				</a>
			</div>
		</section>
	</div>

	<!-- Footer Section -->
	<footer>
		<p>&copy; 2024 Serenify. All rights reserved.</p>
	</footer>
</body>
</html>
