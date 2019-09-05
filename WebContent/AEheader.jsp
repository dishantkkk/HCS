<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <title>JSP Page</title>
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
                background:url('images/pp2.png') no-repeat center center;
                background-size:cover;

                /* Workaround for some mobile browsers */
                min-height:100%;
            }
            html{
                /* This image will be displayed fullscreen */
                background:url('images/bg1.jpg') no-repeat center center;
                /* Ensure the html element always takes up the full height of the browser window */
                height:100%;
                /* The Magic */
                background-size:cover;
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
                        <a class="navbar-brand" href="AdminHome.jsp"><img src="images/log.png" style="height: 85px;margin-top: -15px;" alt="hcs"></a>
                    </div>
                    <div id="navbar3" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="AdminHome.jsp">Home</a></li>
                            <li><a href="departments.jsp">Departments</a></li>
                            <li><a href="DoctorsList.jsp">Doctors</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Patients <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="ViewAPatients.jsp">View Patients</a></li>
                                    <li><a href="ViewReports.jsp">View Reports</a></li>
                                    <li><a href="queries.jsp">View Queries</a></li>
                                    <li><a href="ViewAppointment.jsp">View Appointments</a></li>
                                </ul>
                            </li>
                            <li><a href="ViewPaidBills.jsp">Billing</a></li>
                            <li><a href="ViewSymptoms.jsp">Symptoms Checker</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">More<span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="ViewFeedback.jsp">View Feedback</a></li>
                                    <li><a href="ViewContacts.jsp">View Contacts</a></li>
                                </ul>
                            </li>
                            <li><a href="index.jsp">Logout</a></li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
                <!--/.container-fluid -->
            </nav>
        </div>
    </body>
</html>
