<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/Footer-with-button-logo.css">
        <title>Smart Health Care System</title>
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg')no-repeat;">
        <div id="wrapper">
            <%
                String pid = (String) session.getAttribute("pid");
                if (pid != null) {
            %>
            <jsp:include page="PHeader.jsp"></jsp:include>

                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -90px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div><br><br><br>
                                </div>
                                <div class="col-lg-6">

                                    <div class="panel-body" style="margin-top: -50px;">
                                        <center>
                                        <%
                                            String id = (String) session.getAttribute("pid");
                                            String name = (String) session.getAttribute("pname");
                                            out.println("Welcome" + "&nbsp;&nbsp;&nbsp;");
                                            out.println("<b>" + name + "</b>");
                                            out.println("<b>&nbsp;&nbsp;&nbsp;&nbsp;" + "[" + id + "]</b>");
                                        %></center>
                                    <center><img src="images/patient.jpg" style="width: 100%" class="img img-responsive"></center><hr>
                                    <center><h1>Welcome To Patient Zone.</h1></center>
                                </div></div>

                        </div></div></div>

            </section>
        </div>

    </body>
    <%
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
</html>
