<%@ page import="java.util.*, com.student.profile.*" %>

<!DOCTYPE html>
<html>
<title>
Admin home
</title>
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
* {
  box-sizing: border-box;
}

.columns {
  float: left;
  width: 33.3%;
  padding: 8px;
  margin-left: 33.3%;
  
}

.price {
  list-style-type: none;
  border: 1px solid #eee;
  margin: 0;
  padding: 0;
  -webkit-transition: 0.3s;
  transition: 0.3s;
  background:#eee2dc;
}

.price:hover {
  box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}

.price .header {
  background-color: #111;
  color: white;
  font-size: 25px;
}

.price li {
  border-bottom: 1px solid #eee;
  padding: 20px;
  text-align: center;
}

.price .grey {
 background:#eee2dc;
  font-size: 20px;
}

.button {
  background-color: #9a1750;
  border: none;
  color: white;
  padding: 10px 25px;
  text-align: center;
  text-decoration: none;
  font-size: 18px;
}
.button:hover {
  background-color: #00284d;
  color: white;
}
@media only screen and (max-width: 600px) {
  .columns {
    width: 100%;
  }
}
a:link {
  text-decoration: none;
}

a:visited {
  text-decoration: none;
}
</style>
</head>

<%
	Admin admin = (Admin)request.getAttribute("ADMIN");
	
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
<h1 style="text-align:center">WELCOME <%= admin.getUsername()  %> !</h1>
    <div class="columns">
  <ul class="price">
    <li class="header" >Available Activities</li>
    <li><a href="AdminControllerServlet?command=ADD">Add student</a></li>
    <li><a href="AdminControllerServlet?command=EDIT">Edit student</a></li>
    <li><a href="AdminControllerServlet?command=ADDCOURSE">Add course</a></li>
    <li><a href="AdminControllerServlet?command=PLACEMENT">Add placement details</a></li>
    <li><a href="AdminControllerServlet?command=FEE">Fee details</a></li>
    <li><a href="AdminControllerServlet?command=SENDUPDATES">Send Updates</a></li>
  </ul>
</div>
      <br>
      



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