package cargo.reservation.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cargo.common.DTO.ItemsDTO;
import cargo.common.DTO.ReservationDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.reservation.DAO.ReservationDAO;

public class ResApplyAction implements Action{
	
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	request.setCharacterEncoding("UTF-8");

	
	ActionForward forward = new ActionForward();
	forward.setRedirect(false);
	forward.setAjax(false);
	
	SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
    String today = formatter.format(new java.util.Date());
    
    
    String house = request.getParameter("house");
    ReservationDAO dao = new ReservationDAO();
    

    request.setAttribute("res_day", today);
    
	
	ArrayList<ItemsDTO> rList = dao.getCurReservation(house);
	ArrayList<ReservationDTO> rList2 = dao.getReservation(house);
	
	request.setAttribute("rList", rList);
    request.setAttribute("rList2", rList2);
	
	
	forward.setPath("../reservation/reservation_apply.jsp");
	return forward;
	}

}
