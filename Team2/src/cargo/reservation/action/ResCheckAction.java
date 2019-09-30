package cargo.reservation.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.reservation.DAO.ReservationDAO;

public class ResCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String house = request.getParameter("house");
		Timestamp start_day = Timestamp.valueOf(request.getParameter("start_day")+" 00:00:00");
		Timestamp end_day = Timestamp.valueOf(request.getParameter("end_day")+" 00:00:00");
		
		ReservationDAO rsdao1 = new ReservationDAO();
		
		long diffSec = (end_day.getTime() - start_day.getTime())/1000 ;       
		long total = diffSec/(60 * 60 * 24); 
		
		System.out.println("일수 = " + total);  
		int payment = (int)total * rsdao1.rsPayment(house);
        
        request.setAttribute("totalDay", total);
		request.setAttribute("payment", payment);
		
        
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setAjax(false);
		
		forward.setPath("../reservation/reservation_pay.jsp");
		return forward;
	}

}
