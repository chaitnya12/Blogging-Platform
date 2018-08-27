<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
 %>
<title>Blogs</title>
<style type="text/css">
	body
	{
		background-image:url("images/yellow.png");
	}	
</style>
</head>
<%
String str=(String)request.getParameter("set");
ResultSet st=null;
int flag=0;
if(str.equals("1"))
{
st=(ResultSet)request.getSession().getAttribute("allPostResultSet");

}
else
{
	 st=(ResultSet)request.getSession().getAttribute("userPostResultSet");
	 flag=1;
}
%>
<body>
<div class="main_container">
	 <jsp:include page="header.jsp" />
	<jsp:include page="menu.jsp"></jsp:include> 
	<div class="posts">
		<%while(st.next()) {%>
		<label><b>Author Name</b></label><%=" "+st.getString(2)%>
		<br>
		<label><b>Topic</b></label><%=" "+st.getString(3)%>
		<br>
		<label><b>Post</b></label>
		<br>
		<%=" "+st.getString(4)%>
		</b></i></u>
		<br>
		 <%if(flag==1){%>
		<a href="Delete.jsp?id=<%=st.getInt(1)%>">Delete</a>
		<%} %>
		<br> 
		<%}%>
	</div>
		
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>