package jsp09_servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TestServlet2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// GET 방식 요청이 발생했을 때 자동으로 호출되는 메서드
		System.out.println("TestServlet2 - doGet()");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// POST 방식 요청이 발생했을 때 자동으로 호출되는 메서드
		System.out.println("TestServlet2 - doPost()");
	}


	
}
