<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Wordy SignUp/Page2</title>

<link rel="stylesheet" type="text/css" href="input.css">
<link rel="stylesheet" type="text/css" href="button.css">
<link rel="stylesheet" type="text/css" href="avatar.css">

<style>

form {
	border: 3px solid #f1f1f1;
	background-color: #fffff0;
	width: 60%;
	margin: 0% auto auto auto;
	/* 5% from the top, 15% from the bottom and centered */
}

.uploadbtn {
	width: 20%;
}

.savedetbtn {
	float: auto;
	width: 100%;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

</style>

</head>

<body background="Images/wordy1.png">

	<form action="NewUserProfile" method="get">
		<%
			String Email = request.getParameter("Email");
			String Name = request.getParameter("Name");
			String pwd = request.getParameter("pwd");
		%>
		<input type="hidden" name="Email" value="<%= Email%>"> 
		<input type="hidden" name="Name" value="<%=Name %>"> 
		<input type="hidden" name="password" value="<%=pwd%>">

		<h2 align="center">Enter your Profile Details</h2>
		
		<div class="container">
			
 
			<div class="imgcontainer">
				<img id="pic" src="Images/avatars/avatar21.jpg" alt="Avatar" class="avatar">
			</div>
			
			<!--
			<div>
				<span><label><b>Choose A profile pic</b></label></span> <input
					type="file" name="dp" accept="image/gif,image/jpeg,image/png">
			</div>
			-->
			<label><b>Enter User Id*</b></label> 
				<input type="text" placeholder="Enter User Id" name="uid" required>
				
			<label><b>Enter	Your Country</b></label> 
				<input type="text" placeholder="***Country***" name="country"> 
				
			<label><b>Enter Phone Number*</b></label> 
				<input type="text" placeholder="Enter Phone Number" name="phno" required>

			<label><b>Enter About Profession</b></label> 
				<input type="text" placeholder="**Profession**" name="profession"> 
				
			<label><b>Enter	a Status</b></label> 
				<input type="text" placeholder="***Enter a status***" name="status"> 
					
			<label><b>Enter About Yourself</b></label> 
				<input type="text" placeholder="**About You***" name="about"> 
				
			<label><b>Enter Facebook Profile URL</b></label> 
				<input type="text"	placeholder="***Facebook***" name="fb">
				 
			<label><b>Enter Twitter Handle URL </b></label> 
				 <input type="text" placeholder="***twitter***" name="twitter">
				 	
			<label><b>Enter Instagram Id</b></label>
					<input type="text" placeholder="***Instagram***" name="insta">

				<div dir="rtl">fields marked (*) are mandetory</div>
		</div>

		<div class="clearfix">
			<button type="submit" class="savedetbtn">Save Details</button>
		</div>
	</form>
</body>
</html>