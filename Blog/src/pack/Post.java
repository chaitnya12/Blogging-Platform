package pack;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig
@WebServlet("/Post")
public class Post extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
    public Post() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init()
    {
    	ServletContext sc=getServletContext();
    	if(sc.getAttribute("connection")!=null)
    	{
    		con=(Connection) sc.getAttribute("connection");
    	}
    	else
    	{
    		Pojo p=new Pojo();
    		String url=p.getUrl();
    		String driver=p.getDriver();
    		String userName=p.getUserName();
    		String password=p.getPassword();
    	    con=null;
    		try {
    			Class.forName(driver);
    			con=DriverManager.getConnection(url,userName,password);
    		}
    		catch(ClassNotFoundException e)
    		{
    			e.printStackTrace();
    		}
    		catch(SQLException e)
    		{
    			e.printStackTrace();
    		}
    	}
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str=request.getParameter("blog");
		
			System.out.println("in if part");
			final Part filePart = request.getPart("image");
		    final String fileName = getFileName(filePart);
		    final String path="D:\\xampp\\tomcat\\webapps\\ROOT";
		    String dummyPath="http://localhost:8080//";
		    OutputStream out = null;
		    InputStream filecontent = null;

		    try {
		    	String url=path+File.separator+fileName;
		    	File fl=new File(url);
		        out = new FileOutputStream(fl);
		        filecontent = filePart.getInputStream();
		        int read = 0;
		        final byte[] bytes = new byte[1024];
		        while ((read = filecontent.read(bytes)) != -1)
					out.write(bytes, 0, read);
		        String imgpath=dummyPath+fileName;
		        System.out.println("image path is "+imgpath);
		        String src="<br><img src=";
		        src+=imgpath+" ";
		        src+=" alt='Image Not Visible' height=200 width=200 >";
		        str+=src;
		        System.out.println(str);
		    } 
		    catch (FileNotFoundException fne) {
		    		fne.printStackTrace();
		    } finally {
		        if (out != null) {
		            out.close();
		        }
		        if (filecontent != null) {
		            filecontent.close();
		        }
		    }
		System.out.println("in else part");
		String topic;
		String author=(String) request.getSession().getAttribute("author");
		topic=request.getParameter("topic");
		
		System.out.println(author);
		System.out.println(topic);
		try {
			PreparedStatement stmt=con.prepareStatement("insert into post (author_name,topic,blog,date)  values (?,?,?, now() ) ");
			stmt.setString(1, author);
			stmt.setString(2, topic);
			stmt.setString(3, str);
			int res=stmt.executeUpdate();
		 
		String string="post created successfully";
		int flag=0;
		if(res==1)
		{
			flag=1;
		System.out.println(string);
		}
		else
		{
			System.out.println("error in crating post");
		}
		
		stmt.close();
		if(flag==1)
			response.sendRedirect("UserPosts");
		}
		catch (SQLException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	private String getFileName(Part part) {
		 final String partHeader = part.getHeader("content-disposition");
		    for (String content : part.getHeader("content-disposition").split(";")) {
		        if (content.trim().startsWith("filename")) {
		            return content.substring(
		                    content.indexOf('=') + 1).trim().replace("\"", "");
		        }
		    }
		    return null;
	}

}
