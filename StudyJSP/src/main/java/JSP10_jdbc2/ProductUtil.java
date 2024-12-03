package JSP10_jdbc2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductUtil {

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("드라이버 로드 성공");
			
			String url = "jdbc:mysql://localhost:3306/STUDY_JSP";
			String user = "root";
			String passwd = "1234";
			con = DriverManager.getConnection(url, user, passwd);
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
		} catch (SQLException e) {
			System.out.println("DB연결 실패");
			e.printStackTrace();
		}		
		return con;
	}
	public static void close(Connection con) {
		try {
		con.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

	public static void close(PreparedStatement pstmt) {
		try {
		pstmt.close();
	} 	catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
	public static void close(ResultSet rs) {
	try {
		rs.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}