<!DOCTYPE html>
<%@page import="ams.db.StudentAttendance"%>
<%@page import="ams.model.StudentAttendanceDao"%>
<%@page import="java.util.Iterator"%> 
<%@page import="ams.model.StudentDao"%>
<%@page import="ams.db.Student"%>
<%@page import="java.util.ArrayList"%>





<html xmlns="http://www.w3.org/1999/xhtml">
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
    
     <%
         	String subject = (String)session.getAttribute("subject");
                  	String attendancedate = (String)session.getAttribute("attendancedate");
         %>
    <form method="post" action="ams.controller.StudentAttendanceDate"  class="pure-form">
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
                        <th colspan="1" align="center">Attendance Sheet
                        </th>
                        <th align="center"><a href="studentWelcome.jsp">back</a></th>
                    </tr>
                </thead>
                <tbody>
                    <tr align="Left">
                        <td>Date:
                            <span id="RequiredFieldValidator4" style="visibility:hidden;">*</span>
                        </td>
                        
                        <td rowspan="2" style="vertical-align: middle">
                            <input type="submit" name="btnView" value="View"  class="btn btn-primary" />

                        </td>

                        

                    </tr>
                    <tr align="left">
                        <td>
                            <input type="text" name="attendancedate" value="<%=attendancedate%>">

                        </td>
                        
                        
                    </tr>
                </tbody>
            </table>
            <div>


                <div>
    <table class="table table-bordered table-hover" cellspacing="0" rules="all" border="1"  style="width:50%;border-collapse:collapse;">
        <tr align="center">
            <th align="left" scope="col">Subject</th><th scope="col">Attendence</th>
        </tr>
        <%
        	String emailid = (String)session.getAttribute("emailid");
                    Student s = StudentDao.getDetails(emailid);
                	
                	ArrayList<StudentAttendance> all = StudentAttendanceDao.fetchAttendanceDate(s,emailid,attendancedate);
                	Iterator it = all.iterator();
                	while(it.hasNext())
                	{
                		StudentAttendance s1 = (StudentAttendance)it.next();
                		//String emailid= s1.getEmailid();
                		
                		String status = s1.getStatus();
        %>
        
        
        
        <tr align="center" style="color:Green;background-color:White;">
            <td align="left"><%=s1.getSubject() %></td>
            <td align="left" width="25%">
            <%
							
								if(status!=null)
								{
									if(status.equals("1"))
									{
										%>
										Present
										<%
									}
									if(status.equals("0"))
									{
										%>
										Absent
										<%
									}
								}
								else
								{
							%>
							
								Not Avalaible
							<%
							
								}
							%>
							
                                    
                                </td>
        </tr>
        
<%
				
	}
				%>
        <tr>
            <td>&nbsp;</td><td>&nbsp;</td>
        </tr>
    </table>
</div>
                </div>
            </div>


        </div>
        

</div>
    

</form>
</body>
</html>















