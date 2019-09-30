package cargo.reservation.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.reservation.DAO.ReservationDAO;

public class ResPayExtendAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String state = request.getParameter("state");
		ArrayList<String> primary = new ArrayList<>();
		
		if("reservation".equals(state)){
			primary.add("num");
			primary.add(request.getParameter("num"));
		}else{
			primary.add("item");
			primary.add(request.getParameter("item"));
		}
		
		String end_day = request.getParameter("end_day");
		String payment = request.getParameter("payment");
		
		ReservationDAO dao = new ReservationDAO();
		request.setAttribute("result", dao.extendEnd_day(state, end_day, payment, primary));
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("../reservation/reserveExtend_payconfirm.jsp");
		return forward;
	}

}
