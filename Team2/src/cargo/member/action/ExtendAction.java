package cargo.member.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cargo.admin.DTO.AdminDTO;
import cargo.common.DTO.MemberDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;
import cargo.reservation.DAO.ReservationDAO;

public class ExtendAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		request.setCharacterEncoding("utf-8");
		
		String category = request.getParameter("category");
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");
		
		MemberDAO mdao = new MemberDAO();
		ArrayList<AdminDTO> list = mdao.memberStatus(mdto.getEmail(), category);
		
		ReservationDAO rdao = new ReservationDAO();
		AdminDTO adto = list.get(0);
		
		request.setAttribute("dto", adto);
		request.setAttribute("maxDate", rdao.getMaxDateCalendar(adto.getEnd_day().toString(), adto.getHouse()));
		request.setAttribute("price", rdao.rsPayment(adto.getHouse()));
		if("예약".equals(adto.getState())){
			request.setAttribute("state", "reservation");
		}else{
			request.setAttribute("state", "items");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("/reservation/reserveExtend.jsp");
		
		return forward;
	}

}
