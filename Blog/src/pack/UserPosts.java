package pack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserPosts")
public class UserPosts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Connection con;
       DbCon db;
    public UserPosts() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init()
    {
    	ServletContext context=this.getServletContext();
    	 con=(Connection) context.getAttribute("con");
    	 
    	if(con==null)
    	{
    		 db=new DbCon();
    		con=db.getCon();
    		context.setAttribute("con", con);
    	}
    }
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String author=(String) req.getSession().getAttribute("author");
		res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		res.setDateHeader("Expires", 0); // Proxies.

		if(req.getSession(false)==null)
		{
			res.sendRedirect("index.jsp");
		}
		if(author==null || author=="")
		{
			res.sendRedirect("Index.jsp");
		}
		else
		{
			try {
				PreparedStatement stmt=con.prepareStatement("select id, author_name,topic,blog from post where author_name=?");
				stmt.setString(1, author);
				ResultSet set=stmt.executeQuery();
				req.getSession().setAttribute("userPostResultSet", set);
				req.getRequestDispatcher("DisplayPosts.jsp?set=0").forward(req, res);
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
	}



}
