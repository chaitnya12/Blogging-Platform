<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Form</title>
	<style type="text/css">
		body
		{
			 background-image: url("images/blogging.png");
			  font-family: 'Titillium Web', sans-serif;
		
		}
	div.outer
	{
	 background-image: url("images/yellow.png");
		text-color:white;
		margin-left:450px;
		margin-right:450px;
		font-family: 'Titillium Web', sans-serif;
		border:2px solid black;
		border-collapse:collapse;
	}
	input
	{
		padding:10px;
	}
	div.innerform
	{
		text-color:white;
		margin-left:30px;
		margin-right:30px;
	}
		
		#submit{
		 font-family: 'Titillium Web', sans-serif;
		margin-left:140px;
		color:blue;
		padding:10px;
		size:40;
		border:2px solid black;
		border-collapse:collapse;
		}
	#error
	{
		color:red;
	}
	
	
	</style>
</head>
<body>
	<br><br><br><br><br><br><br><br>
	<div class="outer">
		<center><h1 style="text-color:white;">Welcome To BlogKatta</h1></center>
		 <%
		 	HttpSession ses=request.getSession();
			String login=(String)ses.getAttribute("loginCredentials");
			System.out.print(login);
			String op=null;
			if(login!=null &&login.equals("false"))
			 	op="UserName or Password is Wrong";
		%>
			<form action="Authentication" method="post" target="_self" >
				<div class="innerform">
					<%if(login!=null && !login.equals("true"))
					{ %>
					<span style="color:red"><%=op%></span>
					<%} %>
					<br>
					User Name:<br>
					<input type="text" name="username" placeholder="User Name" required minlength="5"><br>
					<br>
					Password:<br>
					<input type="Password" name="password" placeholder="*****" required minlength="4"><br>
					<br>
					<br><br>
					<input type="submit" value="Login" id="submit">
				</div>
			</form>
			 
	 </div>
</body>
</html>