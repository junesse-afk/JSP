package jsp10_jdbc;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//@WebServlet("*.jdbc")
public class JdbcServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String command = req.getServletPath();
		System.out.println("command: " + command);
		
		if (command.equals("/Main.jdbc")) {
			RequestDispatcher dis = 
					req.getRequestDispatcher("jsp10_jdbc/jdbc_main.jsp");
			
			dis.forward(req, resp);
		} else if (command.equals("/connect1.jdbc")) {
			// 1단계. JDBC 드라이버 로드
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("드라이버 로드 성공!");
				
			} catch (ClassNotFoundException e) {
				System.out.println("드라이버 로드 실패!");
				e.printStackTrace();
			}
		} else if (command.equals("/connect2.jdbc")) {
			// 1단계. JDBC 드라이버 로드
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("드라이버 로드 성공!");
				
				// 2단계 DB연결(접속)
				// java.sql.DrivetManager 클래스의 static 메서드 getConnection() 메서드 호출
				// (접속 성공 시 접속 정보 관리하는 java.sql.Connection 객체 리턴됨)
				// => 파라미터: 접속URL, 계정명, 패스워드
				// => 리턴타입: java.sql.Connection
				String url = "jdbc:mysql://localhost:3306/STUDY_JSP";
				String user = "root";
				String passwd = "1234";
				Connection con = DriverManager.getConnection(url, user, passwd);
				System.out.println("DB 연결 성공!");
				
			} catch (ClassNotFoundException e) {
				System.out.println("드라이버 로드 실패!");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("DB 연결 실패!");
				e.printStackTrace();
			}
		} else if (command.equals("/connect3_insert.jdbc")) {
			
//			String idx = req.getParameter("idx");
			// idx 파라미터 값을 정수형 변수에 저장하려면 String -> int 형변환 필수!
			// => 변환 기본 문법: Integer.parseInt(문자열)
			int idx = Integer.parseInt(req.getParameter("idx"));
			String name = req.getParameter("name");
			System.out.println(idx + ", " + name);
			
			try {
				// 1단계. JDBC 드라이버 로드
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("드라이버 로드 성공!");
				
				// 2단계. DB연결(접속)
				String url = "jdbc:mysql://localhost:3306/STUDY_JSP";
				String user = "root";
				String passwd = "1234";
				Connection con = DriverManager.getConnection(url, user, passwd);
				System.out.println("DB 연결 성공!");
				// -----------------------------------------------
				// 3단계. SQL 구문 작성 및 전달
				// 3-1) SQL 구문을 문자열로 작성하여 변수에 저장
//				String sql = "INSERT INTO STUDENT (IDX, NAME) VALUES(" + idx + ", '" + name + "')";
				// 3-2) Coneection 객체의 prepareStatement() 메서드 호출하여
				//   작성된 SQL 구문을 파라미터로 전달
				//   => 전달된 SQL구문을 관리하는 java.sql.PreparedStatement 객체 리턴됨
//				PreparedStatement pstmt = con.prepareStatement(sql);
				// ------------------------------------------
				// 만약, 관리되는 SQL 구문 확인하려면 PreparedStatement 객체 출력
//				System.out.println("pstmt = " + pstmt);
				
				// ===============================================
				// 주의! 3단계 SQL 구문 작성 과정에서
				// 데이터 부분을 변수 결합을 통해 SQL구문 작성 시
				// SQL 삽입 공격 (SQL Injection)에 대한 위험성이 존재한다!
				// (=> 공격자가 임의로 설정한 SQL구문이 개발자의 SQL구문에 끼어들어
				//     개발자가 의도하지 않은 구문 형태로 실행되도록 하는 해킹 기법)
				// => 원래 Statement 타입 객체를 통해 SQL구문 실행 시 사용하던 방식
				//   이 문제점을 해결하기 위해 만든객체가 PreparedStatement 타입 객체이다!
				String sql = "INSERT INTO STUDENT VALUES (?, ?)";
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				/*
				 * 3-3) SQL 문장을 관리하는 PreparedStatement 객체(pstmt) 의
				 *      setXXX() 메서드 호출하여 만능문자(?) 부분을 실제 데이터 교체(치환)
				 *      => setXXX(index, data) 메서드의 XXX 부분은 교체할 데이터의 자바 데이터타입명
				 *         ex) 정수형 데이터 전달 시 : setInt()
				 *             문자열 데이터 전달 시 : setString()
				 *      => 첫번째 파라미터(int index) : 만능문자(?) 순서번호
				 *      => 두번째 파라미터(XXX data) : 만능문자 부분에 교체될 실제 데이터
				 *                                     (메서드명에 따라 XXX 부분 타입이 달라짐)
				 *      => 주의1) 모든 만능문자는 반드시 데이터로 치환되어야 한다!
				 *                만약, 빠진 데이터가 있을 경우 예외(오류) 발생
				 *                (java.sql.SQLException: No value specified for parameter 2)
				 *                (두번째 파라미터의 값이 지정되지 않았음)
				 *      => 주의2) pstmt.setXXX() 메서드간의 순서는 상관이 없으나
				 *                반드시 PreparedStatement 객체를 리턴받은 후
				 *                4단계 작업(SQL 구문 실행) 전에 파라미터 교체 필수!
				 */
				
				pstmt.setInt(1, idx);
				pstmt.setString(2, name);
				System.out.println("pstmt = " + pstmt);
				
				// ================================================
				// 4단계. SQL 구문 실행 및 결과 처리
				int insertCnt = pstmt.executeUpdate();
				System.out.println("INSERT 구문 실행 결과: " + insertCnt);
				
			} catch (ClassNotFoundException e) {
				System.out.println("드라이버 로드 실패!");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("DB 연결 실패!");
				e.printStackTrace();
			}
			
		} else if (command.equals("/connect3_update.jdbc")) {
			
			int idx = Integer.parseInt(req.getParameter("idx"));
			String name = req.getParameter("name");
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("드라이버 로드 성공!");
				
				String url = "jdbc:mysql://localhost:3306/STUDY_JSP";
				String user = "root";
				String passwd = "1234";
				Connection con = DriverManager.getConnection(url, user, passwd);
				System.out.println("DB 연결 성공!");
				
				String sql = "UPDATE STUDENT SET NAME = ? WHERE IDX = ?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setInt(2, idx);
				System.out.println("pstmt = " + pstmt);
				
				int updatetCnt = pstmt.executeUpdate();
				System.out.println("UPDATE 구문 실행 결과: " + updatetCnt);
				
			} catch (ClassNotFoundException e) {
				System.out.println("드라이버 로드 실패!");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("DB 연결 실패!");
				e.printStackTrace();
			}
			
			
		} else if (command.equals("/connect3_delete.jdbc")) {
			int idx = Integer.parseInt(req.getParameter("idx"));
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("드라이버 로드 성공!");
				
				String url = "jdbc:mysql://localhost:3306/STUDY_JSP";
				String user = "root";
				String passwd = "1234";
				Connection con = DriverManager.getConnection(url, user, passwd);
				System.out.println("DB 연결 성공!");
				
				String sql = "DELETE FROM STUDENT WHERE IDX = ?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, idx);
				System.out.println("pstmt = " + pstmt);
				
				int deleteCnt = pstmt.executeUpdate();
				System.out.println("DELETE 구문 실행 결과: " + deleteCnt);
				
			} catch (ClassNotFoundException e) {
				System.out.println("드라이버 로드 실패!");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("DB 연결 실패!");
				e.printStackTrace();
			}
			
		}
		
		
		
	}

}





