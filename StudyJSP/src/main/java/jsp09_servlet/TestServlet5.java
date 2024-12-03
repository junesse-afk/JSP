package jsp09_servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// xxx.test5로 끝나는 모든 서블릿 주소 매핑
@WebServlet("*.test5")
public class TestServlet5 extends HttpServlet {

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("TestServlet5 - doProcess()");
		
		// 요청 주소가 특정 패턴으로 된 주소일 경우
		// 해당 요청 주소를 판별하여 각각 다른 작업을 수행할 수 있다!
		// 이때, 요청주소를 추출하기 위해서는 요청 정보를 관리하는 HttpServletRequest 객체의
		// getServletPath() 메서드 호출하여 서블릿 주소를 리턴받아 문자열 비교로 판별
		
		String command = req.getServletPath();
		System.out.println("command : " + command);
		// => 브라우저 주소 표시줄의 요청 주소가 "http://localhost:8080/StudyJSP/show.test5의 경우
		// 추출된 서블릿 주소는 "/show.test5"형태이다
		// => 주소가 "http://localhost:8080/StudyJSP/test/show.test5
		// 추출된 서블릿 주소는 "test/show.test5" 형태이다
		// => 즉, 추출되는 서블릿 주소는 전체 URL에서 프로젝트명(=컨테스트 루트)까지를 제외한
		// 나머지 주소부분이 추출된다!
		
		if(command.equals("/main.test5")) {
			//test5_main.jsp를 보여줌
			//실제 메인페이지 역할을 수행할 뷰페이지(JSP)인 "test5_main.jsp 페이지를
			//클라이언트 측으로 응답하려면 해당 파일(페이지)의 내용을 응답데이로 전송해야함
			//=> 이때 요청 주소는 그대로 유지(request 객체 유지)한 채로
			// jsp페이지의 내용만 서버에서 처리 후 응답 데이터로 전송하려면
			// 디스패치(Dispatch) 방식의 포워딩을 수행해야한다!
			// 1) request 객체의 getRequestDispatcher() 메서드를 호출하여
			//    RequestDispatcher 객체를 리턴 받기(파라미터: 포워딩할 주소(파일명))
			// 
			RequestDispatcher dispatcher = req.getRequestDispatcher("jsp09_servlet/test5_main.jsp");
			dispatcher.forward(req, resp);
			
		} else if (command.equals("/list.test5")){
			//test5_list.jsp를 보여줌
			
			//DB로부터 목록 조회하는 작업 완료했다고 가정한다면
			// 해당 조회 결과를 request 객체에 저장한 후
			// jsp페이지를 통해 응답 데이터를 사용자에게 전송하여 출력해야한다!
			req.setAttribute("data", "서버로부터 전송받은 데이터"); //데이터 저장
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("jsp09_servlet/test5_list.jsp");
			dispatcher.forward(req, resp);
		}
	}


}
