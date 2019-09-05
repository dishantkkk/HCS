<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Smart Health Care System</title>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <!--        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
                <script src="js/bootstrap.min.js" type="text/javascript"></script>
                <script src="js/jquery.min.js" type="text/javascript"></script>-->

        <style>
            .navbar-brand {
                padding: 0px;
            }
            .navbar-brand>img {
                height: 100%;
                padding: 15px;
                width: auto;
            }
            /* EXAMPLE 3

            line height is 20px by default so add 30px top and bottom to equal the new .navbar-brand 80px height  */

            .example3 .navbar-brand {

                height: 80px;
            }
            .example3 .nav >li >a {
                padding-top: 30px;
                padding-bottom: 30px;
            }
            .example3 .navbar-toggle {
                padding: 10px;
                margin: 25px 15px 25px 0;
            }
            body {
                //background:url('images/pp2.png') no-repeat center center;
                background-size:cover;

                /* Workaround for some mobile browsers */
                min-height:100%;
            }
            html{
                /* This image will be displayed fullscreen */
                //background:url('images/bg1.jpg') no-repeat center center;
                /* Ensure the html element always takes up the full height of the browser window */
                height:100%;
                /* The Magic */
                background-size:cover;
            }
            label
            {
                font-size: 14px;
            }
            #navbar3 li a:hover
            {
                color:lightseagreen;
            }
        </style>
    </head>
    <body>
        <div class="example3">
            <nav class="navbar navbar-inverse navbar-static-top" style="background-color: whitesmoke;">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar3">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="PatientHome.jsp"><img src="images/log.png" style="height:80px" alt="hcs">
                        </a>
                    </div>
                    <div id="navbar3" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="PatientHome.jsp">Home</a></li>
                            <li><a href="ViewProfile.jsp">Profile</a></li>
                            <li><a href="ViewDoctors.jsp">Doctors</a></li>
                            <li><a href="ViewPReports.jsp">Your Reports</a></li>
                            <li><a href="YourQueries.jsp">Your Queries</a></li>
                            <li><a href="PSymptoms.jsp">Symptom Checker</a></li>
                            <li><a href="BookApointment.jsp">Book Appointment</a></li>
                            <li><a href="PayBill.jsp">Billing</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">More <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="Services.jsp">Services</a></li>
                                    <li><a href="About.jsp">About Us</a></li>
                                    <li><a href="Contact.jsp">Contact Us</a></li>
                                    <li><a href="FeedbackForm.jsp">Feedback</a></li>
                                </ul>
                            </li>
                            <li><a href="index.jsp">Logout</a></li>
                    </div>
                    <!--/.nav-collapse -->
                </div>
                <!--/.container-fluid -->
            </nav>
        </div>
    </body>
</html>
