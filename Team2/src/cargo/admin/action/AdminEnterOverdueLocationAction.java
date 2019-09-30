package cargo.admin.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.JSONParser;

import cargo.admin.DAO.AdminDAO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class AdminEnterOverdueLocationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		AdminDAO dao = new AdminDAO();
		String jsonString = request.getParameter("result");
		JSONParser ps = new JSONParser();
		
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) ps.parse(jsonString);
		
		//DB 정보가 변한 것은 없는지 DB에서 다시  불러옴
		map = dao.getOverdueInfo((String) map.get("item"));
		
		request.setAttribute("map", map);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("../admin/checkBeforeOverdue.jsp");
		return forward;
	}

}
