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
import java.util.List;

@WebServlet("*.jdbc")
public class Jdbcservlet3 extends HttpServlet {
	
	Connection con = null;
	PreparedStatement pstmt =null;
	

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String command = req.getServletPath();
		
		if (command.equals("/Main.jdbc") ) {
			RequestDispatcher dis = req.getRequestDispatcher("Jsp10_jdbc/jdbc_main.jsp");
			dis.forward(req, resp);
		} else if (command.equals("/connect1.jdbc")) {
			con = JdbcUtil.getConnection();
			try {
				System.out.println("DB연결");
			} finally {
				JdbcUtil.close(con);
				JdbcUtil.close(pstmt);
				
			}
		} else if (command.equals("/connect2.jdbc")) {
			try {
				System.out.println("DB연결 성공");
			} finally {
				JdbcUtil.close(con);
				JdbcUtil.close(pstmt);
				
			}
		} else if (command.equals("/connect3.jdbc")) {
			
			//con = JdbcUtil.getConnection();
			
			int idx = Integer.parseInt(req.getParameter("idx"));
			String name = req.getParameter("name");
			System.out.println(idx + " , " + name);
			
			StudentDAO dao = new StudentDAO();
			int insertCnt = dao.insert(idx, name);
			System.out.println("INSERT 구문 실행 결과" + insertCnt);
			
			
		} else if (command.equals("/connect3_update.jdbc")) {
		
			int idx = Integer.parseInt(req.getParameter("idx"));
			String name = req.getParameter("name");
			System.out.println(idx + " , " + name);
			
			StudentDTO dto = new StudentDTO(idx, name);
			StudentDAO dao = new StudentDAO();
			int updateCnt = dao.update(dto);
			System.out.println("UPDATE 구문 실행 결과" + updateCnt);
			
		} else if (command.equals("/connect3_delete.jdbc")) {
			
			int idx = Integer.parseInt(req.getParameter("no"));
			String name = req.getParameter("name");
			System.out.println(idx + " , " + name);
			
			StudentDTO dto = new StudentDTO();
			StudentDAO dao = new StudentDAO();
			int deleteCnt = dao.delete(dto);
			System.out.println("Delete 구문 실행 결과" + deleteCnt);
			
		} else if (command.equals("/connect3_select.jdbc")) {
			int idx = Integer.parseInt(req.getParameter("idx"));
			System.out.println(idx +"연결확인");
			
			StudentDAO dao = new StudentDAO();
			dao.select(idx);
			
		} else if (command.equals("/connect3_select2.jdbc")) {
			//학생 한명의 정보를 jdbc_select2.jsp 화면으로 가져가기!
			int idx = Integer.parseInt(req.getParameter("idx"));
			
			StudentDAO dao = new StudentDAO();
			StudentDTO student = dao.select2(idx);
			req.setAttribute("student", student);
			
			RequestDispatcher dis = req.getRequestDispatcher("/Jsp10_jdbc/jdbc_select2.jsp");
			dis.forward(req, resp);
		
			
		} else if (command.equals("/connect3_select3.jdbc")) {
			//System.out.println("select3 호출됨");
			StudentDAO dao = new StudentDAO();
			List<StudentDTO> studentList = dao.select3();
			req.setAttribute("studentList", studentList);
			RequestDispatcher dis = req.getRequestDispatcher("/Jsp10_jdbc/jdbc_select3.jsp");
					dis.forward(req, resp);
			
			
			/* arraylist = vector = list 같음
			 * ArrayList<StudentDTO> list = new ArrayList<StudentDTO>(); Vector vec = new
			 * Vector(); LinkedList linkedList = new LinkedList();
			 * 
			 * List<StudentDTO> list2 = new LinkedList();
			 */
		}
	} 
	

}
