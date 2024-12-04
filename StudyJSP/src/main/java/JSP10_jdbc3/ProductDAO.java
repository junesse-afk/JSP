package JSP10_jdbc3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Jsp10_jdbc.JdbcUtil;
import Jsp10_jdbc.StudentDTO;

public class ProductDAO {
						//(ProductDTO) 요렇게도 되나봄
	public int insert(int id, String name, int price, int qty, String img) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int insert = 0;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql ="INSERT INTO PRODUCT VALUES (?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			//pstmt.setInt(1, prod.getProduct_id()); 요렇게도 되나봄
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setInt(3, price);
			pstmt.setInt(4, qty);
			pstmt.setString(5, img);
			insert = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			System.out.println("실패");
		} finally {
			JdbcUtil.close(con);
			JdbcUtil.close(pstmt);
		}
		
		return insert;
	}
	public List<ProductDTO> select(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> ProductList = null;
		
		con = JdbcUtil.getConnection();
		try {
			
			String sql = "SELECT * FROM PRODUCT";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ProductList = new ArrayList<ProductDTO>();
			
			while (rs.next()) {
				
				int idx = rs.getInt("product_id");
				String name = rs.getString("product_name");
				int price = rs.getInt("product_price");
				int qty = rs.getInt("product_qty");
				String img = rs.getString("product_img");
				
				ProductDTO product = new ProductDTO();
				product.setProduct_id(idx);
				product.setProduct_name(name);
				product.setProduct_price(price);
				product.setProduct_qty(qty);
				product.setProduct_img(img);
				
				ProductList.add(product);
			}
		} catch (Exception e) {
			
		}finally {
			JdbcUtil.close(con);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	return ProductList;
	}
	public ProductDTO select(int idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		ProductDTO product = null;
		con = JdbcUtil.getConnection();
		
		try {
			
			String sql = "SELECT product_id,product_name,product_price,product_qty,product_img"
					+ 	" FROM PRODUCT "
					+ 	"WHERE product_id = ?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			System.out.println("pstmt : " +pstmt );
			rs = pstmt.executeQuery();
			while (rs.next()) {
				//데이터가 존재할 동안 반복!
				int dbidx = rs.getInt("product_id");
				String dbname = rs.getString("product_name");
				int dbpri = rs.getInt("product_price");
				int dbqty = rs.getInt("product_qty");
				String dbimg = rs.getString("product_img");
				System.out.println("dbidx: " + dbidx);

				System.out.println("dbname: " + dbname);
				
				product = new ProductDTO(dbidx, dbname, dbpri, dbqty, dbimg);
				
				// product = new ProductDTO(rs.getInt("product_id"),rs.getString("product_name"),rs.getInt("product_price"), rs.getInt("product_qty"),rs.getString("product_img"));
				// System.out.println(product);
			}
			
		} catch (Exception e) {
			System.out.println("SQL 구문 오류");
		} finally {
			JdbcUtil.close(con);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} 
		return product;
	}
	public int delete(int idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int delete = 0;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql ="DELETE FROM product WHERE product_id = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, idx);
			System.out.println("pstmt = " + pstmt);
			
			delete = pstmt.executeUpdate();
			System.out.println("DELETE 구문 실행 결과" + delete);
			} catch (SQLException e) {
				System.out.println("DB연결 실패");
				e.printStackTrace();
			} finally {
				JdbcUtil.close(con);
				JdbcUtil.close(pstmt);
			}
		return delete;
		}

}