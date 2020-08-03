<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%-- You need to declare this at the top of your jsp page--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Covid-19 Dashboard</title>
 <link href="css/style_dash.css" rel="stylesheet" type="text/css"/>
 <link href="css/leftnav.css" rel="stylesheet" type="text/css"/>
 <link href="css/bootstrap.css" rel=stylesheet type="text/css"/>
 <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab&display=swap" rel="stylesheet">
  
</head>
<body class="body">
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<c:import url="leftnav.jsp"/>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "dbcovid";
String userId = "root";
String password = "1234";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<div class="body_home">
<h2 class="display-4" align="center"><font><strong  style = "font-size:50px;">Welcome to the<span  style = "color:  #ff1a1a;" > COVID-19 </span> Dashboard </font>   </strong>  <a style="float:right" href="index.jsp" class="btn btn-dark" role="button">LOGOUT</a> </h2>     

<!-- Search form -->
   <br>
   <form action="dashboard.jsp" method="POST">
    <div class="container">
       <div class="form-group">
            <div class="col-sm-5">
              <div class="input-group">
                  <input type="text" name="search" class="form-control" placeholder="Search you state">
                  <div class="input-group-btn">
                        <button type="submit" value="Search" class="btn btn-primary"><span class="glyphicon glyphicon-search">Search</span></button>
                  </div>
               </div>
            </div>
       </div>
     </div>
 
<table  style=font-family: "'Roboto Slab', serif"; align="left" >
<tr>

</tr>
<tr >

<td style="width:15%; color:  #3366ff;"><b>Name</b></td>
<td style="width:15%;  color: #33ff33;"><b>Cured</b></td>
<td style="width:15%;  color:  #ff0066;"><b>Death</b></td>
<td style="width:15%;"><b>Total</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM covid_report where name like'"+request.getParameter("search")+"%'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr class="reports">


<td class="hname"><%=resultSet.getString("name") %></td>
<td class="hcured"><%=resultSet.getString("cured") %></td>
<td class="hdeath"><%=resultSet.getString("death") %></td>
<td class="htotal"><%=resultSet.getString("total") %></td>


</tr>

<% 
} 

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</form>

</div>
</body>