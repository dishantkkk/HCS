<%@page import="java.util.UUID"%>
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
        <title>Patient Queries</title>
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
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
        tr,th,td{
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
    <%!
        Connection con;
        PreparedStatement ps;
        Statement st;
        ResultSet rs;
        String pid, pname, age, email, smoking, alcohlic, symtomps, date;
    %>
    <%
        String did = (String) session.getAttribute("did");
        if (did != null) {
    %>
<center><h2>Patient's Queries</h2></center>
    <%
        String update = (String) session.getAttribute("updated");
        if (update != null) {
            session.removeAttribute("updated");
            out.println("<center><div class='alert alert-success'>Your Reply has been added successfully...</div></center>");
        } else {
        }
    %>
<table id="myTable" class="table table-striped table-bordered">
    <thead>
        <tr>
            <th style="display: none;">Patient ID</th><th>Patient Name</th><th>Age</th><th>Smoking</th><th>Alcohlic</th><th>Query</th><th>Your Comment</th><th>Date</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                String tokens = UUID.randomUUID().toString();
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from queries where did='" + did + "' order by date desc");
                while (rs.next()) {
                    pid = rs.getString("pid");
                    pname = rs.getString("pname");
                    age = rs.getString("age");
                    smoking = rs.getString("smoking");
                    alcohlic = rs.getString("alcohlic");
                    symtomps = rs.getString("query");
                    date = rs.getString("date");
        %>
        <tr>
            <td style="display: none;" id="pid"><%=pid%></td>
            <td><%=pname%></td><td><%=age%></td><td><%=smoking%></td><td><%=alcohlic%></td>
            <td><%=symtomps%></td><td title="Click to Update" contenteditable="true" id="doctor_reply"><%=rs.getString("doctor_reply")%></td>
            <td id="date"><%=date%></td>
            <td class="submit"><input type="submit" value="Reply" class="btn btn-primary"></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </tbody>
</table>
<%            } else {
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
            var doctor_reply = currentRow.find("#doctor_reply").html();
            var date = currentRow.find("#date").html();

            //trdata = pid + "," + did + "," + doctor_comment + "," + appoint_date_time;
            //alert(trdata);
            window.location.href = "SendReply?pid=" + pid + "&did=" + did + "&doctor_reply=" + doctor_reply + "&date=" + date;

        });
    });
</script>