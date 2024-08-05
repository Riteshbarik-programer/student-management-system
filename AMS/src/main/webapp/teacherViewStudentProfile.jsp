<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<%@page import="ams.model.StudentDao"%>
<%@page import="ams.db.Student"%>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 20%;
}

button:hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}


.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 40%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
<<jsp:include page="teacherWelcomeHeader.jsp"></jsp:include>
<div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   <%
   Student s = new Student();
   String emailid=request.getParameter("emailid");
   Student s1 = StudentDao.getDetails(emailid);
   
   %><div id="id01" class="modal">
        <form class="modal-content animate" action="ams.controller.UpdateStudentPhoto" method="post" enctype="multipart/form-data">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      
    </div>

    <div class="container">
    <% 
  								String photo_name=s1.getPhoto();
  							
  								if(photo_name == null)
  								{
  							%>
  									<img src="profileimg/b2.jpg" style="height: 100px; width: 100px;"><br> 
  							<%
  								}
  								else
  								{
  									//String p1 = "profileimg\\";
  									String p2 = s1.getPhoto();
  								
  							%>
 								<img src=<%=p2 %> style="height: 100px; width: 100px;"><br> 								
  							<%
  								}
  							%>
        <input type="file" name="photo">
      <button type="submit">Upload</button>
       
    </div>

   
  </form>
</div>
          <div class="panel panel-info">
            <div class="panel-heading">
              
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> 
                <% 
  								photo_name=s1.getPhoto();
  							
  								if(photo_name == null)
  								{
  							%>
  									<img alt="User Pic" src="profileimg/b2.jpg" class="img-circle img-responsive"><br> 
  							<%
  								}
  								else
  								{
  									//String p1 = "profileimg\\";
  									String p2 = s1.getPhoto();
  								
  							%>
 								<img alt="User Pic" src=<%=p2 %> class="img-circle img-responsive"><br> 								
  							<%
  								}
  							%>
                
               
                
                </div>
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Father's Name :</td>
                        <td><%=s1.getFathername() %></td>
                     
                      </tr>
                      <tr>
                      <td>Mother's Name :</td>
                        <td><%=s1.getMothername() %></td>
                       </tr>
                      <tr>
                        <td>Date of Birth :</td>
                        <td><%=s1.getDob() %></td>
                      </tr>
                      <tr>
                        <td>Gender :</td>
                        <td><%=s1.getGender() %></td>
                      </tr>
                      <tr>
                        <td>Landmark :</td>
                        <td><%=s1.getPermanent_landmark() %></td>
                      </tr>
                      <tr>
                        <td>City :</td>
                        <td><%=s1.getPermanent_city() %></td>
                      </tr>
                      <tr>
                        <td>Pincode :</td>
                        <td><%=s1.getPermanent_pin() %></td>
                      </tr>
                      <tr>
                        <td>State :</td>
                        <td><%=s1.getPermanent_state() %></td>
                      </tr>
                      <tr>
                        <td>Country :</td>
                        <td><%=s1.getPermanent_country() %></td>
                      </tr>
                      <tr>
                        <td>Branch :</td>
                        <td><%=s1.getBranch() %></td>
                      </tr>
                      <tr>
                        <td>Email :</td>
                        <td><%=s1.getEmailid() %></td>
                      </tr>
                      <tr>
                        <td>Phone Number :</td>
                        <td><%=s1.getMobileno() %></td> 
                      </tr>
                      <tr>
                        <td>Blood Group :</td>
                        <td><%=s1.getBlood_group() %></td> 
                      </tr>
                      <tr>
                        <td>Session</td>
                        <td><%=s1.getSession() %></td> 
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>