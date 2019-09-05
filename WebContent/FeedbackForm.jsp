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
        <!-- css -->
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') no-repeat;">
        <%
            String pname = (String) session.getAttribute("pname");
            String dname = (String) session.getAttribute("dname");
            if (pname != null) {
        %>
        <div id="wrapper">
            <jsp:include page="PHeader.jsp"></jsp:include>
                <section id="intro" class="intro" style="width: 100%;">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                    <img src="images/img-1.png" class="img img-responsive" alt="" />
                                </div><br>
                            </div>
                            <div class="col-lg-6">
                                <div class="panel-body" >
                                    <center><h3>Feedback Form</h3></center><hr>
                                    <%
                                        String feed = (String) session.getAttribute("feedback");
                                        if (feed != null) {
                                            session.removeAttribute("feedback");
                                            out.println("<center><div class='alert alert-success'>Your FeedBack has been sent successfully...</div></center>");
                                        } else {

                                        }
                                    %><br>
                                <form action="FeedbackReg.jsp" method="post" role="form" class="contactForm lead">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                            <div class="form-group">
                                                <label>How was our Services?</label>
                                                <select name="service" required="" class="form-control">
                                                    <option selected="" value="" disabled="">Select Choice</option>
                                                    <option>Good</option>
                                                    <option>Excellent</option>
                                                    <option>Average</option>
                                                    <option>Poor</option>
                                                    <option>Very Poor</option>
                                                </select>
                                                <div class="validation"></div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                            <div class="form-group">
                                                <label>Give point to our Management.</label>
                                                <select name="point" required="" class="form-control">
                                                    <option selected="" value="" disabled="">Select Choice</option>
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
                                                <div class="validation"></div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                            <div class="form-group">
                                                <label>How was our Doctor behavior?</label>
                                                <select name="nature" required="" class="form-control">
                                                    <option selected="" value="" disabled="">Select Choice</option>
                                                    <option>Good</option>
                                                    <option>Excellent</option>
                                                    <option>Average</option>
                                                    <option>Poor</option>
                                                    <option>Very Poor</option>
                                                </select>
                                                <div class="validation"></div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                            <div class="form-group">
                                                <label>Preferred Hospital Location</label>
                                                <input type="text" name="hloc" required="" placeholder="Preferred Hospital Location" id="first_name" class="form-control input-md" title="Enter Contact No.">
                                                <div class="validation"></div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label>Feedback</label>
                                                <textarea required rows="3" required="" placeholder="Feedback" class="form-control" cols="45" name="feedback"></textarea>
                                                <div class="validation"></div>
                                            </div>
                                        </div>

                                    </div>

                                    <input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg">
                                </form>

                            </div>

                        </div></div></div>


            </section>
        </div>
        <%
        } else if (dname != null) {
        %>
        <div id="wrapper">
            <jsp:include page="PHeader.jsp"></jsp:include>
                <section id="intro" class="intro" style="width: 100%;">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                    <img src="images/img-1.png" class="img img-responsive" alt="" />
                                </div><br>
                            </div>
                            <div class="col-lg-6">
                                <div class="panel-body" >
                                    <center><h3>Feedback Form</h3></center><hr>
                                    <% String feed1 = (String) session.getAttribute("feedback");
                                        if (feed1 != null) {
                                            session.removeAttribute("feedback");
                                            out.println("<center><div class='alert alert-success'>Your FeedBack has been sent successfully...</div></center>");
                                        } else {

                                        }
                                    %><br>
                                <form action="FeedbackReg.jsp" method="post" role="form" class="contactForm lead">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                            <div class="form-group">
                                                <label>How was our Services?</label>
                                                <select name="service" required="" class="form-control">
                                                    <option selected="" value="" disabled="">Select Choice</option>
                                                    <option>Good</option>
                                                    <option>Excellent</option>
                                                    <option>Average</option>
                                                    <option>Poor</option>
                                                    <option>Very Poor</option>
                                                </select>
                                                <div class="validation"></div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                            <div class="form-group">
                                                <label>Give point to our Management.</label>
                                                <select name="point" required="" class="form-control">
                                                    <option selected="" value="" disabled="">Select Choice</option>
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
                                                <div class="validation"></div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                            <div class="form-group">
                                                <label>How was our Doctor behavior?</label>
                                                <select name="nature" required="" class="form-control">
                                                    <option selected="" value="" disabled="">Select Choice</option>
                                                    <option>Good</option>
                                                    <option>Excellent</option>
                                                    <option>Average</option>
                                                    <option>Poor</option>
                                                    <option>Very Poor</option>
                                                </select>
                                                <div class="validation"></div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                            <div class="form-group">
                                                <label>Preferred Hospital Location</label>
                                                <input type="text" name="hloc" required="" placeholder="Preferred Hospital Location" id="first_name" class="form-control input-md" title="Enter Contact No.">
                                                <div class="validation"></div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label>Feedback</label>
                                                <textarea required rows="3" required="" placeholder="Feedback" class="form-control" cols="45" name="feedback"></textarea>
                                                <div class="validation"></div>
                                            </div>
                                        </div>

                                    </div>

                                    <input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg">
                                </form>

                            </div>

                        </div></div></div>


            </section>
        </div>
        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>

</html>
