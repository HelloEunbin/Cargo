package cargo.example;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class ExampleAjaxAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//ajax로 리턴해줄 값 전달해 주기 위해 josn객체 생성
		JSONObject jobj= new JSONObject();
		//req영역으로 부터 parameter 받아 DTO에 넣어주기
		ExampleDTO edto = new ExampleDTO(Integer.parseInt(request.getParameter("gogo")));
		
		// 디비 작업슥스슥
		//결과값을 response영역에 줍니다
		ExampleDAO edao = new ExampleDAO();
		
		jobj.put("result", edao.exerciseAjax(edto));
		response.setContentType("application/json");
		response.getWriter().println(jobj.toJSONString());
		
		//DB작업을 마쳤으니 이제 어떻게, 어디로 이동할 지 설정해 봅시다.
		ActionForward forward = new ActionForward();
		
		//ajax방식이니 이동없어야함!! 중요!
		forward.setAjax(true);
		
		//기본값이 false이므로 설정할 필요 없겠지만 세팅해줌
		forward.setRedirect(false);
		forward.setPath(null);
		return forward;
	}

}
