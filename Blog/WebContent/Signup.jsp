<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome!!!!!</title>
<link rel="stylesheet" href="bootstrap.min.css">

<style>
	body
	 {
		  background-image: url("images/blogging.png");
		  font-family: 'Titillium Web', sans-serif;
		}
	div.container
	{
		background-image: url("images/yellow.png");
		margin-left:450px;
		margin-right:400px;
		background-color:white;
		font-family: 'Titillium Web', sans-serif;
		border:2px solid white;
		border-collapse:collapse;
	}
	div.innerform
	{
		margin-left:50px;
		margin-right:50px;
		font-family: 'Titillium Web', sans-serif;
		text-color:black;
	}
	
	input
	{
		padding:5px;
		border:1px solid black;
		border-collapse:collapse;
	}
	#submit
	{
		margin-left:100px;
		padding:5px;
		align:center;
		color:green;
		
	}
	#login
	{
		margin-left:50px;
		padding:5px;
		align:center;
		color:green;
	}
	
	label
	{
	padding:5px;
	color:black;
	}
	
	

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>

	<!-- /* function validateForm()
	{

		var num=document.getElementById("con").value;
		var flag=0;
		if(isNaN(num))
			{
				alert("Enter numeric value for contact");
				document.getElementById("numloc").innerHTML="Enter Numeric value only";
				return false;
			}
	} */
 -->
 <script type="text/javascript">
 
 	$(document).ready(
 		function()
 		{
 			$("form").submit(
 					function(event)
 					{
 						var num=$("#con").val();
 						if(isNaN(num))
 							{
 								alert("Enter Numeric value for contact");
 								event.preventDefault();
 							}
 					}
 			);
 		}
 	);
 </script>
</head>

<body>
	<div class="container" > 
		<center><h1 style="color:blue;">Welcome To BlogKatta</h1>
		<h2 style="color:blue;">Signup to create your own blog</h2>
		</center>
		<br>
		<%
					String email=request.getParameter("email");
					String uname=request.getParameter("uname");
					if(uname!=null && uname.equals("1"))
					{
						%>
						<span id="error" style="color:red;">UserName Is Already Taken!!</span>
						<%
					} 
					if(email!=null && email.equals("1"))
					{
			%>
					<span id="error" style="color:red;">Email Already Exists!!!</span>
					<%
					}
			%> 
		<br>
		<form name="signupform" action="Blogcreator" method="post" >
		<br><br>
			<div class="innerform">
			
					<label>User Name:</label><br>
					<input type="text" name="username" placeholder="Username" minlength="5" size="40" required><br><br>
					<label>First Name:</label><br>
					<input type="text" name="firstname" placeholder="First Name"  size="40" required ><br><br>
					<label>Last Name:</label><br>
					<input type="text" name="lastname" placeholder=" Last name "  size="40" required><br><br>
					<label>Email:</label><br>
					<input type="email" name="email" placeholder="Email"  size="40" required><br><br>
					<label>Contact No:</label><br>
					<input type="text" name="contactno"  maxlength="10" minlength="10" id="con" required><span id="numloc"></span><br><br>
					<label>Password:</label><br>
					<input type="password" name="passwd" minlength="4" placeholder="******"  size="40" required><br><br>
					<br>
					<input type="submit" id="submit" value="Signup" size="20"><br>
					<br>
					 <a href="login.jsp">Already a User?Login here.</a><br>
					
			</div>
		<br><br>
		</form>
	</div>
</body>
</html>