<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Serenify</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* General Page Styling */
        .page-content {
            font-family: Arial, sans-serif;
            max-width: 900px;
            margin: auto;
            padding: 20px;
            color: #333;
            line-height: 1.6;
        }

        /* About Section Styling */
        .about-section {
            text-align: left;
        }

        .about-section h1 {
            text-align: center;
            color: #800000;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .about-section p {
            text-align: justify;
            margin: 15px 0;
        }

        .about-section h2 {
            color: #800000;
            margin-top: 30px;
            margin-bottom: 15px;
            font-size: 1.8rem;
        }

        .about-section ul {
            list-style-type: disc;
            margin: 20px 0;
            padding-left: 40px;
        }

        .about-section ul li {
            margin-bottom: 10px;
        }

        /* Image Styling */
        .about-image {
            display: block;
            margin: 30px auto;
            max-width: 100%;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Footer Styling */
        footer {
            text-align: center;
            padding: 20px;
            background-color: #800000;
            color: #fff;
            margin-top: 40px;
        }

        footer p {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <%@ include file="MainNavBar.jsp" %>

    <!-- About Page Content -->
    <div class="page-content">
        <section class="about-section">
            <h1>About Serenify</h1>
            <p>
                At Serenify, we believe that mental health is just as important as physical health. 
                Our platform is dedicated to empowering students to prioritize their well-being through 
                innovative tools, expert guidance, and a compassionate community.
            </p>

            <h2>Our Mission</h2>
            <p>
                Our mission is to create a safe and supportive environment where students can access 
                the resources they need to thrive. From one-on-one counseling to peer support groups, 
                Serenify is your partner in achieving mental and emotional wellness.
            </p>

            <h2>Why Choose Serenify?</h2>
            <ul>
                <li>Certified therapists and counselors for personalized guidance</li>
                <li>Interactive workshops to build resilience and manage stress</li>
                <li>Comprehensive library of self-help resources</li>
                <li>Supportive community to share experiences and grow together</li>
            </ul>

            <h2>Our Story</h2>
            <p>
                Serenify was founded with the vision of making mental health resources accessible to all students. 
                Recognizing the unique challenges faced by students in today’s world, our team of mental health 
                professionals, educators, and tech enthusiasts came together to build a platform that bridges 
                the gap between traditional support systems and the digital age.
            </p>

            <img src="https://cdn.pixabay.com/photo/2022/07/15/18/27/mental-health-7323725_640.png" 
                 alt="Serenify Team" class="about-image"/>

            <h2>Meet Our Team</h2>
            <p>
                Our dedicated team includes licensed therapists, mental health advocates, and tech professionals 
                who work tirelessly to provide the best support for our users. Together, we are committed to 
                helping you navigate life's challenges with care and understanding.
            </p>
        </section>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2024 Serenify. All rights reserved.</p>
    </footer>
</body>
</html>
