package cargo.admin.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.JSONParser;

import cargo.admin.DAO.AdminDAO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class AdminDelReservAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		AdminDAO dao = new AdminDAO();
		String jsonString = request.getParameter("result");
		
		JSONParser ps = new JSONParser();
		
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) ps.parse(jsonString);
		int num = Integer.parseInt(String.valueOf(map.get("num")));
		
		System.out.println("reservation primary key: "+num);
		
		dao.deleteResevation(num);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/ad/listTables?category=reservation");
		return forward;
	}

}
