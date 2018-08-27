<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Create Blog</title>
			<style>
				body
				{
					background-image: url("images/yellow.png");
					font-size=20px;
					color=black;
				}
				#bold{font-weight:bold;}
				#italic{font-weight:italic;}
				#underline{font-weight:underline;}				
			</style>
			<script src="jquery.min.js"></script>
			<script type="text/javascript">
					var counterB=0;
					var counterI=0;
					var counterU=0; 
					$(document).ready(
							function()
							{
								$("#bold").click(function()
								{
									var str=$("#blog").val();
									if(counterB==0)
									{ 
									str=str.concat("<b>");
									counterB=1;
								 	}
									else
									{
									str=str.concat("</b>");
									counterB=0;
									} 
									$("#blog").val(str);
									
								}
								);
								$("#italic").click(function()
										{
											var str=$("#blog").val();
											if(counterI==0)
											{ 
											str=str.concat("<i>");
											counterI=1;
										 	}
											else
											{
											str=str.concat("</i>");
											counterI=0;
											} 
											$("#blog").val(str);
											
										}
										);
								$("#underline").click(function()
										{
											var str=$("#blog").val();
											if(counterU==0)
											{ 
											str=str.concat("<u>");
											counterU=1;
										 	}
											else
											{
											str=str.concat("</u>");
											counterU=0;
											} 
											$("#blog").val(str);
											
										}
										);
								
							}		
					);
					function checkImg(target)
					{
						if(target.files[0].type.indexOf("image") == -1) {
					        alert("File not supported");
					        return false;
					    }
					    if(target.files[0].size > 102400) {
					    	
					        alert("Image too big (max 100kb)");
					        return false;
					    }
					    return true;
					}
			
			
			</script>
			
		</head>
		<%
		String file="";
		String author=(String)request.getSession().getAttribute("author");
		System.out.println("in blogCreation");
		if(author!=null)
			System.out.println("<"+author+">");
		if(author==null || author=="")
		{
			System.out.println("sending to login.jsp");
			response.sendRedirect("Index.jsp");
		}
		if(request.getSession().getAttribute("filaPath")!=null)
		{
			file+=(String)request.getSession().getAttribute("filePath");
		}
		%>
		<body>
		<div class="main_container">
	 <jsp:include page="header.jsp" />
	<jsp:include page="menu.jsp"></jsp:include> 
			<form action="Post" target="_self" method="post" enctype="multipart/form-data" onsubmit="return checkImg()">
			<br><br>
				<div class="inner">
					<b>Topic:</b><br>
					<input type="text" name="topic" placeholder="Enter topic of post " required><br><br>
					<b>Post:</b><br>
					<textarea rows="15" cols="100"id="blog" name="blog" placeholder="You can write your post here" required></textarea>
					</br>
					<input type="button" id="bold" value="B" onclick="functionB()" >
					<input type="button" id="italic" value="I" onclick="functionI()" >
					<input type="button" id="underline" value="U" onclick="functionU()">
					<br>
					<br>
					<input type="file" name="image" accept="image/*" onchange="checkImg(this)">
					</br>
					</br>
					<input type="submit"  name="action" Value="Submit" >
				</div>
			<br><br>
			</form>
			<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
		
</html>