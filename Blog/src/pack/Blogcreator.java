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

@WebServlet("/Blogcreator")
public class Blogcreator extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Connection con;
    DbCon db;
    public Blogcreator() {
        super();
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname,lname,email_id,password,uname,contact_no;
		fname=request.getParameter("firstname");
		lname=request.getParameter("lastname");
		email_id=request.getParameter("email");
		password=request.getParameter("passwd");
		uname=request.getParameter("username");
		contact_no=request.getParameter("contactno");
	
		try {
			PreparedStatement stmt1=con.prepareStatement("select username from userdb where email=?");
			PreparedStatement st1=con.prepareStatement("select email from userdb where username=?");
			st1.setString(1, uname);
			ResultSet set=st1.executeQuery();
			if(set.next())
			{
				String email=set.getString(1);
				if(email!=null && email!="")
				{
					response.sendRedirect("Signup.jsp?uname=1");
				}
			}
			else
			{
				stmt1.setString(1, email_id);
				ResultSet set1=stmt1.executeQuery();
				if(set1.next())
				{
					String name=set1.getString(1);
					if(name!=null && name!="")
					{
						response.sendRedirect("Signup.jsp?email=1");
						
					}
				}
				else
				{
					
					int result=db.insert(uname,password,fname,lname,contact_no,email_id,con);
					if(result==1)
					{
						response.sendRedirect("login.jsp");
					}
			}
		}
		}
		catch(SQLException  e)
		{
			e.printStackTrace();
		}
		
	}
	}
																			   
