<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
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
        <!--        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
                <script src="js/bootstrap.min.js" type="text/javascript"></script>
                <script src="js/jquery.min.js" type="text/javascript"></script>-->
        <style>
            .navbar-brand {
                padding: 0px;
            }
            .navbar-brand>img {
                height: 100%;
                padding: 15px;
                width: auto;
            }
            /* EXAMPLE 3

            line height is 20px by default so add 30px top and bottom to equal the new .navbar-brand 80px height  */

            .example3 .navbar-brand {
                height: 80px;
            }
            .example3 .nav >li >a {
                padding-top: 30px;
                padding-bottom: 30px;
            }
            .example3 .navbar-toggle {
                padding: 10px;
                margin: 25px 15px 25px 0;
            }
            body {
                background:url('images/pp2.png') no-repeat center center;
                background-size:cover;

                /* Workaround for some mobile browsers */
                min-height:100%;
            }
            html{
                /* This image will be displayed fullscreen */
                background:url('images/bg1.jpg') no-repeat center center;
                /* Ensure the html element always takes up the full height of the browser window */
                height:100%;
                /* The Magic */
                background-size:cover;
            }

        </style>
        <!-- css -->
        <link href="css/style.css" rel="stylesheet"/>
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') no-repeat;">
        <%
            String name = (String) session.getAttribute("name");
            if (name != null) {
        %>
        <div id="wrapper">
            <div class="example3">
                <nav class="navbar navbar-inverse navbar-static-top" style="background-color: whitesmoke;">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar3">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="AdminHome.jsp"><img src="images/log.png" style="height: 85px;margin-top: -15px;" alt="Dispute Bills"></a>
                        </div>
                        <div id="navbar3" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li class="active"><a href="AdminHome.jsp">Home</a></li>
                                <li><a href="ViewAPatients.jsp">View Patients</a></li>
                                <li><a href="AddDoctor.jsp">Add Doctors</a></li>
                                <li><a href="AddDept.jsp">ADD Department</a></li>
                                <li><a href="AddDCost.jsp">Add Diagnosis Cost</a></li>

                            </ul>
                        </div>
                        <!--/.nav-collapse -->
                    </div>
                    <!--/.container-fluid -->
                </nav>
            </div>

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

                                <div class="panel-body" style="margin-top: -90px;">
                                    <center><h6>Add Patient Form</h6></center><hr>

                                    <form action="AddPProcess.jsp" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient ID</label>
                                                    <input type="text" name="pid" id="first_name" class="form-control input-md"   title="Patient ID" value="<%
                                                        Random random = new Random();
                                                        Set<Integer> randomNumbers = new HashSet<Integer>();
                                                        while (randomNumbers.size() < 1) {
                                                            randomNumbers.add(new Integer(random.nextInt(999) + 10));
                                                        }
                                                        for (Integer randomNumber : randomNumbers) {
                                                            out.println("PID-" + randomNumber);
                                                        }
                                                           %>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient Name</label>
                                                    <input type="text" pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$" name="name" id="last_name" class="form-control input-md" required="" title="Patient name can not be blank and should not contain any digit.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" placeholder="me@example.com" id="last_name" class="form-control input-md" required="" title="Email can not be blank and should contain @ character.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="pass" class="form-control input-md" required="" title="Password should contain at least 1 Uppercase ,1 Lowercase and digit and minimum of 6 character.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="number" name="phone" id="first_name" class="form-control input-md" required="" title="Phone no. should not contain any alaphabets.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient DOB</label>
                                                    <input type="date"  name="dob" id="last_name" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient Gender</label>
                                                    <select name="gender" class="form-control" required="">
                                                        <option selected="" value="-1" disabled="">Select Gender</option>
                                                        <option>Male</option>
                                                        <option>Female</option>
                                                        <option>Other</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Patient Age</label>
                                                    <input type="number"  name="age" id="last_name" class="form-control input-md" required="" title="Age should not contain any alaphabets.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Marital Status</label>
                                                    <select name="status" class="form-control" required="">
                                                        <option selected="" value="-1" disabled="">Select Status</option>
                                                        <option>Married</option>
                                                        <option>Divorced</option>
                                                        <option>Single</option>
                                                        <option>Widow</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <textarea title="Enter your Address" required rows="2" class="form-control" cols="20" name="address"></textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Disease</label>
                                                    <select name="disease" class="form-control" required="">
                                                        <option selected="" value="-1" disabled="">Select Disease</option>
                                                        <option value="Normal Diseases">Normal Diseases</option>
                                                        <option value="Cancer">Cancer</option>
                                                        <option value="Celiac Disease">Celiac Disease</option>
                                                        <option value="Heart Disease">Heart Disease</option>
                                                        <option value="Crohn's & Colitis">Crohn's & Colitis</option>
                                                        <option value="Infectious Diseases">Infectious Diseases</option>
                                                        <option value="Liver Disease">Liver Disease</option>
                                                        <option value="Big Diseases">Big Diseases</option>
                                                        <option value="Private Diseases">Private Diseases</option>
                                                        <option value="Ear, Nose and Throat Diseases">ENT Diseases</option>
                                                        <option value="Other Diseases">Other Diseases</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                </div>
                            </div></div></div>

                </div>
        </div>

    </section>
    <%            } else {
            response.sendRedirect("index.jsp");
        }
    %>
</body>

</html>
