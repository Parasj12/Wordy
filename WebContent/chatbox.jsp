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
<style>

div.sender{
width:80%;
background-color:rgba(102,102,255,0.8);
padding-left:10px;
border-radius: 6px;
}

div.receiver{
border-radius: 6px;
background-color:rgba(12,255,0,0.8);
padding-left:40%;
}

</style>
<title>Chatbox</title>
</head>

  <%	response.setIntHeader("Refresh", 10);
    	String phno = (String) session.getAttribute("Phone");
    	String name = (String) session.getAttribute("Name");
    	String sname = (String) session.getAttribute("rname");
    	String oph = (String) session.getAttribute("rphno");
        %>

<div>
<h4>Welcome <%=name %></h4>
<a href="chatlist.jsp">HOME</a>
<a href="Profile_Card.jsp">View your Profile</a>
<a href="Settings.html" target="_top">settings</a>
</div>
<body background="Images/wordy1.png">
  
        <table border=2 height=100% width=100%>
        <thead height=5%>
        <div class="receiver"><h1><%=sname %></h1><a href="ProfileCardothers.jsp">View Profile Card</a></div>
        </thead>
        <tbody>
        <tr height=80%>
        <td heigh=100% overflow="scroll"><%
        	System.out.println("refreshed" + phno + name + sname + oph);
        	try {
        		Class.forName("com.mysql.jdbc.Driver");
        		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordy", "root", "admin");
        		PreparedStatement ps = con.prepareStatement(
        				"select * from chats where (sender_phno=? AND receivers_phno=?) OR (sender_phno=? AND receivers_phno=?);");
        		ps.setString(1, oph);
        		ps.setString(2, phno);
        		ps.setString(4, oph);
        		ps.setString(3, phno);

        		ResultSet rs = ps.executeQuery();
        		if (rs.next()) {

        			do {
        				String sendname = rs.getString(1).toString();
        				String msg = rs.getString(5).toString();
        				if (sendname.contentEquals(sname)) {
        %>
				<div class="sender">
						<p><%=msg%></p>
					</div> 
<%
 	} else {
 %>
				<div  class="receiver">
						<p dir="rtl" ><%=msg%></p>
					</div> 
<% 	}
 			} while (rs.next());
 		}
 	} catch (Exception e) {
 		System.out.print("Error!!!!Retry oR login");
 	}
 %></td>
</tr>
</tbody>
<table>
<tfoot height=15%>
<form id="send" action="sendmessage">
<table>
<td width=95%>
<textarea name="message" form="send" >....</textarea></td>
<td><button type="submit">send</button>
</table>
</form> 
</tfoot>
</table>
</body>
</html>