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
<title>Profile_Card</title>

<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="modal.css">
<link rel="stylesheet" type="text/css" href="profilecard.css">
</head>

<body background="Images/wordy1.png">
<a href="chatlist.jsp">HOME</a>
	<%
		String rph = session.getAttribute("rphno").toString();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wordy", "root", "admin");
		PreparedStatement ps = con.prepareStatement("select * from userprofile where phno=?;");
		ps.setString(1, rph);
		ResultSet rs = ps.executeQuery();
		rs.next();
		String name = rs.getString(1);
		String uid = rs.getString(4);
		String country = rs.getString(5);
		String phno = rs.getString(6);
		String profession = rs.getString(7);
		String status = rs.getString(8);
		String about = rs.getString(9);
		String fb = rs.getString(10);
		String insta = rs.getString(11);
		String twitter = rs.getString(12);
		String email = rs.getString(2);
	%>
	
	<div class="card">
	<header>
  		<img class="imgcontainer" src="Images/avatars/avatar21.jpg" alt="John" style="width:40%;border-radius: 50%;">
	</header>
	
	<aside >
 	 	<h1><%=name%>(<%=uid %>)</h1>
  		
		<p class="title"><%=profession %></p>
  		<p class="title"><i class="fa fa-map-marker" aria-hidden="true"></i><%=country %></p>
		
		<div>Status<p color="solid grey"><%=status %></p></div>
  		
		<span onclick="document.getElementById('emailid').style.display='block'" style="width: auto;">
		<a href="#"><i class="fa fa-google"></i></a>
		</span>
  		<a href="<%=twitter %>" ><i class="fa fa-twitter"></i></a> 
  		<a href="<%=insta%>"><i class="fa fa-instagram"></i></a> 
  		<a href="<%=fb%>"><i class="fa fa-facebook"></i></a> 
	</aside>

	<article>
  		<h2> ABOUT ME</h2>
  		
		<p class="title">
		<%= about %>

		</p>
	</article>

 	<footer style="max-height:12px;">
 	<b>Contact : <%=phno %></b>
 	</footer>
</div>
</body>
<!-- ___________________________________________________________________________________________________ -->

<div id="emailid" class="modal">
	<form class="modal-content animate">
		<div class="container">
			<label><b>Registered E-mail Id:</b></label> <label><b><%=email%></b></label>
		</div>
	</form>
</div>


<script>
	// Get the modal
	var modal = document.getElementById('emailid');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}

</script>

<!-- ___________________________________________________________________________________________________ -->
</html>