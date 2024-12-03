package jsp09_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/*
 *  복수개의 서블릿 주소를 하나의 서블릿 클래스에서 매핑할 경우
 *  1) 복수개의 서블릿 주소를 중괄호로 묶어서 표현
 *  2) 복수개의 서블릿 주소를 모두 동일한 패턴으로 묶어서 간략하게 표현 
 * 	=> @WebServlet("*.패턴명")
 *     ex) BoardList.bo 서블릿 주소와 BoardDetail.bo 서블릿 주소를 하나의 클래스에서 매핑할 경우
 *         공통된 주소 부분을 xxx.bo 형식으로 표현 가능하므로@WebServlet("*.bo") 형식으로 매핑
 * 
 * 
 * 
 * 
 * 
 */

@WebServlet("*.test")
public class TestServlet4 extends HttpServlet {

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet3 - doGet()");
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet3 - doPost()");

	}


}
