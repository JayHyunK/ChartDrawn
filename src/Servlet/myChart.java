package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import org.json.*;
import org.json.simple.*;
import org.json.simple.parser.*;

import java.sql.*;
import ChartDrawn.Database;

@WebServlet("/myChart")
public class myChart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String code = request.getParameter("code");
		
		Connection conn = null; 
		Statement stmt = null; 
		ResultSet rs = null; 
		
		Database db = Database.getInstance();
		String table="";
		String message="";
		
		try {
			conn = db.getConnection();
			stmt = conn.createStatement();
			String sql; 
			sql = "SELECT DATA FROM SAVECODE WHERE CODE = '"
				+ code+"';";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				table=rs.getString("data");
			}

		}
		catch(Exception e) {
			System.out.println("query: "+e);
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
		if(table.equals("")||table.equals(null)||table.equals("null")||table.equals("NODATA")) {
			message = "<script>alert('일치하는 정보가 없습니다. 코드를 확인해주세요.'); history.back();</script>";
		}
		request.setAttribute("CodeData", table);
		request.setAttribute("message", message);
		RequestDispatcher dispatcher=request.getRequestDispatcher("mychart.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String data = request.getParameter("data");
		
		Object obj = null;
		JSONObject jsonOb = null;
		String code="";
		
		try {
			
			JSONParser parser=new JSONParser();
			obj = parser.parse(data);
			jsonOb=(JSONObject)obj;
			System.out.println(jsonOb);
		}
		catch(Exception e) {
			System.out.println("JSON 변환 오류: "+e);
		}
		
		Connection conn = null; 
		Statement stmt = null; 
		ResultSet rs = null; 
		
		Database db = Database.getInstance();
		
		try {
			code = jsonOb.get("code").toString();
			String html = jsonOb.get("page").toString();
			String refineHtml = html.replaceAll("\t", "");
			String redata = refineHtml.replaceAll("\n", "");
			
			conn = db.getConnection();
			stmt = conn.createStatement();
			String sql; 
			sql = "UPDATE SAVECODE SET DATA = '"
				+ redata+"' WHERE CODE = '"
				+ code+"';";
			System.out.println(sql);
			stmt.execute(sql);
		}
		catch(Exception e) {
			System.out.println("query: "+e);
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
		response.sendRedirect("myChart?code="+code);
	}

}
