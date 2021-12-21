<%@ page import="java.util.*, com.student.profile.*" %>

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

<% Student student = (Student) request.getAttribute("student"); 
	String error = (String) request.getAttribute("error");

%>
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


<form class="signup-form" action="AdminControllerServlet" method="GET">

      <!-- form header -->
      <div class="form-header">
        <h1>EDIT STUDENT</h1>
      </div>

      <!-- form body -->
      <div class="form-body">
        <!-- fullname -->

          <div class="form-group " style="width:30% ; align:center";>
            <label for="rollno" class="label-title">Roll no</label>
            <input type="text" id="rollno" required pattern="CB.EN.U4[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9]" name="rollno" class="form-input" placeholder="Enter your roll no" />
             <input type="hidden" name="command" value="SEARCH" >
          </div>
          <button type="submit"  class="btn">Search</button>
          </form>
          <% if(error != null){ %>
          <p style="color:red;"><%= error %> </p>
          <%} %>
          <% if(student != null){ %>
          <form class="signup-form" action="AdminControllerServlet" method="GET">
          <h3>STUDENT DETAILS:</h3>
         
        <div class="horizontal-group">
          <div class="form-group left">
            <label for="full name" class="label-title">Full name</label>
            <input type="text" id="fullname" required name="fullname" value="<%=student.getName() %>" class="form-input" placeholder="Enter your full name"  />
          </div>
          <div class="form-group right">
            <label class="label-title">Degree</label>
            <div class="input-group">
            <%if(student.getDegree().equals("btech")){ %>
              <label for="btech"><input type="radio" required checked="checked" name="degree" value="btech" id="btech"> B.Tech</label>
              <label for="mtech"><input type="radio" required name="degree" value="mtech" id="mtech"> M.Tech</label>
              <%}else{ %>
              <label for="btech"><input type="radio" required name="degree" value="btech" id="btech"> B.Tech</label>
              <label for="mtech"><input type="radio" required checked="checked" name="degree" value="mtech" id="mtech"> M.Tech</label>
              <%} %>
             
            </div>
          </div>
          <div class="form-group left">
            <label class="label-title">Admitted campus</label>
            <select class="form-input" name="campus" id="campus" >
              <option value="C" <%if(student.getCampus().equals("C")){ %> selected <%} %>>Coimbatore</option>
              <option value="B" <%if(student.getCampus().equals("B")){ %> selected <%} %>>Bangalore</option>
              <option value="A" <%if(student.getCampus().equals("A")){ %> selected <%} %>>Amritapuri</option>
            </select>
          </div>
           
          
        </div>
        <div class="horizontal-group">
          
         
          <div class="form-group left">
            <label class="label-title">Branch</label>
            <select class="form-input" name="branch" id="branch" >
              <option value="cse" <%if(student.getBranch().equals("cse")){ %> selected <%} %>>CSE</option>
              <option value="ece" <%if(student.getBranch().equals("ece")){ %> selected <%} %>>ECE</option>
              <option value="eee" <%if(student.getBranch().equals("eee")){ %> selected <%} %>>EEE</option>
              <option value="eie" <%if(student.getBranch().equals("eie")){ %> selected <%} %>>EIE</option>
              <option value="civil" <%if(student.getBranch().equals("civil")){ %> selected <%} %>>Civil</option>
              <option value="mech" <%if(student.getBranch().equals("mech")){ %> selected <%} %>>Mech</option>
            </select>
          </div>
        </div>

        <!-- Gender and Hobbies -->
        <div class="horizontal-group">
          
          <div class="form-group left" >
            <label class="label-title">Section</label>
            <select class="form-input" name="section"  id="section" >
              <option value="A" <%if(student.getSection().equals("A")){ %> selected <%} %> >A</option>
              <option value="B" <%if(student.getSection().equals("B")){ %> selected <%} %>>B</option>
              <option value="C" <%if(student.getSection().equals("C")){ %> selected <%} %>>C</option>
              <option value="D" <%if(student.getSection().equals("D")){ %> selected <%} %>>D</option>
              <option value="E" <%if(student.getSection().equals("E")){ %> selected <%} %>>E</option>
            </select>
          </div>
           <div class="form-group right">
          <label for="advisor" class="label-title">Class Advisor</label>
          <input type="advisor" required value="<%= student.getAdvisor() %>" id="advisor" name="advisor" class="form-input">
        </div>
          
        </div>

        <!-- Source of Income and Income -->
        <div class="horizontal-group">
          <div class="form-group left" >
            <label class="label-title">Joining Year</label>
            <select class="form-input" value="<%= student.getJoining() %>" name="year" id="year" >
              <option value="2015" <%if(student.getJoining().equals("2015")){ %> selected <%} %>>2015</option>
              <option value="2016" <%if(student.getJoining().equals("2016")){ %> selected <%} %>>2016</option>
              <option value="2017" <%if(student.getJoining().equals("2017")){ %> selected <%} %>>2017</option>
              <option value="2018" <%if(student.getJoining().equals("2018")){ %> selected <%} %>>2018</option>
              <option value="2019" <%if(student.getJoining().equals("2019")){ %> selected <%} %>>2019</option>
              <option value="2020" <%if(student.getJoining().equals("2020")){ %> selected <%} %>>2020</option>
              <option value="2021" <%if(student.getJoining().equals("2021")){ %> selected <%} %>>2021</option>
            </select>
          </div>
          
          
        </div>


        <div class="horizontal-group">
      <div class="horizontal-group">
        <!--DOB-->
        <div class="form-group left">
          <label for="dob" class="label-title">DOB</label>
          <input type="date" required id="dob" value="<%= student.getDob() %>" name="dob"  class="form-input">
        </div>

        <!-- Email -->
        <div class="form-group right">
          <label for="email" class="label-title">Email ID</label>
          <input type="email" required id="email" name="email" value="<%= student.getEmail() %>" class="form-input" placeholder="Enter your email id">
        </div>
        <div class="form-group right">
          <label for="mobile" class="label-title">Mobile</label>
          <input type="mobile" required id="mobile" pattern="[6789][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" name="mobile" value="<%= student.getMobile() %>" class="form-input" placeholder="Enter your mobile number">
        </div>
        <div class="form-group right">
          <label for="nationality" class="label-title">Nationality</label>
          <input type="nationality" required id="nationality" value="<%= student.getNationality() %>" name="nationality" class="form-input">
        </div>
        <div class="form-group right">
          <label for="mothertongue" class="label-title">Mother Tongue</label>
          <input type="mothertongue" required id="mothertongue" name="mothertongue" value="<%= student.getMothertongue() %>" class="form-input">
        </div>
        <div class="form-group left">
            <label class="label-title">Gender:</label>
            <div class="input-group">
            	<% if(student.getGender().equals("male")){ %>
              <label for="male"><input type="radio" checked="checked" required name="gender" value="male" id="male"> Male</label>
              <label for="female"><input type="radio" name="gender" required value="female" id="female"> Female</label>
              <label for="other"><input type="radio" name="gender" required value="other" id="other">Other</label>
              <%}else{ %>
              <label for="male"><input type="radio"  name="gender" required value="male" id="male"> Male</label>
              <label for="female"><input type="radio" checked="checked" required name="gender" value="female" id="female"> Female</label>
              <label for="other"><input type="radio" name="gender" required value="other" id="other">Other</label>
              <%} %>
              

              
            </div>
          </div>
        
        <div class="form-group right">
          <label for="blood" class="label-title">Blood Group</label>
          <input type="blood" id="blood" required value="<%= student.getBlood() %>" name="blood" class="form-input">
        </div>
     
        
        </div>
        <div class="form-group right">
          <label for="address" class="label-title">Communication Address</label>
          <input type="address" id="address" required  name="address" value="<%= student.getAddress() %>" class="form-input" placeholder="Enter the address">
        </div>
        
          
          
          </div>


         <div class="horizontal-group">
        
          <div class="form-group left">
            <label for="pname" class="label-title">Parent/Guardian Name</label>
            <input type="text" id="pname" required value="<%= student.getPname() %>" name="pname" class="form-input" placeholder="Enter Parent/Guardian name"  />
          </div>
          <div class="form-group right">
          <label for="pmobile" class="label-title">Parent/Guardian Mobile</label>
          <input type="pmobile" id="pmobile" pattern="[6789][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" required name="pmobile" value="<%= student.getPmobile() %>" class="form-input" placeholder="Enter the mobile number">
        </div>
        <div class="form-group right">
          <label for="pemail" class="label-title">Parent/Guardian Email ID</label>
          <input type="email" id="pemail" required name="pemail" class="form-input" value="<%= student.getPemail() %>" placeholder="Enter the email id">
        </div>
         <div class="form-group right">
          <label for="hname" class="label-title">Hostel Name</label>
          <input type="hname" id="hname" required name="hname" class="form-input" value="<%= student.getHostel() %>" placeholder="Enter the hostel name">
        </div>
        <div class="form-group right">
          <label for="room" class="label-title">Room No</label>
          <input type="room" id="room" required name="room" class="form-input" value="<%= student.getRoom() %>" placeholder="Enter the Room number">
        </div>
        <div class="form-group right">
          <label for="warden" class="label-title">Warden Name</label>
          <input type="warden" id="warden" required name="warden" class="form-input" value="<%= student.getWarden() %>" placeholder="Enter the warden name">
        </div>
         <div class="form-group left">
          <label for="passOne" class="label-title">Password</label>
          <input type="password" id="passOne" required name="passOne" class="form-input" value="<%= student.getPassword() %>" placeholder="Enter password"/>
        </div> 

          
      </div>
      



      <!-- form-footer -->
      <div class="form-footer">
        <script src="https://www.dukelearntoprogram.com/course1/common/js/image/SimpleImage.js">
</script>
<h3>Upload student photo</h3>
<canvas id= "canv1" ></canvas>

<h4>
<input type="file" multiple="false" accept="image/*" id=finput onchange="upload()">
</h4>
<script>function upload(){
  var imgcanvas = document.getElementById("canv1");
  var fileinput = document.getElementById("finput");
  var image = new SimpleImage(fileinput);
  image.drawTo(imgcanvas);
}</script>
        <input type="hidden" name="command" value="UPDATE">
        <input type="hidden" name="rollno" value="<%= student.getRollno() %>">
        
        <button type="submit" class="btn">Submit</button>
      </div>
      
    </form>
    
    <%} %>

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