<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Update password</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
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



</style>
</head>
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

<form class="signup-form" action="StudentControllerServlet" onsubmit="return checkForm(this);" method="GET">

      <!-- form header -->
      <div class="form-header">
        <h1>Update Password</h1>
      </div>

      <!-- form body -->
    <div class="form-body">
        <!-- fullname -->
        <div class="horizontal-group">
          
          
          
               
				<!-- Your new password -->
				<div class="form-group right">
					<label for="password" class="label-title">Your new password</label>
					<input type="password" name="password" id="password"   class="form-input" placeholder="Enter your new password"
                    pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>
				<span>* Must contain at least one number one uppercase and lowercase letter, and at least 8 or more characters<span>
                </div>
				
				<!-- Confirm password -->
				<div class="form-group right">
					<label for="confirm_password" class="label-title">Confirm password</label>
					<input type="password" name="confirm_password" id="confirm_password"  class="form-input" placeholder="Enter your confirm password"
                    pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required
                    onChange="isPasswordMatch();"/>
                    
				
                </div>
                <div class="form-group right">
                 <span id="confirm_password_msg"></span>
				</div>
				
        </div>
    </div>
        <input type="hidden" name="command" value="UPDATEPW">
      <!-- form-footer -->
      <div class="form-footer">
        <button type="submit"  value="Save Password" id="submitForm" onclick="myFunction()"  class="btn">Update</button>
      </div>
    </form>

<script>
   $(document).ready(function(){
          
          $("#confirm_password").bind('keyup change', function(){

            check_Password( $("#password").val(), $("#confirm_password").val() )
            
            
          })

          $("#submitForm").click(function(){

            check_Password( $("#password").val(), $("#confirm_password").val() )

          })
        })

        function check_Password( Pass, Con_Pass){

          if(Pass === ""){

          }else if( Pass === Con_Pass){

            $("#submitForm").removeAttr("onclick")
            $('#confirm_password_msg').show()
            $("#confirm_password_msg").html('<div style="color:green">Password matched successfully!</div>')

          }else{
            $("#confirm_password").focus()
            $('#confirm_password_msg').show()
            $("#confirm_password_msg").html('<div style="color:red">Oops! Password did not match!</div>')

          }
        }

        
</script>



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