<%@page import="com.java.DB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
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
        <style>
            #test {
                -webkit-appearance: none;
                -moz-appearance: none;
                text-indent: 1px;
                text-overflow: '';
            }
        </style>
        <script language="javascript" type="text/javascript">
            var xmlHttp;
            function showDoctor(str) {
                if (typeof XMLHttpRequest !== "undefined") {
                    xmlHttp = new XMLHttpRequest();
                }
                else if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp === null) {
                    alert("Browser does not support XMLHTTP Request");
                    return;
                }
                var url = "doctors.jsp";
                url += "?count=" + str;
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }

            function stateChange() {
                if (xmlHttp.readyState === 4 || xmlHttp.readyState === "complete") {
                    document.getElementById("doctor").innerHTML = xmlHttp.responseText;
                }
            }

            function showFees(str) {
                if (typeof XMLHttpRequest !== "undefined") {
                    xmlHttp = new XMLHttpRequest();
                }
                else if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp === null) {
                    alert("Browser does not support XMLHTTP Request");
                    return;
                }
                var url = "fees.jsp";
                url += "?count=" + str;
                xmlHttp.onreadystatechange = stateChange1;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            function stateChange1() {
                if (xmlHttp.readyState === 4 || xmlHttp.readyState === "complete") {
                    document.getElementById("fees").innerHTML = xmlHttp.responseText;
                }
            }
        </script>
    </head>

    <body id="page-top"  style="background:url('images/bg1.jpg') repeat left top;">
        <%!
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat();
            String s = sdf.format(date);
            Connection con;
            Statement st;
            ResultSet rs;
            String dname, fees, dept, name;
        %>

        <div id="wrapper">

            <jsp:include page="PHeader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -120px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                            <%  String pid = (String) session.getAttribute("pid");
                                if (pid != null) {
                            %>
                            <div class="col-lg-6">
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                    <img src="images/img-1.png" class="img img-responsive" alt="" />
                                </div><br>
                            </div>
                            <div class="col-lg-6">
                                <div class="panel-body" >
                                    <label class="alert alert-info" style="font-size:10px;width:100%;">Note:You can book appointment from 10 AM to 22 PM <br>and after 1 hour from current time.</label>
                                    <center>
                                        <%
                                            String id = (String) session.getAttribute("pid");
                                            name = (String) session.getAttribute("pname");
                                            out.println("<br>Welcome" + "&nbsp;&nbsp;&nbsp;");
                                            out.println("<b>" + name + "</b>");
                                            out.println("<b>&nbsp;&nbsp;&nbsp;&nbsp;" + "[" + id + "]</b>");
                                        %></center><hr>

                                    <%
                                        String msg = (String) session.getAttribute("msg");
                                        if (msg != null) {
                                            session.removeAttribute("msg");
                                            out.println("<div class='alert alert-success'><center>" + msg + "</center></div>");
                                        } else {

                                        }
                                    %>
                                    <center><h3>Book Appointment</h3></center><hr>
                                    <form action="AppointmentReg.jsp" method="post" name="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Select Department</label>
                                                    <select name='department' onchange="showDoctor(this.value)" required="" class="form-control">
                                                        <option selected="" value="" disabled="">Select Department</option>
                                                        <%
                                                            try {
                                                                String query = "select * from dept";
                                                                Connection con = DB.getConnection();
                                                                Statement st = con.createStatement();
                                                                ResultSet rs = st.executeQuery(query);
                                                                while (rs.next()) {
                                                        %>
                                                        <option value="<%=rs.getString("deptName")%>"><%=rs.getString("deptName")%></option>
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
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Select Doctor</label>
                                                    <div id="doctor">
                                                        <select name='doctor' required="" class="form-control">
                                                            <option value=''>Select Doctor</option>
                                                        </select>
                                                    </div>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor Fees</label>
                                                    <div id="fees">
                                                        <select name='fees' required="" id="test" class="form-control">
                                                            <option value=''>Doctor Fees</option>
                                                        </select>
                                                    </div>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Appointment Date Time</label>
                                                    <div class="input-group date" id="datetimepicker">
                                                        <input type="text"  required="" name="appoint_date_time" class="form-control" />
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon-calendar glyphicon"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                    <%
                                        Connection cons = DB.getConnection();
                                        Statement sts = cons.createStatement();
                                        ResultSet rss = sts.executeQuery("select * from appointment where pid='" + pid + "'");
                                        if (rss.next()) {
                                            out.println("<center><a style='color:red;' href='LastAppointment.jsp?id=" + pid + "'>View your Last Appointment</a></center>");
                                        } else {
                                            out.println("<center><h5 style='color:red;'>No Appointment Done Yet!!</h5></center>");
                                        }
                                    %>

                                </div>
                            </div>
                            <%
                                } else {
                                    response.sendRedirect("index.jsp");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/build/css/bootstrap-datetimepicker.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
    <script src="https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/src/js/bootstrap-datetimepicker.js"></script>
    <script>
                                                        $(function() {
                                                            $('#datetimepicker').datetimepicker({
                                                                format: 'YYYY-MM-DD HH:mm',
                                                                minDate: moment().add(1, 'h'), enabledHours: [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]
                                                            });

                                                        });
    </script>
</html>
