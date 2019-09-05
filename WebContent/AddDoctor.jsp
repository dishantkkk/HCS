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
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
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
                                <li><a href="DoctorsList.jsp">View Doctors</a></li>
                                <li><a href="AddPatient.jsp">Add Patients</a></li>
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

                                <div class="panel-body" style="margin-top: -60px;">
                                    <center><h3>Doctor Registration Form</h3></center><hr>

                                    <form action="AddDProcess.jsp" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor ID</label>
                                                    <input type="text" name="did" required="" id="first_name" class="form-control input-md"   title="Patient ID" value="<%
                                                        Random random = new Random();
                                                        Set<Integer> randomNumbers = new HashSet<Integer>();
                                                        while (randomNumbers.size() < 1) {
                                                            randomNumbers.add(new Integer(random.nextInt(999) + 10));
                                                        }
                                                        for (Integer randomNumber : randomNumbers) {
                                                            out.println("DID-" + randomNumber);
                                                        }
                                                           %>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor Name</label>
                                                    <input type="text" name="name" required id="last_name" class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" required id="last_name" class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" name="pass" required id="last_name" class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor Gender</label>
                                                    <select name="gender" class="form-control">
                                                        <option selected="" value="-1" required disabled="">Select Gender</option>
                                                        <option>Male</option>
                                                        <option>Female</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor Age</label>
                                                    <input type="number"  name="age" required id="last_name" class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Degree</label>
                                                    <select name="degree" required="" class="form-control">
                                                        <option selected="" value="-1" disabled="">Select Degree</option>
                                                        <option>M.B.B.S</option>
                                                        <option>B.D.S</option>
                                                        <option>B.P.T</option>
                                                        <option>B.Sc Nursing</option>
                                                        <option>B.H.M.S</option>
                                                        <option>B.A.M.S</option>
                                                        <option>RADIOGRAPHY</option>
                                                        <option>B.O.T</option>
                                                        <option>Optometry</option>
                                                        <option>Lab Technicians</option>
                                                        <option>B.U.M.S</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Department</label>
                                                    <select name="Department" required class="form-control">
                                                        <option selected="" value="-1" disabled="">Select Department</option>
                                                        <option>Dentist</option>
                                                        <option>Cardiology</option>
                                                        <option>Gynecologist</option>
                                                        <option>Pathologist</option>
                                                        <option>Radiology</option>
                                                        <option>Neurologist</option>
                                                        <option>Obstetrician</option>
                                                        <option>General Physician</option>
                                                        <option>Ayurveda</option>
                                                        <option>ENT Specialist</option>
                                                        <option>Homeopathy</option>
                                                        <option>veterinary physician</option>
                                                        <option>Demo test</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Fees</label>
                                                    <input type="text" required name="fees" id="last_name" class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="text" name="phone" required id="first_name" class="form-control input-md" title="Enter Contact No.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <textarea required rows="2" cols="20" class="form-control" name="address"></textarea>
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
