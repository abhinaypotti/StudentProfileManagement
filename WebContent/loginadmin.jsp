<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=STIX+Two+Text:wght@500&display=swap" rel="stylesheet">
    <style>
        body{
   background-color:#edc7b7;
    margin: 0;
    }
th,td{
    padding-right: 20px;
    padding-top: 20px;
}


.login-box{

    background-color: white;
    text-align: center;
    
    margin: 0% 15% 1% 15%;
    
}

.login-image{
    object-fit: cover;
    width: 100%;
    height: 600px;
    display: inline;
    border-radius: 20px 0 0 20px;
}

.split-left {
    display: inline;
    float:left;
    max-height: 90%;
    width: 50%;
    height: 600px;
    
}

.split-right {
    float: right;
    width: 50%;
    max-height: 90%;
    height: 600px;
    background-color: white;
    border-radius: 0 20px 20px 0;
}

.login-details{
    padding-top: 10%;
    justify-content: center;
    align-items: center;
    display: flex;
    border-spacing: 10px;
}

.title{
    margin-top: 120px;
    font-family: 'STIX Two Text', serif;
}

.button {
   display:inline-block;
   
    background-color: #9a1750; 
  color: white; 
   font-size:17px;
   border:none;
   border-radius:5px;
   cursor:pointer;
}

.button:hover {
  background-color: #00284d;
  color: white;
}
    </style>

</head>

<%

	String error = (String)request.getAttribute("error");
%>

<body>

    <div class="login-box">
        <div class="split-left">
            <img class="login-image" src="blackart.jpg" alt="">
        </div>
        <div class="split-right">
            <h1 class="title">ADMIN LOGIN</h1>
            <center>
            <form action="AdminControllerServlet" method="GET">
            <table class="login-details">
                <tr>
                    <th>USER NAME </th>
                    <th><input required type="text" id="username" name="username"><br></th>
                </tr>
                <tr>
                    <th>PASSWORD </th>
                    <th><input required type="password" id="password" name="password"><br></th>
                </tr>
                <input type="hidden" name="command" value="adminlogin">

            </table>
             
            <button class="button" type="submit" style="margin-top: 40px; font-size: 16px; padding: 14px 40px;" >LOGIN</button>
            </form>
            <% if(error != null ){%>
            	<p style="color:red;"><%= error%></p>
            <% }%>
            <form action="index.jsp" >
            <button class="button" style="margin-top: 30px; font-size: 16px; padding: 12px 20px;" >GO BACK</button>
            </form>
            </center>
        </div>
    </div>
</body>
</html>