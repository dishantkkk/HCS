<%@page import="com.java.DB"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Reports</title>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
    <script>
        $(document).ready(function() {
            $('#myTable').dataTable();
        });
    </script>
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
        th,tr,td{
            text-align: center;
        }
    </style>
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
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
                        <li><a href="index.jsp">Logout</a></li>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
            <!--/.container-fluid -->
        </nav>
    </div>
</body>
<%!
    Connection con;
    PreparedStatement ps;
    Statement st;
    ResultSet rs;
%>
<%
    String did = (String) session.getAttribute("did");
    if (did != null) {
%>

<center><h2>Reports of your Patients</h2></center>
    <%
        String comment = (String) session.getAttribute("comment");
        if (comment == null) {

        } else {
            session.removeAttribute("comment");
            out.println("<center><div class='alert alert-success'>Your Comment has been added Successfully...</div><center>");
        }
    %>

<table id="myTable" class="table table-striped table-bordered" >
    <thead>
        <tr>
            <th>Sr. No.</th><th>Patient ID</th><th>Patient Name</th><th>Your Comment</th><th>Appointment Date</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                int count = 0;
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select pid,pname,appoint_date_time,doctor_comment from appointment where did='" + did + "' and status='Confirmed'");
                while (rs.next()) {
                    count++;
        %>

        <tr>
            <td><%=count%></td>
            <td id="pid"><%=rs.getString("pid")%></td>
            <td><%=rs.getString("pname")%></td>
            <td title="Click to Update" contenteditable="true" id="doctor_comment"><%=rs.getString("doctor_comment")%></td>
            <td id="appoint_date_time"><%=rs.getString("appoint_date_time")%></td>
            <td class="submit"><input type="submit" value="Comment" class="btn btn-primary"></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </tbody>
</table>

<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>
<script>
    $(document).ready(function() {
        var trdata = "";
        $("#myTable").on('click', '.submit', function() {

            // get the current row
            var currentRow = $(this).closest("tr");
            var pid = currentRow.find("#pid").html();
            var did = '<%=did%>';
            var doctor_comment = currentRow.find("#doctor_comment").html();
            var appoint_date_time = currentRow.find("#appoint_date_time").html();

            //trdata = pid + "," + did + "," + doctor_comment + "," + appoint_date_time;
            //alert(trdata);
            window.location.href = "Doctor_Comment?pid=" + pid + "&did=" + did + "&doctor_comment=" + doctor_comment + "&appoint_date_time=" + appoint_date_time;

        });
    });
</script>