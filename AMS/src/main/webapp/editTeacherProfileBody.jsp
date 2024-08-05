<%@page import="ams.model.TeacherDao"%>
<%@page import="ams.db.Teacher"%>
<link rel="stylesheet" href="css1/style.css" type="text/css" media="all" />


<script type= "text/javascript" src = "js/countries.js"></script>   

<div	 class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Dashboard</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li class="active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">

          <%
          String emailid = (String)session.getAttribute("emailid");
          Teacher t = TeacherDao.getDetails(emailid);
          
          %>
      <!-- content -->
      <div class="porduct-order-agile" style="width: 80%;">
         <form action="ams.controller.UpdateTeacher" method="post">
            <div class="form-group">
               <p>Name</p>
               <input class="form-control buttom" type="text" name="name" placeholder="" value="<%= t.getName()%>" >
            </div>
             <div class="form-group">
               <p>Father's Name</p>
               <input class="form-control buttom" type="text" name="fathername" value="<%= t.getFathername()%>" placeholder="" >
            </div>
             <div class="form-group">
               <p>Mother's Name</p>
               <input class="form-control buttom" type="text" name="mothername" value="<%=t.getMothername()%>" placeholder="" >
            </div>
            <div class="form-group">
               <p>Email </p>
               <input class="form-control buttom" type="email" name="emailid"  placeholder="" value="<%=t.getEmailid()%>" readonly="readonly">
            </div>
           <div class="main">
               <div class="form-left-to-w3l">
                  <p>Phone</p>
                  <input class="form-control buttom" type="text" name="mobileno" placeholder="" value="<%=t.getMobileno()%>">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>Aadhaar no</p>
                 <input class="form-control buttom" type="text" name="aadharno" placeholder="" value="<%=t.getAadharno()%>">
               </div>
            </div>
              <div class="main">
               <div class="form-left-to-w3l">
                  <p>Regd. no</p>
                  <input class="form-control buttom" type="text" name="regdno" placeholder="" value="<%=t.getRegdno()%>" readonly="readonly">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>Department</p>
                 <select class="form-control buttom" name="department">
                        <option value="<%=t.getDepartment()%>"><%=t.getDepartment()%></option>
                        <option value="Cse">Cse</option>
                        <option value="Mech">Mech</option>
                        <option value="Civil">Civil</option>
                        <option value="EE">EE</option>
                     </select>
               </div>
            </div>
            <div>
           <div class="main">
               <div class="form-left-to-w3l">
                  <p>Qualification</p>
                  <input class="form-control buttom" type="text" name="qualification" placeholder="" value="<%=t.getQualification()%>">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                   <div class="form-order"><p>Gender</p>
                     <select class="form-control buttom" name="gender">
                        <option value="<%=t.getGender()%>"><%=t.getGender()%>
                        </option>
                        <option value="male">Male</option>
                        <option value="fe-male">Fe-Male</option>
                        <option value="other">Other</option>
                     </select>
               </div>
            </div>
             </div>
             <div class="main">
                <div class="form-left-to-w3l"><p>Date of Birth</p>
                  
                    <input class="form-control buttom" type="text" name="dob" value="<%= t.getDob()%>" placeholder=""  > 
                  </div>
               <div class="form-left-to-w3l">
                  <p>Blood Group</p>
                 <input class="form-control buttom" type="text" name="blood_group" placeholder="" value="<%= t.getBlood_group()%>">
               </div>
            </div>
               <p>Permanent Address</p>
            <div style="height: 10px;"></div>
            <div class="main">
            
               <div class="form-left-to-w3l">
               
               <p>Select Country</p>
                  <input class="form-control buttom" value="<%= t.getPermanent_country()%>" name ="permanent_country">
                     
                  </input>
                  
               </div>
               <div class="form-left-to-w3l">
               <p>State</p>
                  <input class="form-control buttom" name ="permanent_state" value="<%= t.getPermanent_state()%>"></input>
                  
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <p>City</p>
                  <input class="form-control buttom" type="text" name="permanent_city" placeholder="" value="<%= t.getPermanent_city()%>">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>District</p>
                  <input class="form-control buttom" type="text" name="permanent_district" placeholder="" value="<%= t.getPermanent_district()%>">
                  <div class="clear"></div>
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <p>Landmark</p>
                  <input class="form-control buttom" type="text" name="permanent_landmark" placeholder="" value="<%= t.getPermanent_landmark()%>">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>Pin Code</p>
                  <input class="form-control buttom" type="text" name="permanent_pin" placeholder="" value="<%= t.getPermanent_pin()%>">
               </div>
            </div>
            
            <p>Present Address</p>
            <div style="height: 10px;"></div>
            <div class="main">
            
               <div class="form-left-to-w3l">
               
               <p>Select Country</p>
                  <input class="form-control buttom"  name ="present_country" value="<%= t.getPresent_country()%>">
                     
                  </input>
                  
               </div>
               <div class="form-left-to-w3l">
               <p>State</p>
                  <input class="form-control buttom" name ="present_state" value="<%= t.getPresent_state()%>">
                  
                  </input>
                  
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <p>City</p>
                  <input class="form-control buttom" type="text" name="present_city" placeholder="" value="<%= t.getPresent_city()%>">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>District</p>
                  <input class="form-control buttom" type="text" name="present_district" placeholder="" value="<%= t.getPresent_district()%>">
                  <div class="clear"></div>
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <p>Landmark</p>
                  <input class="form-control buttom" type="text" name="present_landmark" placeholder="" value="<%= t.getPresent_landmark()%>">
                  <div class="clear"></div>
               </div>
              <div class="form-left-to-w3l">
                  <p>Pin Code</p>
                  <input class="form-control buttom" type="text" name="present_pin" placeholder="" value="<%= t.getPresent_pin()%>">
               </div>
            </div>
            
           
            <button type="submit" class="btn btn-primary">Submit</button>
         </form>
      </div> 


        </div> <!-- .content -->
    </div><!-- /#right-panel -->

    <!-- Right Panel -->
<script language="javascript">
	populateCountries("country", "state"); // first parameter is id of country drop-down and second parameter is id of state drop-down
	populateCountries("country1", "state1");
</script>
    

</body>

</html>
