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
            font-family: Arial, sans-serif;
        }

        /* Service Section Styling */
        .service-grid, .resource-grid {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
            padding: 20px;
        }

        /* Card Styling */
        .service-card, .resource-card {
            width: 200px; /* Adjusted width for medium size */
            text-align: center;
            background-color: #fff;
            border: 2px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            transition: all 0.3s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-decoration: none;
            color: inherit;
        }

        .service-card img, .resource-card img {
            width: 100%;
            height: 120px; /* Adjusted height for a balanced look */
            border-radius: 8px;
        }

        /* Hover effect to simulate button behavior */
        .service-card:hover, .resource-card:hover {
            border-color: #4CAF50; /* Highlight border on hover */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
            transform: translateY(-5px);
        }

        /* Styling the Footer */
        footer {
            background: #800000;
            color: white;
            padding: 20px;
            text-align: center;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <!-- Include the navigation bar -->
    <%@ include file="MainNavBar.jsp" %>

    <div>
        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-content">
                <h1>Welcome to Serenify</h1>
                <p>
                    Your mental health matters! Serenify is here to provide a safe and compassionate space to help you navigate
                    student life with care and understanding.
                </p>
                <a href="#services" class="cta-button">Explore Services</a>
            </div>
            <img src="https://img.freepik.com/premium-vector/mental-health-awareness-concept_23-2148533723.jpg" alt="Serene mind" class="hero-image"/>
        </section>

        <!-- Services Section -->
        <section id="services" class="services">
            <h2>Our Services</h2>
            <div class="service-grid">
                <!-- Each card leads to login.jsp -->
                <a href="login.jsp" class="service-card">
                    <img src="https://img.freepik.com/premium-vector/illustration-vector-graphic-cartoon-character-psychotherapy-counseling_516790-424.jpg" alt="Counseling"/>
                    <h3>Counseling Sessions</h3>
                    <p>One-on-one counseling sessions with certified therapists.</p>
                </a>
                <a href="login.jsp" class="service-card">
                    <img src="https://static.vecteezy.com/system/resources/thumbnails/026/623/706/original/hobby-painter-cartoon-animation-art-workshop-4k-motion-graphic-painting-class-african-american-female-studio-artist-painting-picture-2d-color-animated-character-isolated-on-white-background-video.jpg" alt="Workshops"/>
                    <h3>Stress Management Workshops</h3>
                    <p>Workshops to help manage stress and anxiety.</p>
                </a>
                <a href="login.jsp" class="service-card">
                    <img src="https://cdn.prod.website-files.com/61cdf3c5e0b8152652e01082/65c4d4dfc0c2ff01bd3e87bd_video%20animation.jpg" alt="Resources"/>
                    <h3>Online Resources</h3>
                    <p>A library of articles, videos, and tools.</p>
                </a>
            </div>
        </section>

        <!-- Resources Section -->
        <section id="resources" class="resources">
            <h2>Helpful Resources</h2>
            <p>Explore books and guides for mental health.</p>
            <div class="resource-grid">
                <a href="login.jsp" class="resource-card">
                    <img src="https://www.shutterstock.com/shutterstock/videos/1086628820/thumb/10.jpg?ip=x480" alt="Mindfulness"/>
                    <h3>Mindfulness Practices</h3>
                    <p>Techniques to improve focus and reduce stress.</p>
                </a>
                <a href="login.jsp" class="resource-card">
                    <img src="https://www.shutterstock.com/shutterstock/videos/1097635537/thumb/1.jpg?ip=x480" alt="Self-Care"/>
                    <h3>Self-Care Tips</h3>
                    <p>Practical tips for mental and emotional well-being.</p>
                </a>
                <a href="login.jsp" class="resource-card">
                    <img src="https://static.vecteezy.com/system/resources/thumbnails/013/213/983/small_2x/brain-holding-heart-mental-health-concept-cute-kawaii-cartoon-character-animation-isolated-on-white-and-green-background-free-video.jpg" alt="Mental Health Guides"/>
                    <h3>Mental Health Guides</h3>
                    <p>Guides on managing anxiety, depression, and more.</p>
                </a>
            </div>
        </section>

        <!-- Footer Section -->
        <footer>
            <h2 style="color: white;">Contact Us</h2>
            <p>If you need help or want to learn more, reach out to us anytime.</p>
            <p>Email: 2200033217@kluniversity.in</p>
            <p>Phone: +91 9876543201</p>
            <div class="social-media">
                <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
                <a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
                <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
            </div>
            <p>&copy; 2024 Serenify. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
