<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register-Covid19</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="regbox box">
               
                <h1>Register Account</h1>
<form action="RegisterServlet" method="post">
                   <p>Username</p>
<input type="text" placeholder="Username" name="name" required>
                   <p>E-mail</p>
<input type="text" placeholder="Useremail" name="email" required>
                   <p>Password</p>
<input type="password" placeholder="Password" name="password" required>
                   <input type="submit" value="Register">
                   <a href="index.jsp">Already have Account?</a>
                </form>
</div>
</div>
</body>
</html>
