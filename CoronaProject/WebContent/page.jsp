<!DOCTYPE html>
<html>
<head>
<title>Admin Module</title>

<link rel="stylesheet" href="css/reset.css" />
<style>
header {
background: #eee;
    text-align: center;
    padding: 0.5em;
    font-size: 2em;
    font-weight: bold;    
}
.formcont {
padding: 0 3em;
min-height: 600px;
}
h2 {
margin: 1em;
    font-size: 1.5em;
    font-style: italic;
}
.elements {
	padding: 0 3em;
}
.elements h3 {
margin-bottom: 1em;
} 
.formcont .childC {
border: 1px solid #000;
    border-radius: 5px;
    width: 600px;
    text-align: center;
    margin: 0 auto;
    padding: 0.5em;

}
</style>
</head>

<body>
<header>
<h1>COVID-19 Dashboard</h1>
</header>

<h2>WELCOME ADMIN,</h2>
<section class="formcont" id="formcont">

<div class="childC">
<form enctype="multipart/form-data" action="upload_page.jsp" method=POST>	
		<div class="elements">
			
			<h3>UPLOAD THE FILE</h3>		
			<p class="message">Choose the file To Upload: <input name="file" type="file" />	</p>
						
						<p>
							<input type="submit" value="UPLOAD" />
						</p>						
						</div>
						
</form>
</div>

</section>
<footer>
Dashboard prepared by Hari
</footer>
	
</body>
</html>