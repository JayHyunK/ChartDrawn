package ChartDrawn;

import java.sql.*;
import java.sql.DriverManager;

public class Database {
	private Database() {}
	
	private static Database instance = new Database();
	
	public static Database getInstance() {
		return instance;
	}
	public Connection getConnection() throws Exception{//오류가 나면 예외 처리 
		Connection conn=null;
		String url = "jdbc:mysql://127.0.0.1:3306/CHARTIE";
		String id = "root";
		String pw = "iotiot";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url, id, pw);
		return conn;
	}
	//create database chartie; 
	//create table (num, code, data)
	
}
