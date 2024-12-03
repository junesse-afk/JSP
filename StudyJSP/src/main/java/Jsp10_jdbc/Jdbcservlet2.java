package Jsp10_jdbc;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.Authenticator.RequestorType;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//@WebServlet("*.jdbc")
public class Jdbcservlet2 extends HttpServlet {
	
	Connection con = null;
	PreparedStatement pstmt =null;
	

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String command = req.getServletPath();
		
		if (command.equals("/Main.jdbc") ) {
			RequestDispatcher dis = req.getRequestDispatcher("Jsp10_jdbc/jdbc_main.jsp");
			dis.forward(req, resp);
		} else if (command.equals("/connect1.jdbc")) {
			con = JdbcUtil.getConnection();
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
			
				e.printStackTrace();
			}
			
		} else if (command.equals("/connect2.jdbc")) {
			try {
				System.out.println("DB연결 성공");
				
			}	finally {
				JdbcUtil.close(con);
				JdbcUtil.close(pstmt);
				
			}
		} else if (command.equals("/connect3.jdbc")) {
			
			int idx = Integer.parseInt(req.getParameter("idx"));
			String name = req.getParameter("name");
			
			try {
				con = JdbcUtil.getConnection();
				
				String sql ="INSERT INTO STUDENT VALUES (?, ?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, idx);
				pstmt.setString(2, name);
				System.out.println("pstmt = " + pstmt);
				
				int insertCnt = pstmt.executeUpdate();
				System.out.println("INSERT 구문 실행 결과" + insertCnt);
				
			} catch (SQLException e) {
				System.out.println("DB연결 실패");
				e.printStackTrace();
			} finally {
				JdbcUtil.close(con);
				JdbcUtil.close(pstmt);
				
			}
			
		} else if (command.equals("/connect3_update.jdbc")) {
		
			int idx = Integer.parseInt(req.getParameter("idx"));
			String name = req.getParameter("name");
			
			try {
				con = JdbcUtil.getConnection();
			
				String sql ="UPDATE STUDENT SET idx = ? where name = ? ";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(2, name);
				pstmt.setInt(1, idx);
				System.out.println("pstmt = " + pstmt);
			
				int UpdateCnt = pstmt.executeUpdate();
				System.out.println("INSERT 구문 실행 결과" + UpdateCnt);
			} catch (SQLException e) {
				System.out.println("DB연결 실패");
				e.printStackTrace();
			} finally {
				JdbcUtil.close(con);
				JdbcUtil.close(pstmt);
				
			}
			
		} else if (command.equals("/connect3_delete.jdbc")) {
			int idx = Integer.parseInt(req.getParameter("no"));
				try {
					con = JdbcUtil.getConnection();
					
					String sql ="DELETE FROM STUDENT WHERE IDX=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, idx);
					System.out.println("pstmt = " + pstmt);
					
					int deleteCnt = pstmt.executeUpdate();
					System.out.println("DELETE 구문 실행 결과" + deleteCnt);
					} catch (SQLException e) {
						System.out.println("DB연결 실패");
						e.printStackTrace();
					} finally {
						JdbcUtil.close(con);
						JdbcUtil.close(pstmt);
						
					}
			}
	} 
	

}
