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

#customers {
    font-family: Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 60%;
    background-color: #eee2dc;
    
  }
  
  #customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
  }
  
  #customers tr:nth-child(even){background-color: #eee2dc;}
  
  #customers tr:hover {background-color: #b3b3b3;}
  
  #customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: grey;
    color: white;
  }

  table{
      margin-top:2%;
      margin-left: 20%;
      
  }
</style>
</head>

<%
	List<JobProfile> list = (List<JobProfile>) request.getAttribute("JOBS");
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
<h1 align="center">Job Profiles</h1>
<div>
    
    <table id="customers">
    	
        <tr>
          <th>Job Id</th>
          <th>Company</th>
          <th>CTC Offered</th>
          <th>Min CGPA</th>
          <th>Apply Link</th>
        </tr>
        
        <% for(JobProfile job : list){ %>
        <tr>
          <td><%= job.getJobid() %></td>
          <td><%= job.getCompany() %></td>
          <td><%= job.getCtc() %></td>
          <td><%= job.getCgpa() %></td>
          <td><a href="<%= job.getLink() %>" target="_blank">Apply Now</a></td>
        </tr>
        <%} %>
        
      </table>
</div>


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