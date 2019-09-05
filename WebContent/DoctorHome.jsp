<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Smart Health Care System</title>
        <!-- css -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
        <!-- css -->
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <jsp:include page="DHeader.jsp"></jsp:include>
        </head>
        <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') no-repeat;">
            <div id="wrapper">
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -120px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div><br>
                                </div>
                                <div class="col-lg-6">
                                <%
                                    String name = (String) session.getAttribute("dname");
                                    if (name != null) {
                                %>
                                <div class="panel-body" style="">
                                    <center><%
                                        String id = (String) session.getAttribute("did");
                                        name = (String) session.getAttribute("dname");
                                        out.println("Welcome" + "&nbsp;&nbsp;&nbsp;");
                                        out.println("<b>" + name + "</b>");
                                        out.println("<b>&nbsp;&nbsp;&nbsp;&nbsp;" + "[" + id + "]</b>");
                                        %></center><hr>
                                    <center><img src="images/doctors.jpg" style="width: 100%;"></center><hr>
                                    <center><h1>Welcome To Doctor Zone.</h1></center>
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
    </body>
</html>
