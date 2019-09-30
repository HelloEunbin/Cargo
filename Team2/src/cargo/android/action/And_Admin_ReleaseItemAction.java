package cargo.android.action;

import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.JSONParser;

import cargo.admin.DAO.AdminDAO;
import cargo.reservation.DAO.ReservationDAO;

public class And_Admin_ReleaseItemAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		AdminDAO dao = new AdminDAO();
		ReservationDAO rdao = new ReservationDAO();
		String jsonString = request.getParameter("result");
		
		JSONParser ps = new JSONParser();
		
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) ps.parse(jsonString);
		
		//DB 정보가 변한 것은 없는지 DB에서 다시  불러옴
		map = dao.getInfo("items", (String) map.get("item"));
		String house = map.get("item").toString().substring(0, 1);
		
		request.setAttribute("price",rdao.simplepayment(house));
		request.setAttribute("map", map);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("../admin/checkBeforeClosed.jsp");
		dispatcher.forward(request, response);
		
	}
}
