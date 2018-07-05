<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
div.heading{
border-radius: 6px;
background-color:rgba(12,255,0,0.8);
padding-left:40%;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HOME PAGE WORDY</title>
</head>
<%
	String name = (String) session.getAttribute("Name");
	System.out.println("Welcome to chatlist\t " + name);
%>
<body background="Images/wordy1.png">
<div>
<div class="heading"><h1>Welcome <%=name %></h1></div>
<a href="Settings.html" target="_top">settings</a>
<br>
<a href="Profile_Card.jsp">View your Profile</a>
<br>
<form action="logout" target="_top">
<button type="submit">Logout</button>
</form>
</div>
<hr>
<a href="searchnew.jsp">Search New People</a>
<hr>
<div>
		<%
			//response.setIntHeader("Refresh", 1);
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordy", "root", "admin");
				PreparedStatement ps = con.prepareStatement(
						"Select sender_phno from chats where receivers_name=? UNION select receivers_phno from chats where sender_name=?");
				ps.setString(1, name);
				ps.setString(2, name);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
		%>
		<font size=4>
		<table bgcolor="white" border="2" colspan=10px rowspan=10px>
			<th>Name</th>
			<th>Email</th>
			<th>phno</th>
			<%
				}
					do {
						String ph = rs.getString(1);
						PreparedStatement ps1 = con
								.prepareStatement("Select Name,Email,phno from userprofile where phno=?;");
						ps1.setString(1, ph);
						ResultSet rs1 = ps1.executeQuery();
						while (rs1.next()) {
							String cname = rs1.getString(1);
							String cemail = rs1.getString(2);
							String cph = rs1.getString(3);
							System.out.println(cname +"\t"+ cemail+"\t" + cph);
			%>

			<form action="addreceiverssess">
				<input type="hidden" name="sphno" value=<%=cph%>> <input
					type="hidden" name="sname" value=<%=cname%>>
				<tr>
					<td><%=cname%></td>
					<td><%=cemail%></td>
					<td><%=cph%></td>
					<td><button type="submit">Chat</button></td>
				</tr>
					</font>
			</form>

			<%
				}
					}while (rs.next());

				} catch (Exception e) {e.printStackTrace();
			%>

			<!--  --	NO CHATS AVAILABLE<br>START NEW CHATS -->

			<%
				}
			%>
		</table>
	</div>

</body>
</html>