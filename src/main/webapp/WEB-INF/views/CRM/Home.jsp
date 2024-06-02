<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Property Studio | CRM</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <style>
        body {
            font-family: Arial, sans-serif; 
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            margin: 0;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            margin-left: 15px;
        }

        main {
            padding: 20px;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
        }

        .tile {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            width: calc(33.333% - 40px);
            box-sizing: border-box;
            text-align: center;
            text-decoration: none;
            color: inherit;
            display: block;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .tile img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .tile h2 {
            margin: 10px 0;
            pointer-events: none;
        }

        .tile p {
            color: #666;
            pointer-events: none;
        }

        .tile:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
    </style>

    <body>
        <div class="container">
            <a href="dashboard" class="tile">
                <img src="${pageContext.request.contextPath}/images/CRM Dashboard.jpeg" alt="CRM Dashboard">
                <h2>CRMDashboard</h2>
                <p>Overview of CRM performance and metrics.</p>
            </a>
            <a href="salesfunnel" class="tile">
                <img src="${pageContext.request.contextPath}/images/Sales Funnel.jpeg" alt="Sales Funnel">
                <h2>SalesFunnel</h2>
                <p>Analyze and optimize the sales funnel.</p>
            </a>
            <a href="enquires" class="tile">
                <img src="${pageContext.request.contextPath}/images/Enquiries.png" alt="Enquiry">
                <h2>Enquiry</h2>
                <p>Track and manage customer enquiries.</p>
            </a>
            <a href="sitevisits" class="tile">
                <img src="${pageContext.request.contextPath}/images/Site Visit.jpeg" alt="Site Visit">
                <h2>SiteVisit</h2>
                <p>Manage and schedule site visits.</p>
            </a>
            <a href="customers" class="tile">
                <img src="${pageContext.request.contextPath}/images/Customers.png" alt="Customers">
                <h2>Customers</h2>
                <p>View and manage customer data.</p>
            </a>
            <a href="team" class="tile">
                <img src="${pageContext.request.contextPath}/images/Teams.png" alt="Teams">
                <h2>Teams</h2>
                <p>Collaborate with your teams effectively.</p>
            </a>
        </div>
    </body>

    </html>