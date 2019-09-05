<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Smart Health Care System</title>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <!-- css -->
        <link href="css/style.css" rel="stylesheet"/>
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat;">
        <%
            String name = (String) session.getAttribute("name");
            if (name != null) {
        %>
        <div id="wrapper">
            <jsp:include page="AEheader.jsp" flush="true"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -90px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div>  <br>
                                </div>
                                <div class="col-lg-6">

                                    <div class="panel-body">
                                        <center><img src="images/admin.jpg" height="130px" style="width: 100%"></center><hr>
                                        <!--                                    <center><h6>Admin: Dharmesh Mourya</h6></center><hr>-->
                                        <b>Patient Management</b>
                                        <p>
                                            Here Admin can View,Add and Remove the already added Patients Details.
                                            Administrator can also add a new Patient for a particular test
                                            under this section.
                                        </p>
                                        <b>Doctor Management</b>
                                        <p>
                                            Here Admin can View,Add and Remove the already added Doctors Details.
                                            Administrator can also add a new Doctor for a particular test
                                            under this section.
                                        </p>
                                        <b>Appointment Management</b>
                                        <p>
                                            Here Admin can View,Add and Remove the already added Appointment Details.
                                            Administrator can also add a new Appointment for a particular test
                                            under this section.
                                        </p>
                                        <b>Feedback Management</b>
                                        <p>
                                            Here Admin can View the already added Feedback Details.
                                            Administrator can also add a new Feedback for a particular test
                                            under this section.
                                        </p>
                                    </div>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            <%            } else {
                    response.sendRedirect("index.jsp");
                }
            %>
        </div>
    </body>

</html>
