package cargo.example;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class ExampleSendRedirectAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//req영역으로 부터 parameter 받아 DTO에 넣어주기
		ExampleDTO edto = new ExampleDTO(Integer.parseInt(request.getParameter("go")));

		// 디비 작업슥스슥
		ExampleDAO edao = new ExampleDAO();
		int result = edao.exerciseSendRedirect(edto);
		//redirect방식으로 보내는 경우 보통 return값이 없지만! 굳이 보내려면 get방식으로 보내야합니다.
		//!! setAttribute(x)!! 리퀘스트에 set해봤자 어차피 사라지기 때문
		
		//DB작업을 마쳤으니 이제 어떻게, 어디로 이동할 지 설정해 봅시다.
		ActionForward forward = new ActionForward();
		
		//ajax방식으로 온것도 아니므로!
		forward.setAjax(false);
		
		// 기본적인 경우: DB에 변화가 있다? forward.setRedirect(true) ex)회원 추가
		//Redirect방식으로 보내기 위해
		forward.setRedirect(true);

		/*
		 * Redirect방식으로 보낼때와 Dispatcher방식으로 보낼때 시작하는 폴더가 다릅니다. Redirect방식은
		 * 클라이언트에게 넘겨줘서 클라이언트가 다시 다른 사이트로 가므로 프로젝트에서 가장 밖? 에서 접근하므로
		 * contextPath부터 시작함니다
		 * 
		 * Dispatcher방식은 바로 서버에서 바로 다른 페이지를 열어주므로 어노테이션 혹은 xml페이지에서 설정해줬던 경로에서 그
		 * 페이지를 열게됩니다. ex) @WebServlet({"/ex/*"}) 이거였으므로 WebContent 폴더 안에 ex폴더에서
		 * 다른 페이지를 연다고 생각하심될듯.
		 */
		
		//sendRedirect방식이므로 get방식으로 보내준다!! 이때 결과값 전달
		forward.setPath("../example/sendRedirectResult.jsp?result="+result);
		return forward;
	}

}
