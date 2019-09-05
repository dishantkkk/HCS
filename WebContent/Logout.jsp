<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Smart Health Care System</title>
        <script src="js/backNoWork.js"></script>
        <style>
            body{
                background:url('images/bg1.jpg');
                background-repeat: no-repeat;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom">
        <div id="wrapper">

            <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">

                <jsp:include page="Eheader.jsp"></jsp:include>
                    <br><br><br>
                    <!-- Section: intro -->
                    <section id="intro" class="intro">
                        <div class="intro-content">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                            <img src="images/hospital.jpg" class="img img-responsive" alt="" />
                                        </div>
                                    </div>
                                    <div class="col-lg-6" style="background-color: lightgrey;border: 1px solid blueviolet">

                                        <div class="panel-body" style="">
                                            <center><img src="images/logout.png" style="width: 100%"></center><hr>
                                            <%
                                                response.setHeader("Pragma", "no-cache");
                                                response.setHeader("Cache-Control", "no-store");
                                                response.setHeader("Expires", "0");
                                                response.setDateHeader("Expires", -1);
                                                session.invalidate();
                                            %>

                                        <center><h3>Logout Successfully..</h3>

                                        </center>


                                    </div>


                                </div></div></div>

                    </div>
                    </div>

                </section>

                </body>

                </html>
