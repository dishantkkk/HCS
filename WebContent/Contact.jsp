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
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
        <script type="text/javascript">
            function check() {
                if ((frm.phone.value).length != 10)
                {
                    alert("Phone Number should be 10 digit only.");
                    return false;
                }
            }
        </script>
    </head>
    <body id="page-top" data-spy="scroll" data-target=".navbar-custom">
        <%
            String pid = (String) session.getAttribute("pid");
            String did = (String) session.getAttribute("did");
            String dphone = (String) session.getAttribute("dphone");
            String pphone = (String) session.getAttribute("pphone");
            String pname = (String) session.getAttribute("pname");
            String dname = (String) session.getAttribute("dname");
            String pemail = (String) session.getAttribute("pemail");
            String demail = (String) session.getAttribute("demail");
            if (pid != null) {
        %>
        <div id="wrapper">
            <jsp:include page="PHeader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -90px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div>
                                </div><br><br>
                                <div class="col-lg-6">
                                    <div class="panel-body" style="">
                                        <center><h3>Contact Us</h3></center><hr>
                                        <%
                                            //String msg1=(String)session.getAttribute("msg1");
                                            String msg = (String) session.getAttribute("msg");
                                            if (msg != null) {
                                                session.removeAttribute("msg");
                                                out.println("<div class='alert alert-success'><center>" + msg + "</center></div>");
                                            } else {

                                            }
                                        %><br>
                                    <form action="ContactDao" method="post" role="form" name="frm" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>User Name</label>
                                                    <input type="text" name="uname" readonly="" value="<%=pname%>" id="first_name" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" readonly="" value="<%=pemail%>" id='txtEmail' class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="number" name="phone" readonly="" value="<%=pphone%>" id="phone" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Subject</label>
                                                    <input type="text" name="subject" placeholder="Subject" id="first_name" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label>Message</label>
                                                    <textarea required rows="3" placeholder="Message..." class="form-control input-md" cols="45" name="message"></textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="submit" onclick="return check();" id="btnValidate" value="Submit" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>
        </div>
        <%
        } else if (did != null) {
        %>
        <div id="wrapper">
            <jsp:include page="DHeader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -90px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div>
                                </div><br><br>
                                <div class="col-lg-6">
                                    <div class="panel-body" style="">
                                        <center><h3>Contact Us</h3></center><hr>
                                        <%
                                            //String msg1=(String)session.getAttribute("msg1");
                                            String msg = (String) session.getAttribute("msg");
                                            if (msg != null) {
                                                session.removeAttribute("msg");
                                                out.println("<div class='alert alert-success'><center>" + msg + "</center></div>");
                                            } else {

                                            }
                                        %><br>
                                    <form action="ContactDao" method="post" role="form" name="frm" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>User Name</label>
                                                    <input type="text" name="uname" readonly="" value="<%=dname%>" id="first_name" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" readonly="" value="<%=demail%>" id='txtEmail' class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="number" name="phone" readonly="" value="<%=dphone%>" id="phone" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Subject</label>
                                                    <input type="text" name="subject" placeholder="Subject" id="first_name" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label>Message</label>
                                                    <textarea required rows="3" placeholder="Message..." class="form-control input-md" cols="45" name="message"></textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="submit" onclick="return check();" id="btnValidate" value="Submit" class="btn btn-skin btn-block btn-lg">
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
        %>
        <div id="wrapper">
            <jsp:include page="Eheader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -90px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div>
                                </div><br><br>
                                <div class="col-lg-6">
                                    <div class="panel-body" style="">
                                        <center><h3>Contact Us</h3></center><hr>
                                        <%
                                            //String msg1=(String)session.getAttribute("msg1");
                                            String msg = (String) session.getAttribute("msg");
                                            if (msg != null) {
                                                session.removeAttribute("msg");
                                                out.println("<div class='alert alert-success'><center>" + msg + "</center></div>");
                                            } else {

                                            }
                                        %><br>
                                    <form action="ContactDao" method="post" role="form" name="frm" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>User Name</label>
                                                    <input type="text" name="uname" placeholder="Username" id="first_name" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" placeholder="Email" id='txtEmail' class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="number" name="phone" placeholder="Phone" id="phone" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Subject</label>
                                                    <input type="text" name="subject" placeholder="Subject" id="first_name" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label>Message</label>
                                                    <textarea required rows="3" placeholder="Message..." class="form-control input-md" cols="45" name="message"></textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="submit" onclick="return check();" id="btnValidate" value="Submit" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>
        </div>
        <%
            }
        %>
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
