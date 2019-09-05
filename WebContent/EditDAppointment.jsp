<%@page import="com.java.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <title>Smart Health Care System</title>
        <!-- css -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
        <%!
            Connection con;
            Statement st;
            ResultSet rs;
            String pid, pname, dname, adate, time, dept, fees;
            String id;
        %>
        <%
            try {
                id = request.getParameter("id");
                //String name=(String)session.getAttribute("name");
                //out.println(id);
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from appointment where pid='" + id + "'");
                while (rs.next()) {
                    pid = rs.getString("Pid");
                    pname = rs.getString("Pname");
                    dept = rs.getString("Department");
                    dname = rs.getString("Dname");
                    fees = rs.getString("Fees");
                    adate = rs.getString("App_Date");
                    time = rs.getString("App_Time");
        %>

        <div id="wrapper">
            <jsp:include page="DHeader.jsp"></jsp:include>

                <!-- Section: intro -->
                <section id="intro" class="intro">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div>
                                </div>
                                <div class="col-lg-6">

                                    <div class="panel-body">
                                        <center><%
                                            String id = (String) session.getAttribute("did");
                                            String name = (String) session.getAttribute("dname");
                                            out.println("Welcome" + "&nbsp;&nbsp;&nbsp;");
                                            out.println("<b>" + name + "</b>");
                                            out.println("<b>&nbsp;&nbsp;&nbsp;&nbsp;" + "[" + id + "]</b>");
                                        %></center><hr>
                                    <center><h3>Edit Appointment</h3></center><hr>
                                    <form action="UpdateDAppointment.jsp?id=<%=id%>" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient ID</label>
                                                    <input type="text" required="" disabled="" name="id"  class="form-control input-md"  value="<%=pid%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient Name</label>
                                                    <input type="text" required="" name="name"  disabled="" class="form-control input-md"  value="<%=pname%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Department</label>
                                                    <%
                                                        //String id1=(String)session.getAttribute("pid");
                                                        try {
                                                            //Class.forName("com.mysql.jdbc.Driver");
                                                            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hcs", "root", "");
                                                            st = con.createStatement();
                                                            rs = st.executeQuery("select Department from Table_Doctor where Did='" + id + "'");
                                                            while (rs.next()) {
                                                                dept = rs.getString("Department");
                                                    %>
                                                    <input type="text" required="" name="dept" id="first_name" disabled="" class="form-control input-md" title="Doctor Name" value="<%=dept%>">
                                                    <%
                                                            }
                                                        } catch (Exception e) {
                                                            out.println(e);
                                                        }

                                                    %>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Doctor</label>

                                                    <%                                                            //String id1=(String)session.getAttribute("pid");
                                                        try {
                                                            //Class.forName("com.mysql.jdbc.Driver");
                                                            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hcs", "root", "");
                                                            st = con.createStatement();
                                                            rs = st.executeQuery("select Dname from Table_Doctor where Did='" + id + "'");
                                                            while (rs.next()) {
                                                                dname = rs.getString("Dname");
                                                    %>
                                                    <input type="text" required="" name="doc" id="first_name" disabled="" class="form-control input-md" title="Doctor Name" value="<%=dname%>">
                                                    <%
                                                            }
                                                        } catch (Exception e) {
                                                            out.println(e);
                                                        }

                                                    %>

                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Consultancy Fees</label>

                                                    <%                                                                                                            try {
                                                            //Class.forName("com.mysql.jdbc.Driver");
                                                            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hcs", "root", "");
                                                            st = con.createStatement();
                                                            rs = st.executeQuery("select Fees from Table_Doctor where Dname='" + dname + "'");
                                                            while (rs.next()) {
                                                                fees = rs.getString("Fees");
                                                    %>
                                                    <input type="text" required="" name="fees" id="first_name" disabled="" class="form-control input-md" title="Doctor Name" value="<%=fees%>">
                                                    <%
                                                            }
                                                        } catch (Exception e) {
                                                            out.println(e);
                                                        }

                                                    %>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Appointment Date</label>
                                                    <input type="date" required="" name="date" id="first_name" class="form-control input-md" title="Appointment Date" value="<%=adate%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Appointment Time</label>
                                                    <input type="time" required="" name="time" id="first_name" class="form-control input-md" title="Appointment Time" value="<%=time%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                        </div>


                                        <%
                                                }
                                            } catch (Exception e) {
                                                out.println(e);
                                            }
                                        %>
                                        <input type="submit" value="Update" class="btn btn-skin btn-block btn-lg">

                                    </form><center><a href="CancelAppointment.jsp?id=<%=id%>">Cancel Appointment</a></center>
                                </div>

                            </div>

                        </div>
                    </div></div>

        </div>
    </section>

</body>
</html>