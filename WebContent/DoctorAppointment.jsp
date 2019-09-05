<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.java.DB"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%!
    Connection con;
    Statement st;
    ResultSet rs;
    String dname, pid, bill, pname, name, name1, id;
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Smart Health Care System</title>
        <!-- css -->
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>
    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') no-repeat transparent;">
        <div id="wrapper">
            <jsp:include page="DHeader.jsp"></jsp:include>
            <%
                String name = (String) session.getAttribute("dname");
                String did = (String) session.getAttribute("did");
                if (name != null) {
            %>
            <!-- Section: intro -->
            <section id="intro" class="intro" style="margin-top: -90px;">
                <div class="intro-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                    <img src="images/img-1.png" class="img img-responsive" alt="" />
                                </div><br>
                            </div>
                            <div class="col-lg-6">
                                <div class="panel-body" style="">
                                    <center><img src="images/appointments.jpg" class="img img-responsive" style="height:250px ;width: 100%;"></center><hr>
                                        <%
                                            try {
                                                Connection cons = DB.getConnection();
                                                Statement sts = cons.createStatement();
                                                ResultSet rss = sts.executeQuery("select * from appointment where did='" + did + "' and status='Pending' order by id asc limit 3");
                                                if (rss.next()) {
                                                    Connection con = DB.getConnection();
                                                    Statement st = con.createStatement();
                                                    ResultSet rs = st.executeQuery("select * from appointment where did='" + did + "' and status='Pending' order by id asc limit 3");
                                                    while (rs.next()) {
                                        %>
                                    <center><a href="ViewDoctorAppointment.jsp">View</a>&nbsp;&nbsp;&nbsp;<b><%=rs.getString("pname")%></b>[<b><%=rs.getString("pid")%></b>]
                                        &nbsp;&nbsp;&nbsp;Have fixed a appointment with you.<br><br>On [<%=rs.getString("appoint_date")%>] At [<%=rs.getString("appoint_time")%>] .</center><hr>
                                        <%

                                                    }
                                                    out.println("<hr><center><a style='color:red;font-size:20px'; href='ViewDoctorAppointment.jsp'>View All Appointments</a><hr></center>");
                                                } else {
                                                    out.println("<center><h4 style='color:red;'>No New Appointment Found...</h4><hr></center>");
                                                    out.println("<center><a style='color:red;' href='ViewDoctorAppointment.jsp'>View Appointments</a><hr></center>");
                                                }
                                            } catch (Exception e) {
                                                out.println(e);
                                            }
                                        %>
                                </div>
                            </div>
                        </div>
                    </div>
            </section>
            <%                } else {
                    response.sendRedirect("index.jsp");
                }
            %>
        </div>
    </body>

</html>

