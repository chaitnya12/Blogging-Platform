<link rel="stylesheet" type="text/css" href="style.css">
<div class="header">
	<div class="logo">
		<h1>Welcome To BlogKatta</h1>
	</div>
	<div class="user_details">
		<span>
			<%
				
				String userName = (String)session.getAttribute("author");
				if(userName != null){
			%>
				<p>Welcome <%=userName %></p>
			
		</span>
		<span>
			 <a href="LogOut">Logout</a>
		</span>
		<% } %>
		
	</div>
	
</div>
