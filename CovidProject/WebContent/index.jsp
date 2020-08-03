<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login-Covid19</title>
  <link href="css/style.css" rel="stylesheet" type="text/css"/>
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
                    <a href="register.jsp">Create New Account</a>
                </form>
</div>
</div>
</body>
</html>