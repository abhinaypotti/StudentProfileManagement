<%@ page import="java.util.*, com.student.profile.*" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
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
  padding:4px 25px;
}

.horizontal-group .right{
  float:left;
  width:28%;
  padding:4px 25px;
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

* {
  box-sizing: border-box;
}

table {
 color:black;
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #cccccc ;
  text-align: left;
  padding: 8px;
}



</style>
</head>

<%
	List<Student> list = (List<Student>) request.getAttribute("students");
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

<form class="signup-form" action="/register" method="post">

      <!-- form header -->
      <div class="form-header">
        <h1>FEE DETAILS</h1>
      </div>

      <!-- form body -->
      <div class="form-body">
        <!-- fullname -->
        <div class="form-group " style="width:30% ; align:center";>
            <label for="rollno" class="label-title">Search student's Name/Roll no : </label>
            <input type="text" id="myInput"  name="myInput" class="form-input" placeholder="Search.." />
             
          </div>

<table>
  <thead>
  <tr>
    <th>ROLL NO</th>
    <th>NAME</th>
    <th>EMAIL ID</th>
    <th>DEGREE</th>
    <th>BRANCH</th>
    <th>STATUS</th>
    

  </tr>
  </thead>
  <tbody id="myTable">
  
  <% for(Student temp: list) {%>
  <tr>
    <td><%= temp.getRollno() %></td>
    <td><%= temp.getName() %></td>
    <td><%= temp.getEmail() %></td>
    <td><%= temp.getDegree() %></td>
    <td><%= temp.getBranch() %></td>
    <% if(temp.getFees().equals("PAID")){ %>
    <td style="background-color:  #99ff99;">PAID</td>
    <%}else{ %>
    <td style="background-color: #ff8080;">PENDING</td>
    <%} %>
  </tr>
  <%} %>
  <!-- <tr>
    <td>CB.EN.U4ECE401</td>

    <td>marry</td>
    <td>marry@gmail.com</td>
    <td>B.Tech</td>
    <td>ECE</td>
    <td style="background-color:  #99ff99;">PAID</td>
  </tr>
  <tr>
    <td>CB.EN.U4EEE401</td>
    <td>priya</td>
    <td>priya@gmail.com</td>
    <td>B.Tech</td>
    <td>EEE</td>
    <td style="background-color: #ff8080;">PENDING</td>
  </tr>
  <tr>
    <td>CB.EN.U4EIE401</td>
    <td>Rahul</td>
    <td>rahul@gmail.com</td>
    <td>M.Tech</td>
    <td>EIE</td>
    <td style="background-color:  #99ff99;">PAID</td>
  </tr>
  <tr>
    <td>CB.EN.U4CSE402</td>
    <td>gautam</td>
    <td>gautam@gmail.com</td>
    <td>B.Tech</td>
    <td>CSE</td>
    <td style="background-color:  #99ff99;">PAID</td>
  </tr>
  <tr>
    <td>CB.EN.U4ECE402</td>

    <td>ramya</td>
    <td>ramya@gmail.com</td>
    <td>B.Tech</td>
    <td>ECE</td>
    <td style="background-color:  #99ff99;">PAID</td>
  </tr>
  <tr>
    <td>CB.EN.U4EEE402</td>
    <td>swetha</td>
    <td>swetha@gmail.com</td>
    <td>B.Tech</td>
    <td>EEE</td>
    <td style="background-color:  #ff8080;">PENDING</td>
  </tr> -->
  
  </tbody>
</table>

          
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