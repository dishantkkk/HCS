<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.java.DB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Smart Health Care System</title>
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') no-repeat;">
        <%
            String name = (String) session.getAttribute("name");
            if (name != null) {
        %>

        <div id="wrapper">
            <jsp:include page="AHeader.jsp"></jsp:include>
            <%!String deptName, fees;
                int deptid;
            %>

            <%
                deptid = Integer.parseInt(request.getParameter("id"));
                Connection con = DB.getConnection();
                PreparedStatement ps = con.prepareStatement("select * from dept where deptid=" + deptid + "");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    deptid = rs.getInt("deptid");
                    deptName = rs.getString("deptName");
                    fees = rs.getString("fees");
                }

            %>
            <!-- Section: intro -->
            <section id="intro" class="intro" style="margin-top: -130px;">
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
                                    <center><h3>Update Department</h3></center><hr>
                                    <div class="col-lg-6">
                                        <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                            <img src="images/dept1.png" style="width: 180px;height: 190px;margin-bottom: 9px;" class="img img-responsive" alt="" />
                                        </div>
                                    </div>
                                    <form action="EditDept" method="post" role="form" class="contactForm lead"><br>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Department Name</label>
                                                    <input type="hidden" name="deptid" value="<%=deptid%>">
                                                    <input required="" type="text" title="Enter Department Name" name="deptName" value="<%=deptName%>"  class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor's Fees</label>
                                                    <input required="" type="text" title="Enter Fees" name="fees" value="<%=fees%>"  class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                        </div>
                                        <input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                    <center><a href="ViewDept.jsp">View Departments</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <%            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>

</html>
