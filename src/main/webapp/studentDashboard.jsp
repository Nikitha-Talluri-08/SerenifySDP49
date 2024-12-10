<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Serenify</title>
    <link rel="stylesheet" href="style.css">
    <style>
    /* General Styles */
    body, html {
        margin: 0;
        padding: 0;
        font-family: 'Roboto', Arial, sans-serif;
        background: #f9f9f9; /* Subdued light background */
        color: #333;
    }

    /* Hero Section */
    .hero {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 40px;
        background: #ffffff; /* Neutral white background */
        color: #333;
        text-align: left;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
    }

    .hero-content {
        max-width: 600px;
    }

    .hero-content h1 {
        font-size: 2.5rem;
        margin-bottom: 15px;
        font-weight: bold;
    }

    .hero-content p {
        font-size: 1.2rem;
        line-height: 1.8;
    }

    .cta-button {
        display: inline-block;
        margin-top: 20px;
        padding: 12px 20px;
        font-size: 1rem;
        color: white;
        background-color: #800000;
        border: none;
        border-radius: 8px;
        text-decoration: none;
        transition: 0.3s;
    }

    .cta-button:hover {
        background-color: #800000;
        transform: scale(1.05);
    }

    .hero-image {
        max-width: 400px;
        border-radius: 20px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }

    /* Service and Resource Cards */
    .service-grid, .resource-grid {
        display: flex;
        gap: 20px;
        justify-content: center;
        flex-wrap: wrap;
        padding: 40px;
        background: #fff; /* White background for sections */
        margin-top: -20px;
    }

    .service-card, .resource-card {
        width: 250px;
        text-align: center;
        background-color: white;
        border: none;
        border-radius: 15px;
        padding: 20px;
        transition: all 0.3s ease;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    }

    .service-card:hover, .resource-card:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
    }

    .service-card img, .resource-card img {
        width: 100%;
        height: auto;
        border-radius: 12px;
        margin-bottom: 15px;
    }

    /* Footer Section */
    footer {
        background: #800000; /* Solid maroon for footer */
        color: white;
        padding: 30px 20px;
        text-align: center;
    }

    footer h2 {
        font-size: 1.8rem;
        margin-bottom: 10px;
    }

    footer p {
        font-size: 1rem;
        line-height: 1.5;
    }

    .social-media a {
        color: white;
        margin: 0 10px;
        font-size: 1.5rem;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .social-media a:hover {
        color: #ffd700;
    }

    footer p:last-of-type {
        margin-top: 15px;
        font-size: 0.9rem;
        opacity: 0.8;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .hero {
            flex-direction: column;
            text-align: center;
        }

        .hero-content {
            margin-bottom: 20px;
        }

        .hero-image {
            max-width: 100%;
        }

        .service-card, .resource-card {
            width: 90%;
        }
    }
</style>

    
</head>
<body>
    <!-- Include the navigation bar -->
    <%@ include file="StudentNavBar.jsp" %>

    <div>
        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-content">
                <h1>Welcome to Serenify</h1>
                <p>
                    Your mental health matters! Serenify is here to provide a safe and compassionate space to help you navigate
                    student life with care and understanding.
                </p>
            </div>
            <img src="https://img.freepik.com/premium-vector/mental-health-awareness-concept_23-2148533723.jpg" alt="Serene mind" class="hero-image"/>
        </section>

     
        <!-- Footer Section -->
        <footer>
            <p>&copy; 2024 Serenify. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
