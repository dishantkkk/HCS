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
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <title>Smart Health Care System</title>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <!-- css -->
        <link href="css/style.css" rel="stylesheet">
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>
    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg');background-repeat: repeat;">
        <div id="wrapper">
            <jsp:include page="DHeader.jsp"></jsp:include>
            <%
                String did = (String) session.getAttribute("did");
                if (did != null) {
            %>

            <!-- Section: intro -->
            <section id="intro" class="intro" style="margin-top: -120px;">
                <div class="intro-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                    <img src="images/img-1.png" class="img img-responsive" alt="" />
                                </div>
                            </div><br><br>
                            <div class="col-lg-6">
                                <div class="panel-body">
                                    <center><h3>Send Your Reply</h3></center><hr>
                                        <%
                                            String pname = request.getParameter("pname");
                                            String pid = request.getParameter("pid");
                                            String date = request.getParameter("date");
                                            String age = request.getParameter("age");
//                                            String msg = (String) session.getAttribute("msg");
//                                            if (msg != null) {
//                                                session.removeAttribute("msg");
//                                                out.println("<center><h4 class='alert alert-success'>" + msg + "</h4></center>");
//                                            } else {
//
//                                            }
                                        %><br>
                                    <form action="SendReply" method="get" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient Name</label>
                                                    <input type="text" name="pname" value="<%=pname%>" id="first_name" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <input type="hidden" name="pid" value="<%=pid%>" id="first_name" class="form-control input-md" required>
                                            <input type="hidden" name="date" value="<%=date%>" id="first_name" class="form-control input-md" required>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient Age</label>
                                                    <input type="text" name="age" value="<%=age%>" id="first_name" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Your Reply / Suggestion</label>
                                                    <textarea required rows="3" placeholder="Your Reply or Suggestion" class="form-control input-md" cols="45" name="doctor_reply"></textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg">
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
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
    <script>

        function checkDoctor(str)
        {
            if (str === "")
            {
                document.getElementById("doctor").innerHTML = "";
                return;
            } else
            {
                if (window.XMLHttpRequest)
                {
                    // code for IE7+, Firefox, Chrome, Opera, Safari                     xmlhttp = new XMLHttpRequest();
                } else
                {
                    // code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function()
                {
                    if (this.readyState === 4 && this.status === 200)
                    {
                        document.getElementById("doctor").innerHTML = this.responseText;
                    }
                };
                xmlhttp.open("Post", "GetDoctor.jsp?message=" + str, true);
                xmlhttp.send();
            }
        }
    </script>
</html>
