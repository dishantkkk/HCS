<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.java.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Smart Health Care System</title>
        <!-- css -->
        <jsp:include page="DHeader.jsp"></jsp:include>
            <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
            <!-- boxed bg -->
            <link id="bodybg" href="css/bg1.css" rel="stylesheet" type="text/css" />
            <!-- css -->
            <link href="css/style.css" rel="stylesheet"/>
            <!-- template skin -->
            <link id="t-colors" href="css/default.css" rel="stylesheet">
            <!-- template skin -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script>
                $(document).ready(function() {
                    $("update").click(function() {
                        $("#ul").removeAttr("style");
                    });
                });

            </script>
            <script>
                function showHint()
                {
                    if (str.length === 0)
                    {
                        document.getElementById("display1").innerHTML = "";
                        return;
                    }
                    else
                    {
                        var xmlhttp = new XMLHttpRequest();
                        xmlhttp.onreadystatechange = function()
                        {
                            if (this.readyState === 4 && this.status === 200)
                            {
                                document.getElementById("display1").innerHTML = this.responseText;
                            }
                        };
                        xmlhttp.open("GET", "PInsert1.jsp", true);
                        xmlhttp.send();
                    }
                }
            </script>
            <style>
                input::-webkit-calendar-picker-indicator
                {
                    display: none;
                }
                #display table
                {


                }
                #display table tr
                {
                    padding:5px;
                }
            </style>
        </head>

        <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') no-repeat;">
            <script type="text/javascript">

                $(document).ready(function() {

                    var counter = 2;

                    $("#addButton").click(function() {

                        if (counter > 10)
                        {
                            alert("Only 10 textboxes allow");
                            return false;
                        }

                        var newTextBoxDiv = $(document.createElement('div'))
                                .attr("id", 'TextBoxDiv' + counter);

                        newTextBoxDiv.after().html('<br><label>Symptom #' + counter + ' : </label>' +
                                '<input type="text" name="sym' + counter +
                                '" id="sym' + counter + '" value="" placeholder="Enter Symptom Here..." class="form-control" list="somethingelse5" ><br>' +
                                '<datalist id="somethingelse" />');


                        newTextBoxDiv.appendTo("#TextBoxesGroup");


                        counter++;
                    });

                    $("#removeButton").click(function() {
                        if (counter === 2) {
                            alert("No more textbox to remove");
                            return false;
                        }

                        counter--;

                        $("#TextBoxDiv" + counter).remove();

                    });

                    $("#getButtonValue").click(function() {

                        var msg = '';
                        for (i = 1; i < counter; i++) {
                            msg += "\n Symptom #" + i + " : " + $('#sym' + i).val();
                        }
                        alert(msg);
                    });
                });
            </script>

            <div id="wrapper">


                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top:-85px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                            <%
                                String did = (String) session.getAttribute("did");
                                if (did != null) {
                            %>
                            <div class="col-lg-12">

                                <div class="panel-body" style="margin-top: -98px;">
                                    <center><h3><b>Symptoms</b></h3></center><hr>
                                    <div id="display1">
                                    </div>
                                    <div class="container-fluid">
                                        <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <form name="frm" method="POST" action="">
                                                            <label><small>Start Age</small></label>
                                                            <select required name="age" id="age"  class="form-control">
                                                                <option value="0" selected style="color: rgb(255, 0, 0);">Select Age</option>
                                                                <option value="kid">Kid(0-5)</option>
                                                                <option value="senior&adole">Senior & Adolescent(6-16)</option>
                                                                <option value="young_adult">Young Adult(17-29)</option>
                                                                <option value="adult">Adult(30-64)</option>
                                                                <option value="senior">Senior(65+)</option>
                                                            </select><br>

                                                            <label><small>Gender</small></label>
                                                            <select id="gender" name="gender" class="form-control"><option value="0" style="color: rgb(255, 0, 0);">Please select</option>
                                                                <option value="male">Male</option>
                                                                <option value="female">Female</option>
                                                            </select><br>
                                                            <label><small>Describe in your own words OR select symptom from list:</small>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <button type='button'  id='addButton' class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span></button>
                                                                <button type='button'  id='removeButton' class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></button>
                                                            </label>
                                                            <br>
                                                            <div id='TextBoxesGroup'>
                                                                <div id="TextBoxDiv1">

                                                                    <label>Symptom #1 : </label><input type='textbox' id='sym1' placeholder="Enter Symptom Here..." name="sym1" class="form-control" list="somethingelse5">
                                                                    <datalist id="somethingelse5">
                                                                        <%
                                                                            Connection con15 = DB.getConnection();
                                                                            Statement st15 = con15.createStatement();

                                                                            ResultSet rs12 = st15.executeQuery("select distinct sym from sym");
                                                                            while (rs12.next()) {
                                                                        %>

                                                                        <option style="font-family:Arial" value="<%=rs12.getString(1)%>"><%=rs12.getString(1)%></option>


                                                                        <%
                                                                            }


                                                                        %>

                                                                    </datalist>
                                                                </div>
                                                            </div><br>
                                                            <input type="submit" name="Update" id="update1" value="Search" class="btn btn-primary"/>&nbsp;&nbsp;<input type="reset" name="clean" id="clean" value="Clean" class="btn btn-primary"/>
                                                        </form>
                                                    </div><br>
                                                    <!--<input type='button' value='Get TextBox Value' id='getButtonValue' class="btn btn-info"><br><br>-->



                                                    <div class="col-md-6">

                                                        <form name="frm" method="POST" action="">
                                                            <table class="table table-bordered">
                                                                <tr><th colspan="2" class="text-center text-capitalize">Symptoms Result</th></tr>
                                                                <tr><td >#</td><td class="text-center text-capitalize">Diagnosis List</td></tr>

                                                                <tr class="nav nav-tabs">

                                                                    <td style="background-color:white;">
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="Update" id="update2" value="TOP 5" class="btn btn-info"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <input type="submit" name="Update" id="update" value="ALL" class="btn btn-info"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <input type="button" name="Update" id="update" onclick="location.reload();" value="REFRESH" class="btn btn-info"/>
                                                                    </td>


                                                                </tr>
                                                            </table>

                                                        </form>

                                                        <div id="display">
                                                            <div>

                                                            </div>
                                                        </div>
                                                    </div>

                                                    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
                                                    <script>
                                                                            function showHint()
                                                                            {
                                                                                if (str.length === 0)
                                                                                {
                                                                                    document.getElementById("display1").innerHTML = "";
                                                                                    return;
                                                                                }
                                                                                else
                                                                                {
                                                                                    var xmlhttp = new XMLHttpRequest();
                                                                                    xmlhttp.onreadystatechange = function()
                                                                                    {
                                                                                        if (this.readyState === 4 && this.status === 200)
                                                                                        {
                                                                                            document.getElementById("display1").innerHTML = this.responseText;
                                                                                        }
                                                                                    };
                                                                                    xmlhttp.open("GET", "PInsert1.jsp", true);
                                                                                    xmlhttp.send();
                                                                                }
                                                                            }
                                                    </script>
                                                    <script>
                                                        $("#update1").click(function(e) {
                                                            e.preventDefault();
                                                            var sym1 = $("#sym1").val();
                                                            var sym2 = $("#sym2").val();
                                                            var sym3 = $("#sym3").val();
                                                            var sym4 = $("#sym4").val();
                                                            var sym5 = $("#sym5").val();
                                                            var sym6 = $("#sym6").val();
                                                            var sym7 = $("#sym7").val();
                                                            var sym8 = $("#sym8").val();
                                                            var sym9 = $("#sym9").val();
                                                            var sym10 = $("#sym10").val();

                                                            var age = document.getElementById("age").value;
                                                            if ($("#age option:selected").val() === '0') {

                                                                alert("Please select age");



                                                            }

                                                            if ($("#gender option:selected").val() === '0') {

                                                                alert("Please select gender");



                                                            }

                                                            var gender = document.getElementById("gender").value;

                                                            var dataString = 'sym1=' + sym1 + '&sym2=' + sym2 + '&sym3=' + sym3 + '&sym4=' + sym4 + '&sym5=' + sym5 + '&sym6=' + sym6 + '&sym7=' + sym7 + '&sym8=' + sym8 + '&sym9=' + sym9 + '&sym10=' + sym10 + '&age=' + age + '&gender=' + gender;
                                                            $.ajax({
                                                                type: 'POST',
                                                                data: dataString,
                                                                url: 'PInsert.jsp',
                                                                success: function(data) {
                                                                    document.getElementById("display").innerHTML = data;

                                                                }
                                                            });
                                                        });

                                                        $("#update").click(function(e) {
                                                            e.preventDefault();
                                                            var sym1 = $("#sym1").val();
                                                            var sym2 = $("#sym2").val();
                                                            var sym3 = $("#sym3").val();
                                                            var sym4 = $("#sym4").val();
                                                            var sym5 = $("#sym5").val();
                                                            var sym6 = $("#sym6").val();
                                                            var sym7 = $("#sym7").val();
                                                            var sym8 = $("#sym8").val();
                                                            var sym9 = $("#sym9").val();
                                                            var sym10 = $("#sym10").val();
                                                            var age = document.getElementById("age").value;

                                                            if ($("#age option:selected").val() === '0')
                                                            {

                                                                //alert("Please select age");
                                                            }

                                                            if ($("#gender option:selected").val() === '0')
                                                            {

                                                                //alert("Please select gender");

                                                            }

                                                            var gender = document.getElementById("gender").value;

                                                            var dataString = 'sym1=' + sym1 + '&sym2=' + sym2 + '&sym3=' + sym3 + '&sym4=' + sym4 + '&sym5=' + sym5 + '&sym6=' + sym6 + '&sym7=' + sym7 + '&sym8=' + sym8 + '&sym9=' + sym9 + '&sym10=' + sym10 + '&age=' + age + '&gender=' + gender;

                                                            //var dataString = 'sym1=' + sym1 + '&sym2=' + sym2 + '&sym3=' + sym3 + '&sym4=' + sym4 + '&sym5=' + sym5 + '&sym6=' + sym6 + '&sym7=' + sym7 + '&sym8=' + sym8 + '&sym9=' + sym9 + '&sym10' + sym10;
                                                            $.ajax({
                                                                type: 'POST',
                                                                data: dataString,
                                                                url: 'PInsert1.jsp',
                                                                success: function(data) {

                                                                    document.getElementById("display").innerHTML = data;

                                                                }
                                                            });
                                                        });

                                                        $("#update2").click(function(e) {
                                                            e.preventDefault();
                                                            var sym1 = $("#sym1").val();
                                                            var sym2 = $("#sym2").val();
                                                            var sym3 = $("#sym3").val();
                                                            var sym4 = $("#sym4").val();
                                                            var sym5 = $("#sym5").val();
                                                            var sym6 = $("#sym6").val();
                                                            var sym7 = $("#sym7").val();
                                                            var sym8 = $("#sym8").val();
                                                            var sym9 = $("#sym9").val();
                                                            var sym10 = $("#sym10").val();

                                                            var age = document.getElementById("age").value;

                                                            var gender = document.getElementById("gender").value;
                                                            if ($("#age option:selected").val() === '0') {

                                                                //alert("Please select age");



                                                            }

                                                            if ($("#gender option:selected").val() === '0') {

                                                                //alert("Please select gender");



                                                            }
                                                            var dataString = 'sym1=' + sym1 + '&sym2=' + sym2 + '&sym3=' + sym3 + '&sym4=' + sym4 + '&sym5=' + sym5 + '&sym6=' + sym6 + '&sym7=' + sym7 + '&sym8=' + sym8 + '&sym9=' + sym9 + '&sym10=' + sym10 + '&age=' + age + '&gender=' + gender;
                                                            $.ajax({
                                                                type: 'POST',
                                                                data: dataString,
                                                                url: 'PInsert.jsp',
                                                                success: function(data) {
                                                                    document.getElementById("display").innerHTML = data;

                                                                }
                                                            });
                                                        });


                                                    </script>
                                                    <script>

                                                        function showHint(str) {
                                                            if (str.length === 0)
                                                            {
                                                                document.getElementById("display1").innerHTML = "";
                                                                return;
                                                            }
                                                            else
                                                            {
                                                                var xmlhttp = new XMLHttpRequest();
                                                                xmlhttp.onreadystatechange = function() {
                                                                    if (this.readyState === 4 && this.status === 200) {
                                                                        document.getElementById("display1").innerHTML = this.responseText;
                                                                    }
                                                                };
                                                                xmlhttp.open("GET", "PInsert1.jsp?sym1=" + document.getElementById("sym1").value, true);
                                                                xmlhttp.send();
                                                            }
                                                        }
                                                    </script>
                                                    <script>

                                                        function showHint(str) {
                                                            if (str.length === 0)
                                                            {
                                                                document.getElementById("display1").innerHTML = "";
                                                                return;
                                                            }
                                                            else
                                                            {
                                                                var xmlhttp = new XMLHttpRequest();
                                                                xmlhttp.onreadystatechange = function() {
                                                                    if (this.readyState === 4 && this.status === 200) {
                                                                        document.getElementById("display1").innerHTML = this.responseText;
                                                                    }
                                                                };
                                                                xmlhttp.open("GET", "PInsert1.jsp?sym1=" + document.getElementById("sym1").value, true);
                                                                xmlhttp.send();
                                                            }
                                                        }
                                                    </script>

                                                    <!-- Latest compiled and minified CSS -->
                                                    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

                                                    <!-- jQuery library -->
                                                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

                                                    <!-- Latest compiled JavaScript -->
                                                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                                                </div>
                                            </div>
                                        </div>





                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%                                                                     } else {
                            response.sendRedirect("index.jsp");
                        }
                    %>
                </div>
            </section>
    </body>
