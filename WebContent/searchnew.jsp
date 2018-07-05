<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="Images/wordy1.png">
<a href="chatlist.jsp">HOME</a><br>
	<%
try{
Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordy", "root", "admin");
				PreparedStatement ps = con.prepareStatement("Select name,email,phno from userprofile;");
				ResultSet rs1 = ps.executeQuery();
				%>
	<font size=4>
	<table border=3  colspan=10px rowspan=10px bgcolor="white">
		<th>Name</th>
		<th>Email</th>
		<th>phno</th>

		<%
					while (rs1.next()) {
								String cname = rs1.getString(1);
								String cemail = rs1.getString(2);
								String cph = rs1.getString(3);
								
		%>
		<form action="addreceiverssess">
		<input type="hidden" name="sphno" value=<%=cph%>> <input
				type="hidden" name="sname" value=<%=cname%>>
			<tr>
				<td><%=cname%></td>
				<td><%=cemail%></td>
				<td><%=cph%></td>
				<td><button type="submit" >Chat</button>
			</tr>	
			</font>			
		</form>
		<%
				}
				} catch (Exception e) {
			%>
		NO CHATS AVAILABLE
		<br>START NEW CHATS
		<%
				}
			%>
	</table>
</body>
</html>