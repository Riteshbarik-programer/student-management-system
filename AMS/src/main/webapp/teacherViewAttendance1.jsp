<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="ams.model.StudentDao"%>
<%@page import="ams.db.Student"%>
<%@page import="java.util.ArrayList"%>
<head><title>
	Student Attendance
</title>
    <style type="text/css">
        .button-success,
        .button-error,
        .button-warning,
        .button-secondary {
            color: white;
            border-radius: 4px;
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
        }

        .button-success {
            background: rgb(28, 184, 65); /* this is a green */
        }

        .button-error {
            background: rgb(202, 60, 60); /* this is a maroon */
        }

        .button-warning {
            background: rgb(223, 117, 20); /* this is an orange */
        }

        .button-secondary {
            background: rgb(66, 184, 221); /* this is a light blue */
        }
    </style>
    <script>


        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
            document.title = "Public Examination Schedule (BPUT)";

        }
    </script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
    <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
    <form action="ams.controller.ViewAttendance" method="post"  class="pure-form">
<div class="aspNetHidden">

</div>



<div class="aspNetHidden">

	
</div>
        <script type="text/javascript">

</script>

        <br />
        <div align="center" id="divReportSection">
            <table class="table table-bordered" style="width: 1200px">
                <thead>
                    <tr>
                        <th colspan="4" align="center">Attendance Sheet
                        </th>
                        <th align="center"><a href="teacherWelcome.jsp">back</a></th>
                    </tr>
                </thead>
                <tbody>
                    <tr align="Left">
                        <td>Date:
                            <span id="RequiredFieldValidator4" style="visibility:hidden;">*</span>
                        </td>
                        <td>Subject:
                            <span id="RequiredFieldValidator1" style="visibility:hidden;">*</span>
                        </td>
                        <td>Branch:  
                            <span id="RequiredFieldValidator2" style="visibility:hidden;">*</span>
                        </td>
                        <td>Semester:  
                            <span id="RequiredFieldValidator3" style="visibility:hidden;">*</span>
                        </td>
                        <td rowspan="2" style="vertical-align: middle">
                            <input type="submit"  value="View"  class="btn btn-primary" />

                        </td>

                        

                    </tr>
                    <tr align="left">
                        <td>
                            <input type="date" name="attendancedate">

                        </td>
                        <td>
                            <select name="subject"  style="width:200px;">
	<option selected="selected" value="0">Select</option>
	<option value="JAVA">JAVA</option>
	<option value="OS">OS</option>
	<option value="DBMS">DBMS</option>
	<option value="C">C</option>

</select>

                        </td>

                        <td>
                            <select name="branch"  style="width:350px;">
	<option value="0">Select Branch</option>
    <option value="CSE">CSE</option>
    <option value="Mech">Mech</option>
    <option value="Civil">Civil</option>
    <option value="EE">EE</option>

</select>

                        </td>

                        <td>
                            <select name="semester"  style="width:150px;">
<option selected="selected" value="0">Select Semester</option>

                                <option value="1st">1st Semester</option>
    <option value="2nd">2nd Semester</option>
    <option value="3rd">3rd Semester</option>
    <option value="4th">4th Semester</option>
    <option value="5th">5th Semester</option>
    <option value="6th">6th Semester</option>
    <option value="7th">7th Semester</option>
    <option value="8th">8th Semester</option>


</select>

                        </td>

                    </tr>
                </tbody>
            </table>
            <div>


                <div>

                    
                    <div>

</div>
                </div>
            </div>


        </div>
        <div id="ValidationSummary1" style="width:100px;display:none;">

</div>
    

</form>
</body>
</html>





