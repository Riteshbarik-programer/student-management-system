<%@page import="ams.model.StudentDao"%>
<%@page import="ams.db.Student"%>
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
	Student s1 = StudentDao.getDetails(emailid);
%>
          
      <!-- content -->
      <div class="porduct-order-agile" style="width: 80%;">
         <form action="ams.controller.UpdateStudent" method="post">
            <div class="form-group">
               <p>Name</p>
               <input class="form-control buttom" type="text" name="name" placeholder="" value="<%=s1.getName()%>">
            </div>
             <div class="form-group">
               <p>Father's Name</p>
               <input class="form-control buttom" type="text" name="fathername" placeholder="" value="<%=s1.getFathername()%>">
            </div>
             <div class="form-group">
               <p>Mother's Name</p>
               <input class="form-control buttom" type="text" name="mothername" placeholder="" value="<%=s1.getMothername()%>">
            </div>
            <div class="form-group">
               <p>Email </p>
               <input class="form-control buttom" type="email" name="emailid" placeholder="" value="<%=s1.getEmailid()%>">
            </div>
           <div class="main">
               <div class="form-left-to-w3l">
                  <p>Phone</p>
                  <input class="form-control buttom" type="text" name="mobileno" placeholder="" value="<%=s1.getMobileno()%>">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>Aadhar no</p>
                 <input class="form-control buttom" type="text" name="aadharno" placeholder="" value="<%=s1.getAadharno()%>">
               </div>
            </div>
              <div class="main">
               <div class="form-left-to-w3l">
                  <p>Regd. no</p>
                  <input class="form-control buttom" type="text" name="regdno" placeholder="" value="<%=s1.getRegdno()%>">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>Branch</p>
                 <select class="form-control buttom" name="branch">
                        <option value="<%=s1.getBranch()%>"><%=s1.getBranch()%></option>
                        <option value="CSE">CSE</option>
                        <option value="Mech">Mech</option>
                        <option value="Civil">Civil</option>
                        <option value="EE">EE</option>
                     </select>
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <p>Session</p>
                  <input class="form-control buttom" type="text" name="session" placeholder="" value="<%=s1.getSession()%>">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>Semester</p>
                 <select class="form-control buttom" name="semester">
                        <option value="<%=s1.getSemester()%>"><%=s1.getSemester()%></option>
                        <option value="1st">1st</option>
                        <option value="2nd">2nd</option>
                       <option value="3rd">3rd</option>
                       <option value="4th">4th</option>
                       <option value="5th">5th</option>
                       <option value="6th">6th</option>
                       <option value="7th">7th</option>
                        <option value="8th">8th</option>
                     </select>
               </div>
            </div>
              <div class="main">
                  <div class="form-order"><p>Gender</p>
                     <select class="form-control buttom" name="gender">
                        <option value="<%=s1.getGender()%>"><%=s1.getGender()%>
                        </option>
                        <option value="category2">Male</option>
                        <option value="category1">Fe-Male</option>
                        <option value="category3">Other</option>
                     </select>
                  </div>
                  <div class="form-order"><p>Date of Birth</p>
                  
                    <input class="form-control buttom" type="text" name="dob" placeholder="" value="<%=s1.getDob()%>" style="border-color: black; margin-top: 10px;"> 
                  </div>
                   <div class="form-order">
                     <p>Blood group</p>
                 <input class="form-control buttom" type="" name="blood_group" placeholder="" value="<%=s1.getBlood_group()%>" style="border-color: black; margin-top: 10px;">
                  </div>
            </div>
            <p>Permanent Address</p>
            <div style="height: 10px;"></div>
            <div class="main">
            
               <div class="form-left-to-w3l">
               
               <p>Select Country</p>
                  <input class="form-control buttom"  name ="permanent_country" value="<%=s1.getPermanent_country()%>">
                     
                  </input>
                  
               </div>
               <div class="form-left-to-w3l">
               <p>State</p>
                  <input class="form-control buttom" name ="permanent_state" value="<%=s1.getPermanent_state()%>" ></input>
                  
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <p>City</p>
                  <input class="form-control buttom" type="text" name="permanent_city" placeholder="" value="<%=s1.getPermanent_city()%>">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>District</p>
                  <input class="form-control buttom" type="text" name="permanent_district" placeholder="" value="<%=s1.getPermanent_district()%>">
                  <div class="clear"></div>
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <p>Landmark</p>
                  <input class="form-control buttom" type="text" name="permanent_landmark" placeholder="" value="<%=s1.getPermanent_landmark()%>">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>Pin Code</p>
                  <input class="form-control buttom" type="text" name="permanent_pin" placeholder="" value="<%=s1.getPermanent_pin()%>">
               </div>
            </div>
            
            <p>Present Address</p>
            <div style="height: 10px;"></div>
            <div class="main">
            
               <div class="form-left-to-w3l">
               
               <p>Select Country</p>
                  <input class="form-control buttom"  name ="present_country" value="<%=s1.getPresent_country()%>">
                     
                  </input>
                  
               </div>
               <div class="form-left-to-w3l">
               <p>State</p>
                  <input class="form-control buttom" name ="present_state" value="<%=s1.getPresent_state()%>"></input>
                  
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <p>City</p>
                  <input class="form-control buttom" type="text" name="present_city" placeholder="" value="<%=s1.getPresent_city()%>">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>District</p>
                  <input class="form-control buttom" type="text" name="present_district" placeholder="" value="<%=s1.getPresent_district()%>">
                  <div class="clear"></div>
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <p>Landmark</p>
                  <input class="form-control buttom" type="text" name="present_landmark" placeholder="" value="<%=s1.getPresent_landmark()%>">
                  <div class="clear"></div>
               </div>
              <div class="form-left-to-w3l">
                  <p>Pin Code</p>
                  <input class="form-control buttom" type="text" name="present_pin" placeholder="" value="<%=s1.getPresent_pin()%>">
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
