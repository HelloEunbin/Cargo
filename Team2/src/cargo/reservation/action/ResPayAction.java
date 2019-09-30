package cargo.reservation.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.ReservationDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.reservation.DAO.ReservationDAO;

public class ResPayAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		ReservationDTO rsdto = new ReservationDTO();
		
		String email = request.getParameter("email");
		String house = request.getParameter("house");
		Date start_day = Date.valueOf(request.getParameter("start_day"));
		Date end_day = Date.valueOf(request.getParameter("end_day"));
		Date res_day = Date.valueOf(request.getParameter("res_day"));
		int payment = Integer.parseInt(request.getParameter("payment"));
		
		rsdto.setEmail(email); 
		rsdto.setHouse(house); 
		rsdto.setStart_day(start_day);
		rsdto.setEnd_day(end_day); 
		rsdto.setRes_day(res_day);
		rsdto.setPayment(payment);
		
		ReservationDAO rsdao = new ReservationDAO();
		rsdao.rsCheck(rsdto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setAjax(false);
		forward.setPath("../reservation/reservation_payconfirm.jsp");
		
		return forward;
	}

}
