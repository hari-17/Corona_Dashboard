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
 <link href="css/bootstrap.css" rel=stylesheet type="text/css"/>
 <link href="css/leftnav.css" rel="stylesheet" type="text/css"/>
 <link href="css/style_dash.css" rel="stylesheet" type="text/css"/>
 <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
</head>
<body class="body">

<section class="main-c">
	<div class="nav-c">
		<c:import url="leftnav.jsp"/>
	</div>
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
<div class="body_home content-c">

	<h2 class="display-4" align="center">
	<font>
	<strong  style = "font-size:50px;">Welcome to the<span  style = "color:  #ff1a1a;" > COVID-19 </span> Dashboard   </strong> </font>  
	<a style="float:right" href="index.jsp" class="btn btn-dark" role="button">LOGOUT</a> </h2>     
	
	<!-- Search form -->
	   <br>
	   <div class="row">
	   <form action="dashboard.jsp" method="POST">
	    <div class="container">
	       <div class="form-group">
	            <div class="tb-c col-sm-5">
	              <div class="input-group">
	                  <input type="text" name="search" class="form-control" placeholder="Search you state">
	                  <div class="input-group-btn">
	                        <button type="submit" value="Search" class="btn btn-primary"><span class="glyphicon glyphicon-search">Search</span></button>
	                  </div>
	               </div>
	            </div>
	       </div>
	     </div>
	     </form>
	     </div>
	 <div class="table" style="position:relative;">
	   <div id="chartCont" style="width: 200px;height:200px;position:absolute;display:none;"><canvas id="myChart" width="400" height="400"></canvas></div>
		 <div class="row row1">	 
		 	<div class="col col1"><span style="color: #3366ff;">Name</span></div>
		 	<div class="col col1"><span style="color: #ff8833;">Active</span></div>
		 	<div class="col col2"><span style="color: #33ff33;">Cured</span></div>
		 	<div class="col col3"><span style="color: #ff0066;">Death</span></div>
		 	<div class="col col4"><span>Total</span></div>
		 </div>
		 
		<%
	try{ 
	connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	statement=connection.createStatement();
	String sql ="SELECT * FROM covid_report where name like'"+request.getParameter("search")+"%'";
	
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
	%>
	<div class="row">
	
	
	<div class="col col1 state" data-active="<%=resultSet.getString("active") %>" data-cured="<%=resultSet.getString("cured") %>" data-death="<%=resultSet.getString("death") %>"><%=resultSet.getString("name") %></div>
	<div class="col col2"><%=resultSet.getString("active") %></div>
	<div class="col col3"><%=resultSet.getString("cured") %></div>
	<div class="col col4"><%=resultSet.getString("death") %></div>
	<div class="col col5"><%=resultSet.getString("total") %></div>
	
	
	</div>
	
	<% 
	} 
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%> 
	</div> 
 </div>
 <script>
 
 $('.state').on("click",function(){
	 $("#chartCont").show();
	 $('.state').removeClass('selected');
	 var st = $(this);
	 st.addClass('selected');
	 var xy = st.position();
	 var tActual = xy.top;
	 var lActual = xy.left;
	 var tPos = tActual - 75;
	 var lPos = lActual - 208;
	 var a = st.data('active');
	 var c = st.data('cured');
	 var d = st.data('death');
	 var state = st.text();
	 var ctx = document.getElementById('myChart').getContext('2d');
	 var myChart = new Chart(ctx, {
	     type: 'doughnut',
	     data: {
	         labels: ['Active','Cured','Death'],
	         datasets: [{
	             label: state,
	             data: [a, c, d],
	             backgroundColor: [
	                 'rgba(255, 200, 12, 0.2)',
	                 'rgba(26, 255, 26, 0.2)',
	                 'rgba(255, 26, 117, 0.2)'
	             ],
	             borderColor: [
	                 'rgba(255, 200, 12, 1)',
	                 'rgba(26, 255, 26, 1)',
	                 'rgba(255, 26, 117, 1)'
	             ],
	             borderWidth: 1
	         }]
	     }
	 });
	 $("#myChart").css("top",tPos+'px');
	 $("#myChart").css("left",lPos+'px');
 });

</script>
 </section>
</body>