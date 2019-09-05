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

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') no-repeat;">
        <%
            String name = (String) session.getAttribute("name");
            if (name != null) {
        %>

        <div id="wrapper">
            <jsp:include page="AHeader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -130px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div>
                                </div><br>
                                <div class="col-lg-6">

                                    <div class="panel-body">
                                        <center><h3>Diagnosis Cost</h3></center><hr>

                                    <%
                                        String msgs = (String) session.getAttribute("msg");
                                        if (msgs != null) {
                                            session.removeAttribute("msg");
                                            out.println("<center><h5 class='alert alert-success'>" + msgs + "</h5></center>");
                                        } else {

                                        }

                                    %>

                                    <div class="col-lg-6">
                                        <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                            <img src="images/heart.png" style="width: 180px;height: 190px;margin-bottom: 9px;" class="img img-responsive" alt="" />
                                        </div>
                                    </div>
                                    <form action="AddDCost" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Diagnosis Name</label>
                                                    <input required="" placeholder="Diagnosis Name" type="text" title="Diagnosis_Name" name="Diagnosis_Name"  class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label> Diagnosis Cost</label>
                                                    <input required="" type="text" placeholder="Enter Cost" title="Enter Cost" name="Cost"  class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                        </div>

                                        <input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                    <center><a href="ViewDCostt.jsp">View Diagnosis Cost</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </center>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </section>
    <%            } else {
            response.sendRedirect("index.jsp");
        }
    %>
</body>

</html>
