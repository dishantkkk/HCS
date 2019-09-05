<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.java.DB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg')repeat;">
        <div id="wrapper">
            <jsp:include page="Eheader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -130px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/hospital.jpg" class="img img-responsive" alt="" />
                                    </div>
                                </div><br>
                                <div class="col-lg-6">
                                    <div class="panel-body">
                                    <%
                                        String success = (String) session.getAttribute("success");
                                        System.out.println(success);
                                        if (success != null) {
                                            out.println("<center><div class='alert alert-success';color:green;>" + success + "</div></center>");
                                            session.removeAttribute("success");
                                        } else {

                                        }
                                    %>
                                    <%
                                        Connection con = DB.getConnection();
                                        Statement st = con.createStatement();
                                        ResultSet rs = st.executeQuery("select * from admin");
                                        if (rs.next()) {
                                            out.println("<center><h4 class='alert alert-info'>Only One Administrator Can Be Added...</h4></center>");
                                        } else {
                                    %>

                                    <center><h3>Administrator Registration Form</h3></center><hr>

                                    <div class="col-lg-6">
                                        <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                            <img src="images/adminicon.png" style="width: 190px;height: 220px;margin-bottom: 9px;" class="img img-responsive" alt="" />
                                        </div>
                                    </div>
                                    <form action="AddAdmin" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Administrator Name</label>
                                                    <input type="text" name="name" required="" placeholder="Admin Name" id="name" class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password"  required="" placeholder="Password" name="password" id="password" class="form-control input-md" >
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="text" name="email" id="txtEmail" required="" placeholder="Admin Email" id="name" class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="submit" id="btnValidate" value="Submit" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                    <center><a href="forgot.jsp">Forgot Password?</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="AdminForm.jsp">Login Here</a>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <%
            }%>
    </body>
    <script>
        $(document).ready(function(e) {
            $('#btnValidate').click(function() {
                var sEmail = $('#txtEmail').val();
                if ($.trim(sEmail).length === 0) {
                    alert('Please enter valid email address');
                    e.preventDefault();
                }
                if (validateEmail(sEmail)) {
                    //alert('Email is valid');
                }
                else {
                    alert('Invalid Email Address');
                    e.preventDefault();
                }
            });
        });

        function validateEmail(sEmail) {
            var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            if (filter.test(sEmail)) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
</html>
