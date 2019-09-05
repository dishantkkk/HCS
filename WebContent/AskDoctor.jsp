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
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <title>Smart Health Care System</title>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <!-- css -->
        <link href="css/style.css" rel="stylesheet">
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>
    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg');background-repeat: repeat space;">
        <div id="wrapper">
            <jsp:include page="PHeader.jsp"></jsp:include>

                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -140px;">
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
                                        <center><h3>Send Your Queries</h3></center><hr>
                                        <%
                                            String pname = (String) session.getAttribute("pname");
                                            if (pname == null || pname.equals("")) {
                                                response.sendRedirect("index.jsp");
                                            }
                                            String age = (String) session.getAttribute("age");
                                            String msg = (String) session.getAttribute("msg");
                                            if (msg != null) {
                                                session.removeAttribute("msg");
                                                out.println("<center><h4 class='alert alert-success'>" + msg + "</h4></center>");
                                            } else {

                                            }
                                        %><br>
                                    <form action="AskDoctor" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Name</label>
                                                    <input type="text" name="pname" readonly="" value="<%=pname%>" id="first_name" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Age</label>
                                                    <input type="text" readonly="" name="age" value="<%=age%>" id="last_name" class="form-control input-md" required>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Do you Smoke?</label>
                                                    <select name="smoke" required="" class="form-control">
                                                        <option selected="" value="" required disabled="">Do you Smoke?</option>
                                                        <option>Yes</option>
                                                        <option>No</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Are you Alcohlic?</label>
                                                    <select required="" name="alcohlic" class="form-control">
                                                        <option selected="" value="" required disabled="">Are you Alcohlic?</option>
                                                        <option>Yes</option>
                                                        <option>No</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Select Doctor Department</label>
                                                    <select name="department" onclick="checkDoctor(this.value);" required class="form-control">
                                                        <option selected="" value="" disabled="">Select Department</option>
                                                        <%
                                                            Connection con = DB.getConnection();
                                                            Statement st = con.createStatement();
                                                            ResultSet rs = st.executeQuery("select * from dept");
                                                            while (rs.next()) {
                                                                out.println("<option value='" + rs.getString("deptName") + "'>" + rs.getString("deptName") + "</option>");
                                                            }
                                                        %>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Select Doctor</label>
                                                    <select id="doctor" name="doctor" required class="form-control">
                                                        <option selected="" value="" disabled="">Select Doctor</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label>Your Query</label>
                                                <textarea required rows="3" required="" placeholder="Your Query..." class="form-control" cols="45" name="queries"></textarea>
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
                    // code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
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
