<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User name | My Site Visits</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSSFiles/SiteVisit.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>

    <body>
        <div class="container mt-3">
            <div class="hflex">
                <div>
                    <h1>Your Site Visits</h1>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-success" id="excelDownloadButton" download="EnquiriesList(Username).xlsx">
                        <i class="fas fa-download"></i> Excel Download
                    </button>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="siteVisitsContainer" id="siteVisitsContainer"></div>
        </div>

        <!-- JavaScript libraries for Bootstrap -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/JSFiles/SiteVisit.js"></script>
    </body>

    </html>