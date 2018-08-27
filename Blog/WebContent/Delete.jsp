<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Post</title>
</head>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	System.out.println("id= "+id);
	request.getSession().setAttribute("delId",id);
	request.getRequestDispatcher("Delete").forward(request,response);
%>
</html>