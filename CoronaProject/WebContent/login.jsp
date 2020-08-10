<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login-Covid19</title>
  <link href="css/style.css" rel="stylesheet" type="text/css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js" ></script>
</head>
<body>

	<div class="container">
            <div class="box">
                
                <h1>Login Account</h1>
<form action="LoginServlet" method="post">
                    <p>Email</p>
<input type="text" placeholder="Email" name="email" required>
                    <p>Password</p>
<input type="password" placeholder="Password" name="password" required>
                    <input type="submit" value="Login" >
                    <a href="#">Forget Password?</a><br>
                    <a href="index.jsp">Create New Account</a>
                </form>
</div>
</div>
<c:if test = "${loginFailed eq 'true'}">
<script>
       $(document).ready(function(){
	 swal ( "Failed!" ,  "Incorrent Login-Credentials" ,  "error" );
 });  
       </script>
      </c:if>
</body>
</html>