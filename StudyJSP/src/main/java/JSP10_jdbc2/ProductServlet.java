package JSP10_jdbc2;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.js")
public class ProductServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getServletPath();
		if (command.equals("/main.js")) {
			RequestDispatcher dis = req.getRequestDispatcher("/JSP10_jdbc2/product_main.jsp");
			dis.forward(req, resp);
		} else if (command.equals("/ProductRegist.js")) {
			RequestDispatcher dis = req.getRequestDispatcher("/JSP10_jdbc2/product_regist_form.jsp");
			dis.forward(req, resp);
		} else if (command.equals("/ProductList.js")) {
			RequestDispatcher dis = req.getRequestDispatcher("JSP10_jdbc2/product_list.jsp");
			dis.forward(req, resp);
		} else if (command.equals("/ProductDetail.js")) {
			RequestDispatcher dis = req.getRequestDispatcher("/JSP10_jdbc2/product_list.jsp");
			dis.forward(req, resp);
		} else if (command.equals("/ProductSuccess.js")) {
			RequestDispatcher dis = req.getRequestDispatcher("JSP10_jdbc2/product_regist_success.jsp");
			dis.forward(req, resp);
		}
		
	}
}
	