</html>
<script>
                                                        $("#update1").click(function(e) {
                                                            e.preventDefault();
                                                            var sym1 = $("#sym1").val();
                                                            var sym2 = $("#sym2").val();
                                                            var sym3 = $("#sym3").val();
                                                            var sym4 = $("#sym4").val();
                                                            var sym5 = $("#sym5").val();
                                                            var sym6 = $("#sym6").val();
                                                            var sym7 = $("#sym7").val();
                                                            var sym8 = $("#sym8").val();
                                                            var sym9 = $("#sym9").val();
                                                            var sym10 = $("#sym10").val();

                                                            var age = document.getElementById("age").value;
                                                            if ($("#age option:selected").val() === '0') {

                                                                //alert("Please select age");



                                                            }

                                                            if ($("#gender option:selected").val() === '0') {

                                                                //alert("Please select gender");



                                                            }

                                                            var gender = document.getElementById("gender").value;

                                                            var dataString = 'sym1=' + sym1 + '&sym2=' + sym2 + '&sym3=' + sym3 + '&sym4=' + sym4 + '&sym5=' + sym5 + '&sym6=' + sym6 + '&sym7=' + sym7 + '&sym8=' + sym8 + '&sym9=' + sym9 + '&sym10=' + sym10 + '&sym11=' + age + '&sym12=' + gender;
                                                            $.ajax({
                                                                type: 'POST',
                                                                data: dataString,
                                                                url: 'PInsert.jsp',
                                                                success: function(data) {
                                                                    document.getElementById("display").innerHTML = data;

                                                                }
                                                            });
                                                        });

                                                        $("#update").click(function(e) {
                                                            e.preventDefault();
                                                            var sym1 = $("#sym1").val();
                                                            var sym2 = $("#sym2").val();
                                                            var sym3 = $("#sym3").val();
                                                            var sym4 = $("#sym4").val();
                                                            var sym5 = $("#sym5").val();
                                                            var sym6 = $("#sym6").val();
                                                            var sym7 = $("#sym7").val();
                                                            var sym8 = $("#sym8").val();
                                                            var sym9 = $("#sym9").val();
                                                            var sym10 = $("#sym10").val();
                                                            var age = document.getElementById("age").value;



                                                            if ($("#age option:selected").val() === '0') {

                                                                //alert("Please select age");



                                                            }

                                                            if ($("#gender option:selected").val() === '0') {

                                                                //alert("Please select gender");



                                                            }

                                                            var gender = document.getElementById("gender").value;

                                                            var dataString = 'sym1=' + sym1 + '&sym2=' + sym2 + '&sym3=' + sym3 + '&sym4=' + sym4 + '&sym5=' + sym5 + '&sym6=' + sym6 + '&sym7=' + sym7 + '&sym8=' + sym8 + '&sym9=' + sym9 + '&sym10=' + sym10 + '&sym11=' + age + '&sym12=' + gender;

                                                            //var dataString = 'sym1=' + sym1 + '&sym2=' + sym2 + '&sym3=' + sym3 + '&sym4=' + sym4 + '&sym5=' + sym5 + '&sym6=' + sym6 + '&sym7=' + sym7 + '&sym8=' + sym8 + '&sym9=' + sym9 + '&sym10' + sym10;
                                                            $.ajax({
                                                                type: 'POST',
                                                                data: dataString,
                                                                url: 'PInsert1.jsp',
                                                                success: function(data) {

                                                                    document.getElementById("display").innerHTML = data;

                                                                }
                                                            });
                                                        });

                                                        $("#update2").click(function(e) {
                                                            e.preventDefault();
                                                            var sym1 = $("#sym1").val();
                                                            var sym2 = $("#sym2").val();
                                                            var sym3 = $("#sym3").val();
                                                            var sym4 = $("#sym4").val();
                                                            var sym5 = $("#sym5").val();
                                                            var sym6 = $("#sym6").val();
                                                            var sym7 = $("#sym7").val();
                                                            var sym8 = $("#sym8").val();
                                                            var sym9 = $("#sym9").val();
                                                            var sym10 = $("#sym10").val();

                                                            var age = document.getElementById("age").value;

                                                            var gender = document.getElementById("gender").value;
                                                            if ($("#age option:selected").val() === '0') {

                                                                //alert("Please select age");



                                                            }

                                                            if ($("#gender option:selected").val() === '0') {

                                                                //alert("Please select gender");



                                                            }
                                                            var dataString = 'sym1=' + sym1 + '&sym2=' + sym2 + '&sym3=' + sym3 + '&sym4=' + sym4 + '&sym5=' + sym5 + '&sym6=' + sym6 + '&sym7=' + sym7 + '&sym8=' + sym8 + '&sym9=' + sym9 + '&sym10=' + sym10 + '&sym11=' + age + '&sym12=' + gender;
                                                            $.ajax({
                                                                type: 'POST',
                                                                data: dataString,
                                                                url: 'PInsert.jsp',
                                                                success: function(data) {
                                                                    document.getElementById("display").innerHTML = data;

                                                                }
                                                            });
                                                        });


