<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<%@page import="ams.model.TeacherDao"%>
<%@page import="ams.db.Teacher"%>
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="vendors/jqvmap/dist/jqvmap.min.css">


    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

</head>

<body>
<%
          String emailid = (String)session.getAttribute("emailid");
          Teacher t1 = TeacherDao.getDetails(emailid);
          
          %>


    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="teacherWelcome.jsp"><%=t1.getName() %></a>
                <a class="navbar-brand hidden" href="teacherWelcome.jsp"><%=t1.getName().substring(0,1) %></a>
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    
                   <!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="editTeacherProfile.jsp" > <i class="menu-icon fa fa-laptop"></i>Edit Profile</a>
                       
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Leave Application</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="teacherLeaveApplication.jsp">Apply</a></li>
                            <li><i class="fa fa-table"></i><a href="teacherViewLeave.jsp">View</a></li>
                            
                        </ul>
                    </li>
                     <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Attendance</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="attendance1.jsp">Take Attendance</a></li>
                            <li><i class="fa fa-table"></i><a href="teacherViewAttendance1.jsp">View Attendance</a></li>
                            
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="http://bputexam.in/schedule.aspx" > <i class="menu-icon fa fa-th"></i>Time Table</a>
                       
                    </li> 

                  

                   
                    <li>
                       
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="chatTeacher.jsp"> <i class="menu-icon fa fa-bar-chart"></i>Chatting</a>
                       
                    </li>

                    <li class="menu-item-has-children dropdown">
                        <a href="http://bputexam.in/studentsection/resultpublished/studentresult.aspx" > <i class="menu-icon fa fa-area-chart"></i>Exam</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-map-o"></i><a href="maps-gmap.html">Schedule</a></li>
                            <li><i class="menu-icon fa fa-street-view"></i><a href="maps-vector.html">Result</a></li>
                        </ul>
                    </li>
                    <h3 class="menu-title">Extras</h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="teacherViewStudent.jsp"> <i class="menu-icon fa fa-glass"></i>View Student</a>
                       
                    </li>
                    
                    <li class="menu-item-has-children dropdown">
                        <a href="teacherFeedback.jsp"> <i class="menu-icon fa fa-glass"></i>Feedback</a>
                        </li>
                       
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                    <div class="header-left">
                        

                        <div class="dropdown for-notification">
                           
                           
                        </div>

                        <div class="dropdown for-message">
                            
                        </div>
                    </div>
                </div>

                <div class="col-sm-5">
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <% 
  								String photo_name=t1.getPhoto();
  							
  								if(photo_name == null)
  								{
  							%>
  									<img src="profileimg/b2.jpg" class="user-avatar rounded-circle" style="height: 50px;width: 50px;"><br> 
  							<%
  								}
  								else
  								{
  									//String p1 = "profileimg\\";
  									String p2 = t1.getPhoto();
  								
  							%>
 								<img src="<%=p2 %>" class="user-avatar rounded-circle" style="height: 50px;width: 50px;"><br> 								
  							<%
  								}
  							%>
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="teacherViewProfile.jsp"><i class="fa fa-user"></i> My Profile</a>

                           

                            <a class="nav-link" href="teacherChangePassword.jsp"><i class="fa fa-cog"></i>Change Password</a>

                            <a class="nav-link" href="ams.controller.TeacherLogout"><i class="fa fa-power-off"></i> Logout</a>
                        </div>
                    </div>

                    <div class="language-select dropdown" id="language-select">
                       
                        
                    </div>

                </div>
            </div>

        </header><!-- /header -->
        <!-- Header-->
        
        <script src="vendors/jquery/dist/jquery.min.js"></script>
    <script src="vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>


    <script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
    <script src="assets/js/dashboard.js"></script>
    <script src="assets/js/widgets.js"></script>
    <script src="vendors/jqvmap/dist/jquery.vmap.min.js"></script>
    <script src="vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script>
        (function($) {
            "use strict";

            jQuery('#vmap').vectorMap({
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: ['#1de9b6', '#03a9f5'],
                normalizeFunction: 'polynomial'
            });
        })(jQuery);
    </script>
        