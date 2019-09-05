<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <!-- css -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
        <title>Smart Health Care System</title>
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') no-repeat;">
        <div id="wrapper">
            <jsp:include page="Eheader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -100px;width: 100%">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div><br>
                                </div>
                                <div class="col-lg-6">

                                    <div class="panel-body">
                                        <center><h3>Doctor Forgot Password Form</h3></center>
                                        <%
                                            String msg = (String) session.getAttribute("msg");
                                            if (msg != null) {
                                                session.removeAttribute("msg");
                                                out.println("<div class='alert alert-danger'><center>" + msg + "</center></div>");
                                            } else {
                                            }
                                            String msg1 = (String) session.getAttribute("msg1");
                                            if (msg1 != null) {
                                                session.removeAttribute("msg1");
                                                out.println("<div class='alert alert-success'><center>" + msg1 + "</center></div>");
                                            } else {
                                            }
                                        %><hr>

                                    <div class="col-lg-6">
                                        <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                            <img src="images/doctoricon.jpg" style="width: 190px;height: 190px;margin-bottom: 9px;" class="img img-responsive" alt="" />
                                        </div>
                                    </div>
                                    <form action="GetPassword" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor ID</label>
                                                    <input required="" placeholder="Doctor ID" type="text" title="Enter Doctor ID" name="did"  class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" required="" placeholder="Email" id="txtEmail" name="email" class="form-control input-md" title="Enter your Doctor Email-ID">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="submit" value="Get Password" id="btnValidate" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                    <center><a href="DoctorLogin.jsp">Login Here</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="DoctorForm.jsp">Sign Up Here</a></center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
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
