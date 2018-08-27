package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbCon {
	Connection con;
	public Connection getCon()
	{
		Pojo obj=new Pojo();
		String driver=obj.getDriver();
		String url=obj.getUrl();
		String uname=obj.getUserName();
		String password="";
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,uname,password);
			
		} 
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {	
			e.printStackTrace();
		}
		
		return con;
		
	}
	public int insert(String uname,String password,String fname,String lname,String contactNo,String email,Connection con)
	{
		int result=0;;
		try {
			PreparedStatement stmt=con.prepareStatement("insert into userdb (username,password,firstname,lastname,contactno,email) values (?,?,?,?,?,?) ");
			stmt.setString(1, uname);
			stmt.setString(2, password);
			stmt.setString(3, fname);
			stmt.setString(4, lname);
			stmt.setString(5, contactNo);
			stmt.setString(6, email);
			 result=stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public boolean auntheticate(String uname,String password,Connection con)
	{
		PreparedStatement stmt;
		if(con==null)
		{
			System.out.println("con is null getting connection");
			con=this.getCon();
		}
		try 
		{
			stmt = con.prepareStatement("select password from userdb where username=?");
			stmt.setString(1, uname);
			String dbPassword;
			ResultSet set=stmt.executeQuery();
			if(set.next())
			{
				dbPassword=set.getString(1);
				if(dbPassword.equals(password))
					return true;
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return false;
	}
	public String getauthorName(String uname,Connection con) throws SQLException
	{
		PreparedStatement stmt=con.prepareStatement("select firstname,lastname from userdb where username=? ");
		stmt.setString(1, uname);
		ResultSet st=stmt.executeQuery();
		String author="";
		while(st.next())
		{
			author+=st.getString(1)+" ";
			author+=st.getString(2);
		}
		return author;
		
	}

}
