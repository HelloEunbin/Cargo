package cargo.example;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class ExampleDispatcherAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//req영역으로 부터 parameter 받아 DTO에 넣어주기
		ExampleDTO edto = new ExampleDTO(Integer.parseInt(request.getParameter("go")));

		// 디비 작업슥스슥 DAO로부터 리턴 값 있으면 리퀘스트 영역에 set어트리뷰트
		ExampleDAO edao = new ExampleDAO();
		request.setAttribute("edto", edao.exerciseDispatcher(edto)); 
		
		//정보는 request영역에 지정 해 주었으니 이제 어떻게, 어디로 이동할 지 설정해 봅시다.
		ActionForward forward = new ActionForward();
		// 리다이렉트 방식으로 보내지 않을것임!
		// Redirect방식으로 보낼것이냐 안보낼것이냐?
		// 기본적인 경우: DB에 변화가 있다? forward.setRedirect(true) ex)회원 추가
		forward.setRedirect(false);
		//ajax방식으로 온것도 아니니
		forward.setAjax(false);

		/*
		 * Redirect방식으로 보낼때와 Dispatcher방식으로 보낼때 시작하는 폴더가 다릅니다. Redirect방식은
		 * 클라이언트에게 넘겨줘서 클라이언트가 다시 다른 사이트로 가므로 프로젝트에서 가장 밖? 에서 접근하므로
		 * contextPath부터 시작함니다
		 * 
		 * Dispatcher방식은 바로 서버에서 바로 다른 페이지를 열어주므로 어노테이션 혹은 xml페이지에서 설정해줬던 경로에서 그
		 * 페이지를 열게됩니다. ex) @WebServlet({"/ex/*"}) 이거였으므로 WebContent 폴더 안에 ex폴더에서
		 * 다른 페이지를 연다고 생각하심될듯.
		 */
		forward.setPath("../example/dispatcherResult.jsp");
		return forward;
	}

}
