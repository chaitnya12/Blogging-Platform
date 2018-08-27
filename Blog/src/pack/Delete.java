package pack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
      Connection con;
      DbCon db;
    public Delete() {
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int id=(Integer)request.getSession().getAttribute("delId");
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("delete from post where id=?");
			stmt.setInt(1, id);
			boolean bool =stmt.execute();
			if(!bool)
			{
				response.sendRedirect("UserPosts");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
