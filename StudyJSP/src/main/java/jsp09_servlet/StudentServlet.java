package jsp09_servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// *.st 서블릿 주소 매핑
@WebServlet("*.st")
public class StudentServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String command = req.getServletPath();
		System.out.println(command); // /asdasdasd.st
		
		if (command.equals("/StudentMain.st")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("jsp09_servlet/test6_student_main.jsp");
			dispatcher.forward(req, resp);
		} else if (command.equals("/StudentRegistForm.st")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("jsp09_servlet/test6_student_regist_form.jsp");
			dispatcher.forward(req, resp);
		} else if (command.equals("/StudentRegist.st")) {
			
			String idx = req.getParameter("idx");
			String name = req.getParameter("name");
			
			System.out.println("번호: " + idx);
			System.out.println("이름: " + name);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("jsp09_servlet/test6_student_regist_success.jsp");
			dispatcher.forward(req, resp);
		} else if (command.equals("/StudentList.st")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("jsp09_servlet/test6_student_list.jsp");
			dispatcher.forward(req, resp);
		}
		
		
	}

}
















