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

@WebServlet("/AllPosts")
public class AllPosts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Connection con;
       DbCon db;

    public AllPosts() {
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
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
    	res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		res.setDateHeader("Expires", 0); 
    	doPost(req,res);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try {
			PreparedStatement stmt=con.prepareStatement("select id,author_name,topic,blog from post ");
			ResultSet st=stmt.executeQuery();
			request.getSession().setAttribute("allPostResultSet", st);
			request.getRequestDispatcher("DisplayPosts.jsp?set=1").forward(request, response);
			//st.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
