package JSP10_jdbc2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import Jsp10_jdbc.StudentDAO;
import Jsp10_jdbc.StudentDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.pr")
public class ProductServlet extends HttpServlet {
	Connection con = null;
	PreparedStatement pstmt =null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doProcess(req, resp);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String command = req.getServletPath();
		System.out.println(command);
		if (command.equals("/main.pr")) {
			RequestDispatcher dis = req.getRequestDispatcher("JSP10_jdbc2/product_main.jsp");
			dis.forward(req, resp);
			
		} else if(command.equals("/ProductRegistForm.pr")) {
			RequestDispatcher dis = req.getRequestDispatcher("JSP10_jdbc2/product_regist_form.jsp");
			dis.forward(req, resp);
			
		} else if(command.equals("/ProductRegist.pr")){
			
			 int id = Integer.parseInt(req.getParameter("product_id")); 
			 String name = req.getParameter("product_name");
			 int price = Integer.parseInt(req.getParameter("product_price"));
			 int qty = Integer.parseInt(req.getParameter("product_qty"));
			 String img = req.getParameter("product_img");
					
			ProductDAO dao = new ProductDAO(); 
			int insert = dao.insert(id, name, price, qty, img);
			System.out.println(insert);
			
			if (insert == 0 ) {
				RequestDispatcher dis = req.getRequestDispatcher("JSP10_jdbc2/product_fail.jsp");
				dis.forward(req, resp);
			} else {
				RequestDispatcher dis = req.getRequestDispatcher("JSP10_jdbc2/product_regist_success.jsp");
				dis.forward(req, resp);
			}
			
		} else if(command.equals("/ProductList.pr")) {
			
			ProductDAO dao = new ProductDAO();
			List<ProductDTO> ProductList = dao.select();
			req.setAttribute("ProductList", ProductList);
			
			RequestDispatcher dis = req.getRequestDispatcher("JSP10_jdbc2/product_list.jsp");
			dis.forward(req, resp);
			
		} else if(command.equals("/ProductDetail.pr")) {
			
			 int id = Integer.parseInt(req.getParameter("product_id"));
			 System.out.println(id);
			 ProductDAO dao = new ProductDAO();
			 ProductDTO dto = dao.select(id);
			 req.setAttribute("ProductDetail", dto);
			 
			RequestDispatcher dis = req.getRequestDispatcher("JSP10_jdbc2/product_detail.jsp");
			dis.forward(req, resp);
		} else if(command.equals("/ProductDelete.pr")) {
			int idx = Integer.parseInt(req.getParameter("product_id"));
	
			
			ProductDAO dao = new ProductDAO();
			int delete = dao.delete(idx);
			
			RequestDispatcher dis = req.getRequestDispatcher("JSP10_jdbc2/product_main.jsp");
			dis.forward(req, resp);
		}
		
		
	}

}


/*
 * RequestDispatcher dis =
 * req.getRequestDispatcher("JSP10_jdbc2/product_regist_form.jsp");
 * dis.forward(req, resp);
 */


/*

 */
