package Jsp10_jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.Attributes.Name;

import jakarta.servlet.jsp.tagext.TryCatchFinally;

public class StudentDAO {

	// insert
	
	public int insert(int idx, String name) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertCnt = 0;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql ="INSERT INTO STUDENT VALUES (?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, idx);
			pstmt.setString(2, name);
			System.out.println("pstmt = " + pstmt);
			insertCnt = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			System.out.println("dd");
		} finally {
			JdbcUtil.close(con);
			JdbcUtil.close(pstmt);
		}
		
		return insertCnt;
	}
	//update
	public int update(StudentDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateCnt = 0;
		
		try {
		con = JdbcUtil.getConnection();
	
		String sql ="UPDATE STUDENT SET name = ? where idx = ? ";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, dto.getIdx());
		
		System.out.println("pstmt = " + pstmt);
		updateCnt = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		System.out.println("DB연결 실패");
		e.printStackTrace();
	} finally {
		JdbcUtil.close(con);
		JdbcUtil.close(pstmt);
	}
		 return updateCnt;
	}
	//delete
	public int delete(StudentDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int deletedateCnt = 0;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql ="DELETE FROM STUDENT WHERE IDX=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getIdx());
			System.out.println("pstmt = " + pstmt);
			
			deletedateCnt = pstmt.executeUpdate();
			System.out.println("DELETE 구문 실행 결과" + deletedateCnt);
			} catch (SQLException e) {
				System.out.println("DB연결 실패");
				e.printStackTrace();
			} finally {
				JdbcUtil.close(con);
				JdbcUtil.close(pstmt);
			}
		return deletedateCnt;
	}//delete 메서드 끝
	
	public void select(int idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtil.getConnection();
			//SQL 구문 작성 및 전달
			String sql = "SELECT * FROM STUDENT WHERE idx =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			System.out.println(pstmt +"pstmt 확인");
			
			//---------------------------
			//SELECT 구문은 다른 작업들과 완전 달라짐
			rs = pstmt.executeQuery();
			// 조회 성공/실패 여부와 관계없이 ResultSet 객체는 생성됨(null없음)
			System.out.println(rs);
			
			/*
			 * SELECT 구문 실행 성공 시 조회된 테이블이 ResultSet 객체에 저장되므로
			 * ResultSet 객체의 next() 메서드 호출하여 커서를 다음 레코드(row)로 이동시킴
			 * => 이때, next() 메서드 리턴타입이 boolean 이므로 판별을 통해
			 * 다음 레코드(row) 존재여부 확인가능!
			 * 
			 */
			
			
//			System.out.println(rs.next());
//			System.out.println("컬럼 인덱스로 첫번쨰 로우의 첫번째 컬럼접근"+ rs.getInt(1));
//			System.out.println("컬럼 인덱스로 첫번쨰 로우의 두번째 컬럼접근"+ rs.getString(2));
//			
//			System.out.println(rs.next());
//			System.out.println("컬럼 인덱스로 첫번쨰 로우의 첫번째 컬럼접근"+ rs.getInt(1));
//			System.out.println("컬럼 인덱스로 첫번쨰 로우의 두번째 컬럼접근"+ rs.getString(2));
			
//			if(rs.next()) {
//				System.out.println("데이터 있음!");
//				System.out.println("idx 컬럼데이터 " + rs.getInt("idx")); 
//				System.out.println("name 컬럼데이터 " + rs.getString("name"));
//			} else {
//				System.out.println("데이터 없음!");
//			}
			//조회결과가 다중 row(복수개)일 수도 있는 경우 : while 문 활용
			// => if 문 대신 while 문 사용하여 ["다음 row가 존재할 동안" 반복]
			
			while (rs.next()) {
				//데이터가 존재할 동안 반복!
				System.out.println("idx 컬럼데이터 " + rs.getInt("idx")); 
				System.out.println("name 컬럼데이터 " + rs.getString("name"));
			}
			
		} catch (SQLException e) {
			
		} finally {
			JdbcUtil.close(con);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	public StudentDTO select2(int idx) {
		// DB작업에 필요한 객체들 로컬 변수 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		StudentDTO student = null;
		con = JdbcUtil.getConnection();
		try {
			
			String sql = "SELECT * FROM STUDENT WHERE idx =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery(); //셀렉트할때만 큐트 나머지 업데이트 딜리트 등은 업데이트
			System.out.println(pstmt +"pstmt 확인");
			
			while (rs.next()) {
				//데이터가 존재할 동안 반복!
				int dbidx = rs.getInt("idx");
				String dbname = rs.getString("name");
				student = new StudentDTO(dbidx, dbname); //여기서 맨끝에 idx는 컬럼명
//				student.setName(rs.getString("name")); //여기서 맨 끝에 name은 컬럼명
				System.out.println(dbidx);
				System.out.println(dbname);
			}
			
		} catch (SQLException e) {	
			
		} finally {
			JdbcUtil.close(con);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} 
		return student;
	}
	
	public List<StudentDTO> select3(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StudentDTO> studentList = null;
		
		con = JdbcUtil.getConnection();
		
		try {
			
			String sql = "SELECT * FROM STUDENT";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			studentList = new ArrayList<StudentDTO>();
			
			while (rs.next()) {
				
				int idx = rs.getInt("IDX");
				String name = rs.getString("NAME");
				StudentDTO student = new StudentDTO();
				student.setIdx(idx);
				student.setName(name);
				// row 한건에 대한 정보 student에 저장
				
				studentList.add(student);
			}
			
		} catch (Exception e) {
			
		} finally {
			JdbcUtil.close(con);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	return studentList;
	}
}

