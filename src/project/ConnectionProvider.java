package project;
import java.sql.*;
public class ConnectionProvider {
	public static Connection getConnection(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aj","root","root");
			return conn;
		}
		catch(Exception e){
			System.out.println(e);
			return null;
		}
	}
}
