<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Smart Health Care System</title>
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>
    <body style="background-image: url(images/bg1.jpg);">
        <jsp:include page="Eheader.jsp" flush="true"></jsp:include>

            <!-- Section: intro -->
            <section id="intro" class="intro" style="margin-top: -100px;">
                <div class="intro-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6" style="margin-top: -50px;">
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                    <img src="images/img-1.png" class="img img-responsive" alt="" />
                                </div>
                            </div><br>
                            <div class="col-lg-6">
                                <div class="panel-body">
                                <%
                                    String msg = (String) session.getAttribute("msg");
                                    if (msg != null) {
                                        session.removeAttribute("msg");
                                        out.println("<div class='alert alert-danger'><center>" + msg + "</center></div>");
                                    } else {

                                    }
                                %>
                                <center><h3>Admin Login</h3></center><hr>
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/adminicon.png" style="width: 190px;height: 190px;margin-bottom: 9px;" class="img img-responsive" alt="" />
                                    </div>
                                </div>
                                <form action="AdminDao" method="post" role="form" class="contactForm lead">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="text" required="" placeholder="Email" name="email" id="txtEmail" class="form-control input-md" >
                                                <div class="validation"></div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                            <div class="form-group">
                                                <label>Password</label>
                                                <input type="password" required="" placeholder="password" name="password" id="last_name" class="form-control input-md">
                                                <div class="validation"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" id="btnValidate" value="Login" class="btn btn-skin btn-block btn-lg">
                                </form>
                                <center><a href="forgot.jsp">Forgot Password?</a></center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
