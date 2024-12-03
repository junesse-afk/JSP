package jsp09_servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 *  [ 서블릿 (Servlet) ]
 *  - 웹에서의 요청을 처리할 수 잇는 자바 클래스를 서블릿 클래스라고 함
 *  - 서블릿 클래스를 정의하려면 javax.servlet.http.HttpServlet 클래스를 상속받아 정의
 * 	- 서블릿 기능을 사용하려면 추가적인 라이브러리(servlet-api.jar) 등록 필요함
 *    => 이전에는 별도로 라이브러리를 다운로드 받아 추가했지만
 *       현재는 톰캣 서버 라이브러리에 기본으로 제공되므로 별도의 추가는 불필요
 *		 (Libraries 항목에 Server Runtime 라이브러리 등록되어 있으면 된다!)
 *	- 특정 서블릿 주소가 요청되면 톰캣(컨테이너)에 특정 서블릿 클래스가 실행되도록 해야하는데
 *    그러기 위해서는 해당 주소(=서블릿 주소)와 서블릿 클래스 매핑(Mapping) 작업 필수!
 * 	  방법1) web.xml(배포서술자) 파일을 통해 매핑
 *    방법2) 서블릿 클래스 선언부 상단에 @webServlet 어노테이션을 통한 매핑   
 *		   => @WebServlet("/서블릿주소") 또는 @WebServlet("*.패턴") 형식으로 지정
 *
 *---------------------------------------------------------------------------
 *
 * [ 서블릿 주소 매핑 시 필수 주의사항! ]
 * - 서블릿 매핑 시 매핑되는 서블릿 주소는 중복될 수 없다!
 *   만약, 중복된 서블릿 주소를 지정한 경우 예외가 발생하므로 서버가 정상 시작되지 않음
 * - 오류 발생 시 콘솔 창의 오류 메세지는 다음과 같다
 *   Caused by: java.lang.illegalArgumentException
 *  
 * [ 서블릿 클래스 정의 ]
 * 1. 클래스 정의할 때 HttpServlet 클래스를 상속받아 정의
 *    (이때, Tomcat 버전에 따라 패키지가 다를 수 있음)
 * 2. 서블릿 요청 방식에 따라 자동으로 호출될 doGet() 또는 doPost() 메서드 정의
 *    => HttpServlet 클래스의 doGet() 또는 doPost() 메서드 오버라이딩하여 정의 
 *
 */

// 현재 TestServlet1 클래스는 web.xml(배포서술자) 내에 "/myServlet1" 주소와 매핑되어 있음
public class TestServlet1 extends HttpServlet {

	/*
	 *  서블릿 클래스 내에는 GET or POST 방식 요청에 대한 처리를 위해
	 *  doGet() or doPost() 메서드 정의!
	 * => HttpServlet 클래스로부터 상속받아 오버라이딩
	 * => 만약, 두 메서드 중 필요한 요청에 대한 메서드가
	 *  해당 메서드와 일치하는 요청 방식으로 요청이 발생했을 때
	 * 응답 메세지로 HTTP 405(허용되지 않는 메서드) 오류가 발생!
	 * 단, 매칭되는 서블릿 주소가 없을 경우 HTTP 404(찾을 수 없는 페이지) 오류가 발생!
	 * 
	 */
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// GET 방식 요청이 발생했을 때 자동으로 호출되는 메서드
		System.out.println("TestServlet1 - doGet()");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// POST 방식 요청이 발생했을 때 자동으로 호출되는 메서드
		System.out.println("TestServlet1 - doPost()");
	}
	

}

