<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services - Serenify</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* General Styles */
        .page-content {
            padding: 20px;
            font-family: Arial, sans-serif;
        }

        .services-section {
            max-width: 1200px;
            margin: auto;
            text-align: center;
        }

        .services-section h1 {
            font-size: 2.5rem;
            color: #333;
        }

        .services-section p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 30px;
        }

        /* Service Grid */
        .service-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        /* Service Card */
        .service-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            width: 250px;
            padding: 15px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            text-decoration: none;
            color: #333;
        }

        .service-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            background: #f9f9f9;
        }

        .service-card img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .service-card h3 {
            font-size: 1.2rem;
            margin: 10px 0;
            color: #444;
        }

        .service-card p {
            font-size: 0.9rem;
            color: #666;
        }
        footer {
            background: #800000;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <%@ include file="StudentNavBar.jsp" %>

    <!-- Services Page Content -->
    <div class="page-content">
        <section class="services-section">
            <h1>Our Services</h1>
            <p>At Serenify, we offer a range of services to support your mental health and well-being.</p>

            <div class="service-grid">
                <!-- Counseling Sessions -->
                <a href="counseling.jsp" class="service-card">
                    <img src="https://img.freepik.com/premium-vector/illustration-vector-graphic-cartoon-character-psychotherapy-counseling_516790-424.jpg" alt="Counseling">
                    <h3>Counseling Sessions</h3>
                    <p>Engage in one-on-one counseling sessions with licensed therapists to help you navigate life's challenges.</p>
                </a>

                <!-- Stress Management Workshops -->
                <a href="workshops.jsp" class="service-card">
                    <img src="https://static.vecteezy.com/system/resources/thumbnails/026/623/706/original/hobby-painter-cartoon-animation-art-workshop-4k-motion-graphic-painting-class-african-american-female-studio-artist-painting-picture-2d-color-animated-character-isolated-on-white-background-video.jpg" alt="Workshops">
                    <h3>Workshops on Stress Management</h3>
                    <p>Join our interactive workshops to learn stress management techniques and cope with anxiety.</p>
                </a>

                <!-- Online Resources -->
                <a href="onlineresources.jsp" class="service-card">
                    <img src="https://cdn.prod.website-files.com/61cdf3c5e0b8152652e01082/65c4d4dfc0c2ff01bd3e87bd_video%20animation.jpg" alt="Resources">
                    <h3>Online Resources</h3>
                    <p>Explore our comprehensive library of articles, videos, and tools for your mental health journey.</p>
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
