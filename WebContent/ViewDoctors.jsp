<%@page import="com.java.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Doctors</title>
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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
        tr,td,th{
            text-align: center;
        }
    </style>
    <script>
        $(document).ready(function() {
            $('#myTable').dataTable();
        });
    </script>

</head>
<body style="background-image: url(images/bg1.jpg);">
    <%
        String did = (String) session.getAttribute("did");
        String pid = (String) session.getAttribute("pid");
        if (did != null) {
    %>
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
                    <a class="navbar-brand" href="DoctorHome.jsp"><img src="images/log.png" style="height:80px" alt="Dispute Bills">
                    </a>
                </div>
                <div id="navbar3" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"> <a href="DoctorHome.jsp">Home</a></li>
                        <li><a href="DoctorProfile.jsp">Profile</a></li>
                        <li><a href="ViewDoctors.jsp">Doctors</a></li>
                        <li><a href="DoctorAppointment.jsp">Appointments</a></li>
                        <li><a href="ViewReport.jsp">Patient Reports</a></li>
                        <li><a href="ViewQueries.jsp">Patient Queries</a></li>
                        <li><a href="PSymptoms.jsp"> Symptom Checker</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">More <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="Services.jsp">Services</a></li>
                                <li><a href="About.jsp">About Us</a></li>
                                <li><a href="Contact.jsp">Contact Us</a></li>
                            </ul>
                        </li>
                        <!--                            <li><a href="FeedbackForm.jsp">Feedback</a></li>-->
                        <li><a href="index.jsp">Logout</a></li>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
            <!--/.container-fluid -->
        </nav>
    </div>
    <%
    } else if (pid != null) {
    %>
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
    <%
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
<center><h2>All Doctors</h2></center>
<table id="myTable" class="table table-striped table-bordered" style="background-color: transparent;">
    <thead>
        <tr>
            <th>Sr. No.</th><th>Name</th><th>Gender</th><th>Age</th><th>Department</th><th>Degree</th><th>Fee</th><th>Email</th>
        </tr>
    </thead>
    <tbody>
        <%            try {
                int count = 0;
                Connection con = DB.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from table_doctor");
                while (rs.next()) {
                    count++;
                    String s6 = rs.getString("Fees");
                    String s7 = rs.getString("Department");
                    String s8 = rs.getString("Degree");
        %>

        <tr><td><%=count%><td><%=rs.getString("dname")%></td><td><%=rs.getString("gender")%></td><td><%=rs.getString("age")%></td><td><%=s7%></td><td><%=s8%></td><td><%=s6%></td><td><%=rs.getString("email")%></td>

        </tr>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </tbody>
</table>

</body>
</html>
