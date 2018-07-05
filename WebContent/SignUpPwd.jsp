<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wordy Sign Up/Page1</title>
<link rel="stylesheet" type="text/css" href="input.css">
<link rel="stylesheet" type="text/css" href="button.css">
<link rel="stylesheet" type="text/css" href="avatar.css">
<style>
form {
	border: 3px solid #f1f1f1;
	background-color: #fffff0;
	width: 500px;
	margin: 5% auto auto auto;
	/* 5% from the top, auto from the bottom and centered */
}

.savepwdbtn {
	float: auto;
	width: 100%;
}

/* Add padding to container elements */
.container {
	padding: 16px;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
	.savepwdbtn {
		width: 100%;
	}
}
</style>
</head>

<body background="Images/wordy1.png">

	<form name="myform" action="ProfileDetails.jsp" onsubmit="return confirm_val()" method="get">
		<%String Email= request.getParameter("Email");
			String Name=request.getParameter("Name");
		%>
			<input type="hidden" name="Email" value="<%= Email%>"> 
				<input type="hidden" name="Name" value="<%=Name %>"> 
		<h2 align="center">Welcome <%=Name %></h2>

		<div class="imgcontainer">
			<img src="Images/avatars/avatar21.jpg" alt="Avatar" class="avatar">
		</div>

		<div class="container">
			
			
			<label><b>Enter	Password</b></label> 
			<input id="pwd" type="password" placeholder="Enter password" name="pwd" pattern="(?=.*\d)(?=.*[A-Za-z]).{8,}"
				title="Must contain at least one number and lowercase letter, and at least 8 or more characters"required>

			<label><b>Re-Enter Password</b></label> <input id="repwd"
				type="password" placeholder="Re-Enter password" name="repwd"
				title="Must match the password enterd above" required>
		</div>

		<div class="clearfix">
			<button type="submit" class="savepwdbtn">Save Password And
				Continue To Wordy</button>
		</div>

	</form>

	<script>

var password = myform.getElementById("pwd");
var confirm_pwd = myform.getElementById("repwd");

function confirm_val(){
	if(confirm_pwd.value==password){
		return true;
	}else{
		alert("Passwords do not match...");
		return false;
	}
}
</script>
</body>
</html>