package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import ChartDrawn.Database;

@WebServlet("/checkSavableCode")
public class checkSavableCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/xml; charset=utf-8");
		PrintWriter out = response.getWriter();
		String mycode = "";
		Connection conn = null; 
		Statement stmt = null; 
		ResultSet rs = null; 
		
		Database db = Database.getInstance();
		
		try {
			conn = db.getConnection();
			stmt = conn.createStatement();
			
			String sql = "SELECT COUNT(NUM) FROM SAVECODE;";
			rs = stmt.executeQuery(sql);
			
			int count=0;
			while(rs.next()) {
				count = Integer.parseInt(rs.getString("count(num)"));
			}
			count++;
			sql = "INSERT INTO SAVECODE (CODE, DATA) VALUE ('"+count+"', 'NODATA');";
			stmt.execute(sql);
			mycode = count+"";
		}
		catch(Exception e){
			System.out.println("checkSavable 오류: "+e);
		}
		finally {
			try{
				if(rs!=null){
					rs.close();
				}
				if(stmt!=null){
					stmt.close();
				}
				if(conn!=null){
					conn.close();
				}
			}
			catch(Exception e){
				System.out.println("Conn.Close 오류: "+e);
			}
		}
		out.println("<response><code>"+mycode+"</code></response>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
