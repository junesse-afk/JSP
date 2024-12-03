package jsp09_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// web.xml 파일에 서블릿 매핑 내용을 기술하지 않고
// 서블릿 클래스 정의 시 @WebServlet 어노테이션으로 매핑도 가능ㅎ마
// => @WebServlet("/서블릿주소") 또는 @WebServlet("*.패턴") 형식으로 지정
//---------------------------------------------------------
// 주의! 매핑 URL 작성 시 클라이언트가 요청하는 URL을 정확히 명시해야 한다!
// ex) 브라우저 요청 주소 : http://localhost:8080/StudyJSP/jsp09_servlet/myServlet3
//     이때, 매핑되어야할 서블릿 주소는 컨텍스트 루트(StudyJSP) 뒷부분의 주소가 기술되어야 한다.
//     즉, "/myServlet3" 가 아니라 "/jsp09_servlet/myServlet3" 주소가 기술되어야 함!
//
@WebServlet("/myServlet3")
//@WebServlet("/jsp09_servlet/myServlet3")
public class TestServlet3 extends HttpServlet {

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet3 - doGet()");
		
		// GET 방식 요청 시 파라미터로 전달 받은 id 값 변수에 저장 후 출력
		// 자바파일이라 ${param.XXX} 안됨
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		System.out.println("아이디 : " + id);
		System.out.println("아이디 : " + name);
		
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet3 - doPost()");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		System.out.println("아이디 : " + id);
		System.out.println("아이디 : " + name);
		
	
	}
	//만약에 GET방식과 POST방식에서의 처리코드가 동일하다면
	// 중복된 코드를 제거하기 위해 하나의 메서드로 통합처리도 가능! (위에 오버라이드 안됨)
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		System.out.println("아이디 : " + id);
		System.out.println("아이디 : " + name);
	}


}
