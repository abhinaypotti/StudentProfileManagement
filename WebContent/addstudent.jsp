<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  margin: 0;
  font-family: Source Sans Pro,Calibri,Candara,Arial,sans-serif;
   background-color:#edc7b7;
 
}
.navbar {
  overflow: hidden;
   background-color: #9a1750;
}

.navbar a {
  float: right;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: right;
  overflow: hidden;
}

.dropdown .dropbtn {
  cursor: pointer;
  font-size: 16px;
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn, .dropbtn:focus {
  background-color: #00284d;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #00284d;
  color:white;
}

.show {
  display: block;
}



.signup-form {
  font-family: Source Sans Pro,Calibri,Candara,Arial,sans-serif;
  width:1100px;
  margin:30px auto;
  background:#eee2dc;
  border-radius: 10px;
}

/*---------------------------------------*/
/* Form Header */
/*---------------------------------------*/
.form-header  {
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.form-header h1 {
  font-size: 30px;
  text-align:center;
  color:black;
  padding:5px 0;
  border-bottom:1px solid #cccccc;
}

/*---------------------------------------*/
/* Form Body */
/*---------------------------------------*/
.form-body {
  padding:10px 40px;
  color:#666;
}

.form-group{
  margin-bottom:20px;
}

.form-body .label-title {
  color:black;
  font-size: 15px;
  font-weight: bold;
}

.form-body .form-input {
    font-size: 13px;
    box-sizing: border-box;
    width: 100%;
    height: 35px;
    padding-left: 10px;
    padding-right: 10px;
    color: #333333;
    text-align: left;
    border: 1px solid #c2c2c2;
    border-radius: 4px;
    background: white;
    outline: none;
}



.horizontal-group .left{
  float:left;
  width:28%;
  padding:4px 20px;
}

.horizontal-group .right{
  float:left;
  width:28%;
  padding:4px 20px;
}

input[type="file"] {
  outline: none;
  cursor:pointer;
  font-size: 17px;
}

#range-label {
  width:15%;
  padding:5px;
  background-color: black;
  color:white;
  border-radius: 5px;
  font-size: 17px;
  position: relative;
  top:-8px;
}


::-webkit-input-placeholder  {
  color:#d9d9d9;
}

/*---------------------------------------*/
/* Form Footer */
/*---------------------------------------*/
.signup-form .form-footer  {

  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  padding:10px 40px;
  text-align: center;
  border-top: 1px solid #cccccc;
  clear:both;
}

.form-footer span {
  float:left;
  margin-top: 10px;
  color:#999;  
  font-style: italic;
  font-weight: thin;
}
.btn {
   display:inline-block;
   padding:10px 20px;
    background-color: #9a1750; 
  color: white; 
   font-size:17px;
   border:none;
   border-radius:5px;
   cursor:pointer;
}

.btn:hover {
  background-color: #00284d;
  color: white;
}
canvas {
  height: 100px;
  width:80px;
  border-style: solid;
  border-width: 1px;
  border-color: black;
}


</style>
</head>
<body>

<div class="navbar">
  <a href="AdminControllerServlet?command=LOGOUT">Logout</a>
  <div class="dropdown">
  <button class="dropbtn" onclick="myFunction()">Menu
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-content" id="myDropdown">
    <a href="AdminControllerServlet?command=HOME">Home</a>
    <a href="AdminControllerServlet?command=ADD">Add student</a>
    <a href="AdminControllerServlet?command=EDIT">Edit student</a>
    <a href="AdminControllerServlet?command=ADDCOURSE">Add course</a>
    <a href="AdminControllerServlet?command=PLACEMENT">Add placement details</a>
    <a href="AdminControllerServlet?command=FEE">Fee details</a>
    <a href="AdminControllerServlet?command=SENDUPDATES">Send Updates</a>
  </div>
  </div> 
</div>

<form class="signup-form" action="AdminControllerServlet" method="GET" >

      <!-- form header -->
      <div class="form-header">
        <h1>ADD STUDENT</h1>
      </div>

      <!-- form body -->
      <div class="form-body">
        <!-- fullname -->
        <div class="horizontal-group">
          <div class="form-group left">
            <label for="full name" class="label-title">Full name</label>
            <input type="text" required id="fullname" name="fullname"  class="form-input" placeholder="Enter your full name"  />
          </div>
          <div class="form-group right">
            <label for="rollno" class="label-title">Roll no</label>
            <input required pattern="CB.EN.U4[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9]" type="text" id="rollno" name="rollno" class="form-input" placeholder="Enter your roll no" />
          </div>
        </div>
        

  
        <div class="horizontal-group">
        
          <div class="form-group left">
            <label class="label-title">Admitted campus</label>
            <select class="form-input" required name="campus" id="campus" >
              
              <option value="C">Coimbatore</option>
              <option value="B">Bangalore</option>
              <option value="A">Amritapuri</option>
            </select>
          </div>
          <div class="form-group right">
            <label class="label-title">Degree</label>
            <div class="input-group">
              <label for="btech"><input type="radio" required name="degree" value="btech" id="btech"> B.Tech</label>
              <label for="mtech"><input type="radio" required name="degree" value="mtech" id="mtech"> M.Tech</label>
             
            </div>
          </div>
          
        </div>
        <div class="horizontal-group">
          <div class="form-group left">
            <label class="label-title">Branch</label>
            <select class="form-input" required name="branch" id="branch" >
              
              <option value="cse">CSE</option>
              <option value="ece">ECE</option>
              <option value="eee">EEE</option>
              <option value="eie">EIE</option>
              <option value="civil">Civil</option>
              <option value="mech">Mech</option>
            </select>
          </div>
          
        </div>

        <!-- Gender and Hobbies -->
        <div class="horizontal-group">
          
          <div class="form-group left" >
            <label class="label-title">Section</label>
            <select class="form-input" required name="section" id="section" >
            
              <option value="A">A</option>
              <option value="B">B</option>
              <option value="C">C</option>
              <option value="D">D</option>
              <option value="E">E</option>
            </select>
          </div>
          <div class="form-group right">
          <label for="advisor" class="label-title">Class Advisor</label>
          <input type="text" required id="advisor" name="advisor" placeholder="Enter advisor name" class="form-input">
        </div>
          
        </div>

        <!-- Source of Income and Income -->
        <div class="horizontal-group">
          <div class="form-group left" >
            <label class="label-title">Joining Year</label>
            <select class="form-input" required name="year" id="year" >
              
              <option value="2015">2015</option>
              <option value="2016">2016</option>
              <option value="2017">2017</option>
              <option value="2018">2018</option>
              <option value="2019">2019</option>
              <option value="2020">2020</option>
              <option value="2021">2021</option>
            </select>
          </div>
          
        </div>

        <div class="horizontal-group">
      <div class="horizontal-group">
        <!--DOB-->
        <div class="form-group left">
          <label for="dob" class="label-title">DOB</label>
          <input type="date" id="dob" required name="dob" class="form-input">
        </div>
        <div class="form-group left">
            <label class="label-title">Gender:</label>
            <div class="input-group">
              <label for="male"><input type="radio" name="gender" required value="male" id="male"> Male</label>
              <label for="female"><input type="radio" name="gender" required value="female" id="female"> Female</label>
              <label for="other"><input type="radio" name="gender" required value="other" id="other">Other</label>
              
              
            </div>
          </div>

        <!-- Email -->
        <div class="form-group right">
          <label for="email" class="label-title">Email ID</label>
          <input type="email" id="email" name="email" required class="form-input" placeholder="Enter your email id">
        </div>
        <div class="form-group right">
          <label for="mobile" class="label-title">Mobile</label>
          <input type="text" pattern="[6789][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" required id="mobile" name="mobile" class="form-input" placeholder="Enter your mobile number">
        </div>
        <div class="form-group right">
          <label for="nationality" class="label-title">Nationality</label>
          <input type="text" name="nationality" id="nationality" required placeholder="Enter Nationality" class="form-input">
        </div>
        
        <div class="form-group right">
          <label for="mothertongue" class="label-title">Mother Tongue</label>
          <input type="text" name="mothertongue" id="mothertongue" required placeholder="Enter Mother Tongue" class="form-input">
        </div>
        
        <div class="form-group right">
          <label for="blood" class="label-title">Blood Group</label>
          <input type="text" name="blood" id="blood" placeholder="Enter Blood Group" required class="form-input">
        </div>
     
        
        </div>
        <div class="form-group right">
          <label for="address" class="label-title">Communication Address</label>
          <input type="address" id="address" name="address" class="form-input" required placeholder="Enter the address">
        </div>
      
          </div>

         <div class="horizontal-group">
          <div class="form-group left">
            <label for="pname" class="label-title">Parent/Guardian Name</label>
            <input type="text" id="pname" name="pname" class="form-input" required placeholder="Enter Parent/Guardian name"  />
          </div>
          <div class="form-group right">
          <label for="pmobile" class="label-title">Parent/Guardian Mobile</label>
          <input type="text" name="pmobile" required pattern="[789][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" id="pmobile" class="form-input" placeholder="Enter the mobile number">
        </div>
        <div class="form-group right">
          <label for="pemail" class="label-title">Parent/Guardian Email ID</label>
          <input type="email" name="pemail" required id="pemail" class="form-input" placeholder="Enter the email id">
        </div>
        <div class="form-group right">
          <label for="hname" class="label-title">Hostel Name</label>
          <input type="text" name="hname" required id="hname" class="form-input" placeholder="Enter the hostel name">
        </div>
        <div class="form-group right">
          <label for="room" class="label-title">Room No</label>
          <input type="text" name="room" required id="room" class="form-input" placeholder="Enter the Room number">
        </div>
        <div class="form-group right">
          <label for="warden" class="label-title">Warden Name</label>
          <input type="text" name="warden" required id="warden" class="form-input" placeholder="Enter the warden name">
        </div>
        <div class="form-group left">
          <label for="passOne" class="label-title">Password</label>
          <input type="password" id="passOne" required name="passOne" class="form-input" placeholder="Enter password"/>
        </div>
         
        <input type="hidden" name="command" value="ADDSTUDENT">
          

          
      </div>
      



      <!-- form-footer -->
      <div class="form-footer">
      
       <script src="https://www.dukelearntoprogram.com/course1/common/js/image/SimpleImage.js">
</script>
<h3>Upload student photo</h3>
<canvas id= "canv1" ></canvas>

<h4>
<input type="file" multiple="false" accept="image/*" name="finput" id="finput" onchange="upload()">
</h4>
<script>function upload(){
  var imgcanvas = document.getElementById("canv1");
  var fileinput = document.getElementById("finput");
  var image = new SimpleImage(fileinput);
  image.drawTo(imgcanvas);
}</script>
        
        <input type="submit"  class="btn">
      </div>
      
    </form>

    <!-- Script for range input label -->
    <script>
      var rangeLabel = document.getElementById("range-label");
      var experience = document.getElementById("experience");

      function change() {
      rangeLabel.innerText = experience.value + "K";
      }
    </script>

<script>
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");}
window.onclick = function(e) {
  if (!e.target.matches('.dropbtn')) {
  var myDropdown = document.getElementById("myDropdown");
    if (myDropdown.classList.contains('show')) {
      myDropdown.classList.remove('show');
    }
  }
}
</script>
</body>
</html>