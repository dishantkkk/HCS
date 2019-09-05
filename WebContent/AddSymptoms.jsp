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
    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg')repeat;">
        <%
            String name = (String) session.getAttribute("name");
            if (name != null) {
        %>

        <div id="wrapper" style="min-width: 100%;">
            <jsp:include page="AHeader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -120px;">
                    <div class="intro-content">
                        <div class="container-fluid">
                            <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12 col-xl-12">
                                <div class="panel-body" style="min-width: 100%;">

                                    <center><h3>Add Symptoms &ensp;&ensp;&ensp;&ensp;&ensp;<button type="button" class="btn btn-info btn-md" id="add" name="add">Add More Symptoms</button></h3></center><hr>
                                    <%
                                        String msgs = (String) session.getAttribute("syms");
                                        if (msgs != null) {
                                            session.removeAttribute("syms");
                                            out.println("<center><h5 class='alert alert-success'>" + msgs + "</h5></center>");
                                        } else {

                                        }
                                    %>
                                <form method="GET" action="AddSymptoms" class="form-horizontal form-bordered">
                                    <div class="table-scrollable">
                                        <table class="table table-hover table-bordered">
                                            <thead>
                                                <tr>
                                                    <th> Sr. No. </th>
                                                    <th>Select Age Group </th>
                                                    <th>Select Gender </th>
                                                    <th> Symptom Name </th>
                                                    <th> Disease </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><span id='snum'>1.</span></td>
                                                    <td>
                                                        <select name='age_group[]' required='' id='age_group' class='form-control'>
                                                            <option selected='' disabled='' value=''>Select Age Group</option>
                                                            <option value='Kid'>Kid(0-5) years</option>
                                                            <option value='Junior & Adolescent'>Junior & Adolescent(6-16) years</option>
                                                            <option value='Young Adult'>Young Adult(17-29) years</option>
                                                            <option value='Adult'>Adult(30-64) years</option>
                                                            <option value='Senior'>Senior(65+) years</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <select name='gender[]' required='' id='gender' class='form-control'>
                                                            <option selected='' disabled=''>Select Gender</option>
                                                            <option value='Male'>Male</option>
                                                            <option value='Female'>Female</option>
                                                        </select>
                                                    </td>
                                                    <td><input type='text' placeholder='Symptom Name' class='form-control' required='required' style='width:100%;' name='name[]' id='name'></td>
                                                    <td><input type='text' placeholder='Disease' class='form-control' required='required' style='width:100%;' name='disease[]' id='disease'></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <center><input type="submit" name="symptoms" value="ADD" class="btn btn-success"></center>
                                </form>
                                <center><br><a href="ViewSymptoms.jsp">View Symptoms</a></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</center>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <%            } else {
                response.sendRedirect("index.html");
            }
        %>
    </body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        $("#add").on('click', function(e) {
            var i = 2;
            count = $('table tr').length;
            var data = "<tr><td><span id='snum" + i + "'>" + count + ".</span></td><td><select name='age_group[]' required='' id='age_group' class='form-control'><option selected='' disabled='' value=''>Select Age Group</option><option value='Kid'>Kid(0-5) years</option><option value='Junior & Adolescent'>Junior & Adolescent(6-16) years</option><option value='Young Adult'>Young Adult(17-29) years</option><option value='Adult'>Adult(30-64) years</option><option value='Senior'>Senior(65+) years</option></select</td>\n\
<td><select name='gender[]' required='' id='gender' class='form-control'><option selected='' disabled=''>Select Gender</option><option value='Male'>Male</option><option value='Female'>Female</option></select></td>\n\\n\
<td><input type='text' class='form-control' placeholder='Symptom Name' style='width:100%;' required='required' name='name[]' id='name'></td>\n\\n\
<td><input type='text' placeholder='Disease' class='form-control' required='required' style='width:100%;' name='disease[]' id='disease'></td>\n\\n\
<td><button type='button' class='btn btn-danger' name='delete' id='delete'><span class='glyphicon glyphicon-trash'></span</button></td></tr>";
            $('table').append(data);
            i++;
        });
        $("table").on('click', '#delete', function() {
            $(this).parents("tr").remove();
        });
    });

</script>