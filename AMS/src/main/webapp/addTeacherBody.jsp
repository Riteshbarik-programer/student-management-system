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

          
      <!-- content -->
      <div class="porduct-order-agile" style="width: 80%;">
         <form action="ams.controller.AddTeacher" method="post">
            <div class="form-group">
               <p>Name</p>
               <input class="form-control buttom" type="text" name="name" placeholder="" required="">
            </div>
             <div class="form-group">
               <p>Father's Name</p>
               <input class="form-control buttom" type="text" name="fathername" placeholder="" required="">
            </div>
             <div class="form-group">
               <p>Mother's Name</p>
               <input class="form-control buttom" type="text" name="mothername" placeholder="" required="">
            </div>
            <div class="form-group">
               <p>Email </p>
               <input class="form-control buttom" type="email" name="emailid" placeholder="" required="">
            </div>
           <div class="main">
               <div class="form-left-to-w3l">
                  <p>Phone</p>
                  <input class="form-control buttom" type="text" name="mobileno" placeholder="" required="">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>Aadhaar no</p>
                 <input class="form-control buttom" type="text" name="aadharno" placeholder="" required="">
               </div>
            </div>
              <div class="main">
               <div class="form-left-to-w3l">
                  <p>Regd. no</p>
                  <input class="form-control buttom" type="text" name="regdno" placeholder="" required="">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>Department</p>
                 <select class="form-control buttom" name="department">
                        <option value="">Choose</option>
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
                  <input class="form-control buttom" type="text" name="qualification" placeholder="" required="">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                   <div class="form-order"><p>Gender</p>
                     <select class="form-control buttom" name="gender">
                        <option value="">Choose
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
                  
                    <input class="form-control buttom" type="date" name="dob" placeholder="" required="" > 
                  </div>
               <div class="form-left-to-w3l">
                  <p>Blood Group</p>
                 <input class="form-control buttom" type="text" name="blood_group" placeholder="" required="">
               </div>
            </div>
               <p>Permanent Address</p>
            <div style="height: 10px;"></div>
            <div class="main">
            
               <div class="form-left-to-w3l">
               
               <p>Select Country</p>
                  <select class="form-control buttom" id="country" name ="permanent_country">
                     
                  </select>
                  
               </div>
               <div class="form-left-to-w3l">
               <p>State</p>
                  <select class="form-control buttom" name ="permanent_state" id ="state"></select>
                  
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <p>City</p>
                  <input class="form-control buttom" type="text" name="permanent_city" placeholder="" required="">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>District</p>
                  <input class="form-control buttom" type="text" name="permanent_district" placeholder="" required="">
                  <div class="clear"></div>
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <p>Landmark</p>
                  <input class="form-control buttom" type="text" name="permanent_landmark" placeholder="" required="">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>Pin Code</p>
                  <input class="form-control buttom" type="text" name="permanent_pin" placeholder="" required="">
               </div>
            </div>
            
            <p>Present Address</p>
            <div style="height: 10px;"></div>
            <div class="main">
            
               <div class="form-left-to-w3l">
               
               <p>Select Country</p>
                  <select class="form-control buttom" id="country1" name ="present_country">
                     
                  </select>
                  
               </div>
               <div class="form-left-to-w3l">
               <p>State</p>
                  <select class="form-control buttom" name ="present_state" id ="state1"></select>
                  
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <p>City</p>
                  <input class="form-control buttom" type="text" name="present_city" placeholder="" required="">
                  <div class="clear"></div>
               </div>
               <div class="form-left-to-w3l">
                  <p>District</p>
                  <input class="form-control buttom" type="text" name="present_district" placeholder="" required="">
                  <div class="clear"></div>
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <p>Landmark</p>
                  <input class="form-control buttom" type="text" name="present_landmark" placeholder="" required="">
                  <div class="clear"></div>
               </div>
              <div class="form-left-to-w3l">
                  <p>Pin Code</p>
                  <input class="form-control buttom" type="text" name="present_pin" placeholder="" required="">
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
