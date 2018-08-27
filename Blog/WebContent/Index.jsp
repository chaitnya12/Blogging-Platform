<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
 %>
<title>BlogKatta</title>
<!-- <link rel="stylesheet" href="style.css"> -->
<link rel="stylesheet" href="bootstrap.min.css">
<script type = "text/javascript" >

   function preventBack(){window.history.forward();}

    setTimeout("preventBack()", 0);

    window.onunload=function(){null};

</script>
<style type="text/css">
	body
	{
		background-image:url("images/yellow.png");
	}	
</style>
</head>
<body>

<div class="main_container">
	 <jsp:include page="header.jsp" />
	<jsp:include page="menu.jsp"></jsp:include> 
	<div class="page_container">
	<%
	String err=request.getParameter("err");
	String created=request.getParameter("created");
	Cookie[] cook = request.getCookies();
	String cunm = "";
	String cpass = "";
	if(cook != null){

		for(Cookie c : cook){
			
			if(c.getName().equals("username")){
				cunm = c.getValue();
			}
			if(c.getName().equals("password")){
				cpass = c.getValue();
			}
		}
	}
		 	
	%>
		<form action="Authentication" method="post" onsubmit="return validate()">
			<div class="imgcontainer">
	    		<img src="images/2.png" alt="Avatar" class="img-circle" width="150" height="150">
	  		</div>
			<div class="container">
			<%
			if(err!=null && err.equals("1")){
				%>
				<span class="error"> Username or Password is Wrong</span><br>
				<%
			}
			if(created!=null && created.equals("1")){
				%>
				<span class="sucss"> User logged in successfully</span><br>
				<%
			}
			
			%>
				<label>User Name</label>
				<input type="text" name="username" placeholder="User Name" value="<%=cunm%>" id="unm">
				<div class="valid" style="display: none" id="err">
					<span class="error" id="usernameError"></span>
				</div>
				<br>
				<label>Password</label>
				<input type="password" name="password" placeholder="******" value="<%=cpass %>" id="pwd">
				<div class="valid" style="display: none" id="pwderr">
					<span class="error" id="passwordError"> </span>
				</div>
				<br>
				
				<input type="submit" name="submit" value="Login"><br>
				
				<input type="checkbox" name="save" value="saveCookie"> Remember Me
				
			</div>
			<div class="container1" style="background-color:#f1f1f1">
				<span class="psw">Do not have account ? please <a href="Signup.jsp">SignUp</a></span>
    		</div>
			
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</div>

</body>
</html>