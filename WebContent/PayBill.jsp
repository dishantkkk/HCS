<%@page import="com.java.DB"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Smart Health Care System</title>
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
        <%
            String pid = (String) session.getAttribute("pid");
            String pname = (String) session.getAttribute("pname");
            if (pid != null) {
        %>

        <%!
            Connection con, con1, con2;
            Statement st, st1, st2, st3, st4;
            ResultSet rs, rs1, rs2;
            String dname, bill, pname, name, disease, id;
            int count = 0;
        %>

        <div id="wrapper">
            <jsp:include page="PHeader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -100px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">

                                <div class="col-lg-6" style="">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div>
                                </div><br>
                            <%
                                try {
                                    Connection c = DB.getConnection();
                                    Statement s = c.createStatement();
                                    ResultSet rs = s.executeQuery("select * from appointment where pid='" + pid + "' and status='Confirmed' and flag=0");
                                    if (rs.next()) {
                            %>

                            <div class="col-lg-6">

                                <div class="panel-body" style="">
                                    <center><h3>Pay Your Bill</h3></center><hr>
                                        <%
                                            Connection cs = DB.getConnection();
                                            Statement ss = cs.createStatement();
                                            ResultSet rss = ss.executeQuery("select count(*) from appointment where pid='" + pid + "' and status='Confirmed' and flag=0");
                                            if (rss.next()) {
                                                count = rss.getInt(1);
                                                if (count <= 1) {
                                                    out.println("<center><h3 class='label label-info' style='font-size:12px;'>Only <b> " + count + "</b> bill is pending, Pay it now.</h3></center><hr>");
                                                } else {
                                                    out.println("<center><h3 class='label label-info' style='font-size:12px;'>Total <b> " + count + "</b> bill is pending , Pay them one by one.</h3></center><hr>");
                                                }
                                            } else {
                                            }
                                        %>
                                    <form action="BillProcess.jsp" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label style='color:black;'>Patient ID</label>
                                                    <input type='text' name='pid' readonly=""  class='form-control input-md' value="<%=pid%>">
                                                    <div class='validation'></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class='form-group'>
                                                    <label style='color:black;'>Patient Name</label>
                                                    <input type='text' name='pname' readonly=""  class='form-control input-md' value=" <%=pname%> ">
                                                    <div class='validation'></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class='form-group'>
                                                    <label style='color:black;'>Doctor Name</label>
                                                    <input type='text' name='dname' readonly=""  class='form-control input-md' value=" <%=rs.getString("dname")%> ">
                                                    <div class='validation'></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class='form-group'>
                                                    <label style='color:black;'>Appointment Date & Time</label>
                                                    <input type='text' name='appoint_date_time' readonly=""  class='form-control input-md' value=" <%=rs.getString("appoint_date_time")%> ">
                                                    <div class='validation'></div>
                                                </div>
                                            </div>
                                            <input type='hidden' name='did'  class='form-control input-md' value=" <%=rs.getString("did")%> ">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class='form-group'>
                                                    <label style='color:black;'>Patient Bill</label>
                                                    <input type='text' name='amount' readonly=""  class='form-control input-md' value=" <%=rs.getString("fees")%> ">
                                                    <div class='validation'></div>
                                                </div>
                                            </div></div>
                                        <input type="submit" value="Pay Bill" class="btn btn-skin btn-block btn-lg">
                                        <br><center><a href='LastBill.jsp'>View Bill History</a></center>
                                            <%
                                                    } else {
                                                        out.println("<center><h1 style='font-size:13px;' class='label label-info'>Bill will be generated automatically, when doctor confirms the appointment.</h1></center>");
                                                        out.print("<center><h2>Currently no bill have to pay...</h2></center>");
                                                        out.println("<br><center><a href='LastBill.jsp' style='font-size:16px;'>View Bill History</a></center>");
                                                    }

                                                } catch (Exception e) {
                                                    out.println(e);
                                                }
                                            %>

                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
        </div>
        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
