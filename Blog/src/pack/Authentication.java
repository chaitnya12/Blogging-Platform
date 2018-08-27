package pack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Authentication")
public class Authentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
      Connection con;
      HttpSession session;
      DbCon db;
    public Authentication() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init()
    {
    	System.out.println("init called");
    	ServletContext context=this.getServletContext();
    	 con=(Connection) context.getAttribute("con");
    	if(con==null)
    	{
    		 db=new DbCon();
    		con=db.getCon();
    		if(con!=null)
    			System.out.println("connection Established");
    		context.setAttribute("con", con);
    	}
    	else
    		System.out.println("connection established");
    }
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		String uname,pwd;
		uname=request.getParameter("username");
		System.out.println(uname);
		pwd=request.getParameter("password");
		System.out.println(pwd);
		String rem=request.getParameter("save");
		if(rem!=null && rem.equals("saveCookie"))
		{
			Cookie ck=new Cookie("username",uname);
			Cookie ck1=new Cookie("password",pwd);
			ck.setMaxAge(24*60*60);
			ck1.setMaxAge(24*60*60);
			response.addCookie(ck);
			response.addCookie(ck1);
		}
		boolean re=db.auntheticate(uname, pwd, con);
		if(con==null)
			System.out.println("con is null");
		System.out.println(re);
		if(re)
		{
			String authorName="";
			try {
				authorName+= db.getauthorName(uname, con);
				System.out.println("author= "+authorName);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			session.setAttribute("author",authorName);
			session.setAttribute("login", "true");
			response.sendRedirect("Index.jsp?created=1");
		}
		else 
		{
			
			session.setAttribute("login", "false");
			response.sendRedirect("Index.jsp?err=1");
		}
		
	}

}
