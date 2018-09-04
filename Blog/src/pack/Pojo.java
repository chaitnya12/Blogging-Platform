package pack;

 class Pojo {
	String driver;//="com.mysql.jdbc.Driver";
	String url;//="jdbc:mysql://localhost:3306/blogging";
	String userName;//="root";
	String password;//="";
	
	public Pojo()
	{
		this.driver="com.mysql.jdbc.Driver";
		url="jdbc:mysql://localhost:3306/blogging";
		this.userName="root";
		this.password="";
	}

	String getDriver() {
		return driver;
	}


	void setDriver(String driver) {
		this.driver = driver;
	}


	String getUrl() {
		return url;
	}


	void setUrl(String url) {
		this.url = url;
	}


	String getUserName() {
		return userName;
	}


	void setUserName(String userName) {
		this.userName = userName;
	}


	String getPassword() {
		return password;
	}


	void setPassword(String password) {
		this.password = password;
	}

}
