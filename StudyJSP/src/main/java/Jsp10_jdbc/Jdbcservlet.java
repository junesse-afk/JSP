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
public class Jdbcservlet extends HttpServlet {

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
			//1단계 JDBC 드라이버 로드
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// 어렵거나 복잡한 코드는 트라이 캐치로 지정함
				e.printStackTrace();
			}
			
		} else if (command.equals("/connect2.jdbc")) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				//2단계 DB연결(접속)
				
				//java.sql.DriverManager 클래스의 static 메서드 getConnection() 메서드 호출
				// 접속 성공시 접속 정보 관리하는 java.sql.Connection 객체 리턴됨
				// 파라미터 접속URL , 계정명, 패스워드
				// 리턴타입 java.sql.Connection
				
				String url = "jdbc:mysql://localhost:3306/STUDY_JSP";
				String user = "root";
				String passwd = "1234";
				Connection con = DriverManager.getConnection(url, user, passwd);
				System.out.println("DB연결 성공");
			} catch (ClassNotFoundException e) {
				// 어렵거나 복잡한 코드는 트라이 캐치로 지정함
				System.out.println("드라이버 로드 실패");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("DB연결 실패");
				e.printStackTrace();
			}
		} else if (command.equals("/connect3.jdbc")) {
			
			//String idx = req.getParameter("idx");
			//idx 파라미터 값을 정수형 변수에 저장하려면 String -> int 형변환 필수!
			// => 변환 기본 문법 :
			try {
				//1단계 DB
				Class.forName("com.mysql.cj.jdbc.Driver");
				int idx = Integer.parseInt(req.getParameter("idx"));
				String name = req.getParameter("name");
				System.out.println(idx + " , " + name);
				
				//java.sql.DriverManager 클래스의 static 메서드 getConnection() 메서드 호출
				// 접속 성공시 접속 정보 관리하는 java.sql.Connection 객체 리턴됨
				// 파라미터 접속URL , 계정명, 패스워드
				// 리턴타입 java.sql.Connection
				
				//2단계 DB연결(접속)
				String url = "jdbc:mysql://localhost:3306/STUDY_JSP";
				String user = "root";
				String passwd = "1234";
				Connection con = DriverManager.getConnection(url, user, passwd);
				System.out.println("DB연결 성공");
				
				//-----------------------------------------------------
				// 3단계, SQL 구문 작성 및 전달
				// 3-1) SQL 구문을 문자열로 작성하여 변수에 저장
				//String sql = "INSERT INTO STUDENT(IDX, NAME) VALUES("+ idx +", '"+ name +"')";
				// 3-2) Connection 객체의 prepareStatement() 메서드 호출하여
				// 작성된 SQL 구문을 파라미터로 전달
				// 전달된 SQL구문을 관리하는 java.sql.PrepareStatement 객체 리턴됨
				
				//PreparedStatement pstmt = con.prepareStatement(sql);
				//--------------------------------------------------------
				// 만약, 관리되는 SQL 구문 확인하려면 PreparedStatement 객체 출력
				// System.out.println("pstmt" + pstmt);
				
				// 주의 3단계 sQL 구문 작성 과정에서
				// 데이터 부분을 변수 결합을 통해 SQL 구문 작성 시
				// SQL 삽입 공격(SQL Injection)에 대한 위험성이 존재한다
				// 공격자가 임의로 설정한 SQL구문이 개발자 SQL구문에 끼어들어
				// 개발자가 의도하지 않은 구문 형태로 실행되도록 해킹 기법
				// 원래 Statment 타입 객체를 통해 SQL구문 실행 시 사용하던 방식
				// 이 문제점을 해결하기 위해 만든 객체가 PreparedStatement 타입 객체이다!
				
				String sql ="INSERT INTO STUDENT VALUES (?, ?)";
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, idx);
				pstmt.setString(2, name);
				System.out.println("pstmt = " + pstmt);
				
				//----------------------------------------------------
				// 4단계. SQL구문 실행 및 결과 처리
				int insertCnt = pstmt.executeUpdate();
				System.out.println("INSERT 구문 실행 결과" + insertCnt);
				
			} catch (ClassNotFoundException e) {
				// 어렵거나 복잡한 코드는 트라이 캐치로 지정함
				System.out.println("드라이버 로드 실패");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("DB연결 실패");
				e.printStackTrace();
			}
			
		} else if (command.equals("/connect3_update.jdbc")) {
			try {
			//1단계 DB
			Class.forName("com.mysql.cj.jdbc.Driver");
			int idx = Integer.parseInt(req.getParameter("idx"));
			String name = req.getParameter("name");
			System.out.println(idx + " , " + name);
			
			//2단계 DB연결(접속)
			String url = "jdbc:mysql://localhost:3306/STUDY_JSP";
			String user = "root";
			String passwd = "1234";
			Connection con = DriverManager.getConnection(url, user, passwd);
			System.out.println("DB연결 성공");
			
			// 3단계, SQL 구문 작성 및 전달
			String sql ="UPDATE STUDENT SET name = ? where idx = ? ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setInt(2, idx);
			//pstmt.setString(2, name);
			System.out.println("pstmt = " + pstmt);
			
			int insertCnt = pstmt.executeUpdate();
			System.out.println("INSERT 구문 실행 결과" + insertCnt);
			// 4단계. SQL구문 실행 및 결과 처리
			} catch (ClassNotFoundException e) {
				// 어렵거나 복잡한 코드는 트라이 캐치로 지정함
				System.out.println("드라이버 로드 실패");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("DB연결 실패");
				e.printStackTrace();
			} 
			
		} else if (command.equals("/connect3_delete.jdbc")) {
				try {
					//1단계 DB
					Class.forName("com.mysql.cj.jdbc.Driver");
					int idx = Integer.parseInt(req.getParameter("no"));
					String name = req.getParameter("name");
					System.out.println(idx + " , " + name);
					
					//2단계 DB연결(접속)
					String url = "jdbc:mysql://localhost:3306/STUDY_JSP";
					String user = "root";
					String passwd = "1234";
					Connection con = DriverManager.getConnection(url, user, passwd);
					System.out.println("DB연결 성공");
					
					// 3단계, SQL 구문 작성 및 전달
					String sql ="DELETE FROM STUDENT WHERE IDX=?";
					PreparedStatement pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, idx);
					//pstmt.setString(2, name);
					System.out.println("pstmt = " + pstmt);
					
					int insertCnt = pstmt.executeUpdate();
					System.out.println("INSERT 구문 실행 결과" + insertCnt);
					// 4단계. SQL구문 실행 및 결과 처리
					} catch (ClassNotFoundException e) {
						// 어렵거나 복잡한 코드는 트라이 캐치로 지정함
						System.out.println("드라이버 로드 실패");
						e.printStackTrace();
					} catch (SQLException e) {
						System.out.println("DB연결 실패");
						e.printStackTrace();
					}
		}
	} 
	

}
