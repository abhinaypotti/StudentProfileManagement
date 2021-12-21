<%@ page import="java.util.*, com.student.profile.*" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Course List</title>
<style>
body {
  margin: 0;
  font-family: Source Sans Pro,Calibri,Candara,Arial,sans-serif;
   background-color:#edc7b7;
 
}
.boxes1{
  text-align: center;
  margin-top: 25px;
  margin-left: 100px;
  position: relative;
  background-color: #eee2dc;
  width: 300px;
  height: 120px;
  display: inline-block;
}

.boxes2{
  text-align: center;
  margin-top: 20px;
  margin-left: 100px;
  position: relative;
  background-color: #eee2dc;
  width: 200px;
  height: 120px;
  display: inline-block;
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
  width:500px;
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
  width:60%;
  padding:4px 8px;
}

.horizontal-group .right{
  float:left;
  width:60%;
  padding:4px 8px;
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
<%
	List<Course> courses = (List<Course>) request.getAttribute("COURSES");
%>
<body>

<div class="navbar">
  <a href="StudentControllerServlet?command=LOGOUT">Logout</a>
  <div class="dropdown">
  <button class="dropbtn" onclick="myFunction()">Menu
     <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-content" id="myDropdown">
  <a href="StudentControllerServlet?command=HOME">Home</a>
    <a href="StudentControllerServlet?command=VIEW">View Profile</a>
    <a href="StudentControllerServlet?command=REGISTER">Register Courses</a>
    <a href="StudentControllerServlet?command=JOB">Job Profiles</a>
    <a href="StudentControllerServlet?command=UPDATE">Update Password</a>
    
  </div>
  </div> 
</div>


<div class="form-header">
  <h1>COURSE LIST</h1>
</div>
<form action="StudentControllerServlet" method="GET" onsubmit="setcourses()">
<% for(Course temp : courses){ %>
<div class="boxes1">
  <h3><%= temp.getCode() %> | <%= temp.getName() %></h3>
  <input class="form-check-input" type="checkbox" name="course" value="<%= temp.getCode()%>">
</div>
<%} %>
<input type="hidden" name="command" value="REGISTERC">
<!-- <div class="boxes1">
  <h1>15CSE402</h1>
  <input class="form-check-input" type="checkbox" name="15CSE402" id="">
</div>
<div class="boxes1">
<h1>15CSE481</h1>
<input class="form-check-input" type="checkbox" name="15CSE481" id="">
</div>

<div class="boxes2">
  <h1>15CSE376</h1>
  <input class="form-check-input" type="checkbox" name="15CSE376" id="">
</div>
<div class="boxes2">
  <h1>15CSE4370</h1>
  <input class="form-check-input" type="checkbox" name="15CSE4370" id="">
</div>
<div class="boxes2">
  <h1>15CSE351</h1>
  <input class="form-check-input" type="checkbox" name="15CSE351" id="">
</div> -->
<br>
<br><br>
<center>
  <button type="submit" style="margin-top:10px;" class="btn btn-dark">Register</button>
</center>
</form>
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