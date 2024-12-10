<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resources - Serenify</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .resource-card {
            margin: 10px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
            transition: transform 0.2s;
            text-decoration: none;
            color: inherit;
        }
        .resource-card:hover {
            transform: translateY(-5px);
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

    <div class="page-content">
        <section class="resources-section">
            <h1>Helpful Mental Health Resources</h1>
            <p>Explore a variety of free resources to help you on your mental health journey.</p>

            <div class="resource-grid">
                <!-- Mental Health Resources List -->
                <a href="https://www.nami.org/Home" target="_blank" class="resource-card">
                    <h3>NAMI (National Alliance on Mental Illness)</h3>
                    <p>Provides education, support, and advocacy for mental health.</p>
                </a>
                <a href="https://www.mhanational.org/" target="_blank" class="resource-card">
                    <h3>Mental Health America</h3>
                    <p>Free tools and resources for mental health screening and education.</p>
                </a>
                <a href="https://www.mentalhealth.gov/" target="_blank" class="resource-card">
                    <h3>MentalHealth.gov</h3>
                    <p>Comprehensive information on mental health resources and services.</p>
                </a>
                <a href="https://www.7cups.com/" target="_blank" class="resource-card">
                    <h3>7 Cups</h3>
                    <p>Free emotional support through trained listeners and support communities.</p>
                </a>
                <a href="https://www.samhsa.gov/find-help/national-helpline" target="_blank" class="resource-card">
                    <h3>SAMHSA National Helpline</h3>
                    <p>Free, confidential helpline for individuals facing mental health challenges.</p>
                </a>
                <a href="https://www.calm.com/" target="_blank" class="resource-card">
                    <h3>Calm</h3>
                    <p>Meditation and mindfulness resources for stress and anxiety management.</p>
                </a>
                <a href="https://www.headspace.com/" target="_blank" class="resource-card">
                    <h3>Headspace</h3>
                    <p>Guided meditation and mindfulness practices to support mental health.</p>
                </a>
            </div>
        </section>
    </div>

    <footer>
        <p>&copy; 2024 Serenify. All rights reserved.</p>
    </footer>
</body>
</html>
