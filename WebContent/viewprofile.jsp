<%@ page import="java.util.*, com.student.profile.*" %>

<!DOCTYPE html>
<html>
<head>
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
h2{
    text-align:center;
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

.row {
  margin-left:100px;
  margin-right:100px;
}
  
.column {
  float: left;
  width: 50%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
  
}

tr:nth-child(even) {
 background:#eee2dc;
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other on screens that are smaller than 600 px */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
  }
}
</style>
</head>

<%
	Student student = (Student)request.getAttribute("USER");
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
<h2 >Name : <%= student.getName() %> </h2>
<h2>Roll : <%= student.getRollno() %> </h2>
<img align="left" style="margin-left: 8.3%; margin-top: -8.5%; height:100px" src="data:image/jpeg;base64,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">
<div class="row">
  <div class="column">
    <table>
      <tr >
            <th>Admitted Campus</th>
            <td><%= student.getCampus() %></td>
        </tr>
        <tr>
            <th>Academic Program</th>
            <td><%= student.getDegree() %></td>
        </tr><tr>
            <th>Admitted Branch</th>
            <td><%= student.getBranch() %></td>
        </tr><tr>
            <th>Section</th>
            <td><%= student.getSection() %></td>
        </tr><tr>
            <th>Class Advisor</th>
            <td><%= student.getAdvisor() %></td>
        </tr><tr>
            <th>Joining Year</th>
            <td><%= student.getJoining() %></td>
        </tr><tr>
            <th>Blood Group</th>
            <td><%= student.getBlood() %></td>
        </tr>
    </table>
  </div>
  <div class="column">
    <table>
    <tr>
            <th>Gender</th>
            <td><%= student.getGender() %></td>
        </tr><tr>
            <th>Date of birth</th>
            <td><%= student.getDob() %></td>
        </tr>
      <tr>
                    <th>Mobile</th>
                    <td><%= student.getMobile() %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= student.getEmail() %></td>
                </tr>
                <tr>
                    <th>Nationality</th>
                    <td><%= student.getNationality() %></td>
                </tr>
                
                <tr>
                    <th>Mother Tongue</th>
                    <td><%= student.getMothertongue() %></td>
                </tr>
                <tr>
                    <th>Communication Address</th>
                    <td><%= student.getAddress() %></td>
                </tr>
    </table>
  </div>
</div>
<div class="row">
  <div class="column">
    <table>
     <tr >
                <th colspan="2">Primary Contact - FATHER</th>
            </tr>
            <tr>
                <th>Name</th>
                <td>Mr. <%= student.getPname() %></td>
            </tr>
            <tr>
                <th>Mobile</th>
                <td><%= student.getPmobile() %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= student.getPemail() %></td>
            </tr>
    </table>
  </div>
  <div class="column">
    <table>
       <tr >
                <th>Hostel</th>
                <td><%= student.getHostel() %></td>
            </tr>
            <tr>
                <th>Room No.</th>
                <td><%= student.getRoom() %></td>
            </tr>
            <tr>
                <th>Warden</th>
                <td><%= student.getWarden() %></td>
            </tr>
            
            
    </table>
  </div>
  
</div>

<br><br><br><br>
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
