<%@page import="com.java.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <title>Smart Health Care System</title>
        <link id="t-colors" href="css/default.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
        <%
            String pid = (String) session.getAttribute("pid");
            if (pid != null) {
        %>
        <%!
            Connection con;
            PreparedStatement ps;
            ResultSet rs;
            Statement st;
            String name, email, service, gender, pass, age, contact, dob, status, pid, room, address, disease;
        %>
        <%
            try {
                String id = request.getParameter("id");
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select Pid,Pname,Email,Pass,Dob,Contact,Age,Gender,Pstatus,Disease,Address from Table_Patient where Pid='" + id + "'");
                if (rs.next()) {
                    pid = rs.getString("Pid");
                    name = rs.getString("Pname");
                    email = rs.getString("Email");
                    pass = rs.getString("Pass");
                    contact = rs.getString("Contact");
                    dob = rs.getString("DOB");
                    gender = rs.getString("Gender");
                    age = rs.getString("Age");
                    status = rs.getString("Pstatus");
                    address = rs.getString("Address");
                    disease = rs.getString("Disease");
                    service = rs.getString("service_type");
                }
        %>

        <div id="wrapper">

            <jsp:include page="PHeader.jsp"></jsp:include>

                <!-- Section: intro -->
                <section id="intro" class="intro">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div>
                                </div>
                                <div class="col-lg-6">

                                    <div class="panel-body" style="margin-top: -60px;">
                                        <center><h3>Edit Patient Registration Form</h3></center><hr>
                                        <form action="EditPProcess.jsp?id=<%=id%>" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient ID</label>
                                                    <input type="text" disabled="" name="pid" id="first_name" class="form-control input-md"   title="Patient ID" value="<%=pid%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient Name</label>
                                                    <input type="text" name="name" id="last_name" class="form-control input-md" value="<%=name%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="text" name="email" id="last_name" class="form-control input-md" value="<%=email%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" name="pass" id="last_name" class="form-control input-md" value="<%=pass%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="text" name="phone" id="first_name" class="form-control input-md" value="<%=contact%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient DOB</label>
                                                    <input type="text" value="<%=dob%>" placeholder="Select DOB" name="dob" id="dob" onchange="calculateAge();" required="" class="datepicker form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient Age</label>
                                                    <input type="text" value="<%=age%>" name="age" id="age" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient Gender</label>
                                                    <select name="gender" class="form-control" required="">
                                                        <option selected="" value="<%=gender%>"><%=gender%></option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                        <option value="Other">Other</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Marital Status</label>
                                                    <select name="status" class="form-control" required="">
                                                        <option selected="" value="<%=status%>"><%=status%></option>
                                                        <option>Married</option>
                                                        <option>Divorced</option>
                                                        <option>Single</option>
                                                        <option>Widow</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="text"  name="address" id="last_name" class="form-control input-md" value="<%=address%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Service Type</label>
                                                    <select name="service" class="form-control" required="">
                                                        <option selected="" value="<%=service%>" disabled=""><%=service%></option>
                                                        <option value="In-Patient">In-Patient</option>
                                                        <option value="Out-Patient">Out-Patient</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                        </div>
                                        <input type="submit" value="Update" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                </div>
                                <%
                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                %>


                            </div>
                        </div></div>
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
        function calculateAge() {
            var today = new Date();
            var dateString = document.getElementById('dob').value;
            //alert(dateString);
            var birthDate = new Date(dateString);
            var age = today.getFullYear() - birthDate.getFullYear();
            var m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                age--;
            }
            document.getElementById('age').value = age;
        }
    </script>
</html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script>
        $(function() {
            $('.datepicker').datepicker({
                format: 'yyyy-mm-dd',
                endDate: '+0d',
                autoclose: true
            });
        });
</script>