</script>
<script>

    function showHint(str) {
        if (str.length === 0)
        {
            document.getElementById("display1").innerHTML = "";
            return;
        }
        else
        {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    document.getElementById("display1").innerHTML = this.responseText;
                }
            };
            xmlhttp.open("GET", "PInsert1.jsp?sym1=" + document.getElementById("sym1").value, true);
            xmlhttp.send();
        }
    }
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

</script>
<script>
    function showResult1(str) {
        if (str.length === 0) {
            document.getElementById("livesearch1").innerHTML = "";
            document.getElementById("livesearch1").style.border = "0px";
            return;
        }
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {  // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById("livesearch1").innerHTML = this.responseText;
                document.getElementById("livesearch1").style.border = "1px solid #A5ACB2";
            }
        }
        xmlhttp.open("GET", "PSyms.jsp?q=" + str, true);
        xmlhttp.send();
    }
</script>
<script>
    function showResult(str) {
        if (str.length === 0) {
            document.getElementById("livesearch").innerHTML = "";
            document.getElementById("livesearch").style.border = "0px";
            return;
        }
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {  // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById("livesearch").innerHTML = this.responseText;
                document.getElementById("livesearch").style.border = "1px solid #A5ACB2";
            }
        }
        xmlhttp.open("GET", "PSyms.jsp?q=" + str, true);
        xmlhttp.send();
    }
</script>
<script>
    function showResult2(str) {
        if (str.length === 0) {
            document.getElementById("livesearch2").innerHTML = "";
            document.getElementById("livesearch2").style.border = "0px";
            return;
        }
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {  // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById("livesearch2").innerHTML = this.responseText;
                document.getElementById("livesearch2").style.border = "1px solid #A5ACB2";
            }
        }
        xmlhttp.open("GET", "PSyms.jsp?q=" + str, true);
        xmlhttp.send();
    }
</script>
<script>
    function showResult3(str) {
        if (str.length === 0) {
            document.getElementById("livesearch3").innerHTML = "";
            document.getElementById("livesearch3").style.border = "0px";
            return;
        }
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {  // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState === 4 && this.status === 200) {
                document.getElementById("livesearch3").innerHTML = this.responseText;
                document.getElementById("livesearch3").style.border = "1px solid #A5ACB2";
            }
        }
        xmlhttp.open("GET", "PSyms.jsp?q=" + str, true);
        xmlhttp.send();
    }
</script>

<script>
    $(function() {
        $('#close').on('click', function() {
            $('#livesearch').hide();
        });
        $('#open').on('click', function() {
            $('#danceforme').show();
        });

    });
</script>
