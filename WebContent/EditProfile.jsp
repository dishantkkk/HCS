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
        <title>Smart Health Care System</title>
        <!-- css -->
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link id="t-colors" href="css/default.css" rel="stylesheet">
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
            String name, email, gender, pass, age, contact, dob, status, pid, address, service, disease;
        %>
        <%
            try {
                String id = request.getParameter("id");
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from table_patient where Pid='" + id + "'");
                if (rs.next()) {
                    pid = rs.getString("Pid");
                    name = rs.getString("Pname");
                    email = rs.getString("Email");
                    pass = rs.getString("Pass");
                    contact = rs.getString("Contact");
                    dob = rs.getString("DOB");
                    gender = rs.getString("Gender");
                    age = rs.getString("age");
                    status = rs.getString("Pstatus");
                    address = rs.getString("Address");
                    //disease = rs.getString("Disease");
                    //service = rs.getString("service_type");
        %>

        <div id="wrapper">

            <jsp:include page="PHeader.jsp"></jsp:include>

                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -120px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img-responsive" alt="" />
                                    </div>
                                </div>
                                <div class="col-lg-6">

                                    <div class="panel-body" style="">
                                        <center><h3>Patient Update Form</h3></center><hr>
                                        <form action="EditProcess.jsp?id=<%=id%>" method="post" name="form" id="form" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient ID</label>
                                                    <input type="text" readonly="" name="pid" id="first_name" class="form-control input-md"   title="Patient ID" value="<%=pid%>">
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
                                                    <label>Password</label>
                                                    <input type="password" name="pass" id="password" class="form-control input-md" value="<%=pass%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Retype Password</label>
                                                    <input type="password" name="cpass" id="confirm_password" class="form-control input-md" value="<%=pass%>">
                                                    <span style="font-size: 12px;" id='message'></span>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient Gender</label>
                                                    <select class="form-control" name="gender" required="">
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
                                                    <label>Doctor DOB</label>
                                                    <input type="text" value="<%=dob%>" placeholder="Select DOB" name="dob" id="dob" onchange="calculateAge();" required="" class="datepicker form-control input-md">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient Age</label>
                                                    <input type="text" value="<%=age%>" readonly="" name="age" id="age" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Marital Status</label>
                                                    <select class="form-control" name="status" required="">
                                                        <option selected="" value="<%=status%>" ><%=status%></option>
                                                        <option value="Married">Married</option>
                                                        <option value="Divorced">Divorced</option>
                                                        <option value="Single">Single</option>
                                                        <option value="Widow">Widow</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="text" name="phone" id="phone" class="form-control input-md" value="<%=contact%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" id="txtEmail" class="form-control input-md" value="<%=email%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="text"  name="address" id="last_name" class="form-control input-md" value="<%=address%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="submit" id="btnValidate" value="Update" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                </div>
                                <%
                                        }
                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </section>
    <%
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
                                                        $(document).ready(function() {
                                                            $("#form").submit(function(e) {
                                                                var pass = $('#password').val();
                                                                var cpass = $('#confirm_password').val();
                                                                if (pass === cpass)
                                                                {
                                                                    var phone = $('#phone').val().length;
                                                                    if (phone !== 10) {
                                                                        alert("Phone number should be 10 digit only.");
                                                                        e.preventDefault();
                                                                        return false;
                                                                    }
                                                                    else
                                                                    {
                                                                    }
                                                                }
                                                                else
                                                                {
                                                                    alert("Password does not match");
                                                                    e.preventDefault();
                                                                    return false;
                                                                }
                                                            });
                                                        });
</script>
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
<script>
    $('#password, #confirm_password').on('keyup', function() {
        if ($('#password').val() === $('#confirm_password').val()) {
            $('#message').html('Matching').css('color', 'green');
        } else
            $('#message').html('Not Matching').css('color', 'red');
    });
</script>
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