<%@ page import="java.io.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Module</title>
</head>
<body>

<%
String contentType = request.getContentType();
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;

while (totalBytesRead < formDataLength) {
byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
String saveFile = file.substring(file.indexOf("filename=\"") + 10);
System.out.println("saveFile=" + saveFile);
saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
System.out.println("saveFile:" + saveFile);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;

pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
System.out.println("boundaryLocation:"+boundaryLocation+":end");
int startPos = ((file.substring(0, pos)).getBytes()).length;
System.out.println("startPos:"+startPos+":end");
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
System.out.println("endPos:"+endPos+":end");
System.out.println("saveFile:"+saveFile+":end");
FileOutputStream fileOut = new FileOutputStream(saveFile);
fileOut.write(dataBytes, startPos, (endPos - startPos));
char ch=(char)in.read();
fileOut.write(ch);
%>

<section class="formcont" id="formcont">

<form enctype="multipart/form-data" action="upload_page.jsp" method=POST>
		
		
		<h1>WELCOME ADMIN</h1>
			<table>
				<tr>
						<td colspan="1">
							<p align="center">
								<B>UPLOAD THE FILE</B>
						
						</td>
				</tr>
				<tr>
					<td><b>Choose the file To Upload:</b></td>
					<td><INPUT NAME="file" TYPE="file"></td>
				</tr>
				<tr>
					<td colspan="6">
						<p align="right">
							<INPUT TYPE="submit" VALUE="UPLOAD">
						</p>
					</td>
				</tr>
				<tr>
	<td>			<b>File <%
	out.println(saveFile);
%> has been uploaded and inserted
	into Database.
</b></td>
				</tr>
				</table>
			
					</form>

</section>


<% Connection con = null;
Statement pst = null;
String line = null;
String value = null;
try {
	StringBuilder contents = new StringBuilder();
	
	BufferedReader input = new BufferedReader(new FileReader(saveFile));
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcovid?user=root&password=1234");
	PreparedStatement statement = connection.prepareStatement("INSERT INTO COVID_REPORT VALUES(?,?,?,?,?,?)");
	PreparedStatement st_check = connection.prepareStatement("SELECT ID FROM COVID_REPORT WHERE NAME=?");
	PreparedStatement st_update = connection.prepareStatement("UPDATE COVID_REPORT SET ID=?,ACTIVE=?,CURED=?,DEATH=?,TOTAL=? WHERE NAME=?");
	String lineText = null;

	input.readLine(); // skip header line
	while ((line = input.readLine()) != null) {
		
		String[] data = line.split(",");
		int id = Integer.parseInt(data[0]);
		String name = data[1];
		int active = Integer.parseInt(data[2]);
		int cured = Integer.parseInt(data[3]);
		int death = Integer.parseInt(data[4]);
		int total = Integer.parseInt(data[5]);
		Boolean exists = false;
	
		st_check.setString(1, name);
		ResultSet rs = st_check.executeQuery();
        System.out.println("RS : "+rs);
        if(rs.next()) {
       	 exists = true;
        }
	if(!exists){
		statement.setInt(1, id);
		statement.setString(2, name);
		statement.setInt(3, active);
		statement.setInt(4, cured);
		statement.setInt(5, death);
		statement.setInt(6, total);
		
		statement.executeUpdate();
	} else {
		System.out.println(name+" : State exists ");
		st_update.setInt(1, id);
		st_update.setInt(2, active);
		st_update.setInt(3, cured);
		st_update.setInt(4, death);
		st_update.setInt(5, total);
		st_update.setString(6, name);
		
		st_update.executeUpdate();
	}
	}
	st_check.close();
	st_update.close();
	statement.close();
	fileOut.close();
	input.close();
} catch (Exception e) {
	e.getMessage();
	e.printStackTrace();
	
}
}
%>
</body>
</html>