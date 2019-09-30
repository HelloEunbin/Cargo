package cargo.reservation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.reservation.DAO.ReservationDAO;

public class SimplePaymentAction implements Action{
	
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	
		JSONObject jobj= new JSONObject();
		
		String house = request.getParameter("house");	
		
		System.out.println(house);
		
		
		ReservationDAO dao = new ReservationDAO();
		
		jobj.put("price", dao.simplepayment(house));
		
		response.setContentType("application/json");
		response.getWriter().println(jobj.toJSONString());
		
		ActionForward forward = new ActionForward();
		
		//ajax방식이니 이동없어야함!! 중요!
		forward.setAjax(true);
		
		//기본값이 false이므로 설정할 필요 없겠지만 세팅해줌
		forward.setRedirect(false);
		return forward;
		
		
	}
}
