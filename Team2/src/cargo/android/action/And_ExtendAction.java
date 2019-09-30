package cargo.android.action;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import cargo.admin.DTO.AdminDTO;
import cargo.common.DTO.MemberDTO;
import cargo.common.action.Action;
import cargo.member.DAO.MemberDAO;
import cargo.reservation.DAO.ReservationDAO;

public class And_ExtendAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String email = request.getParameter("email");
		String category = request.getParameter("category");
		String index = request.getParameter("index");
		
		MemberDAO mdao = new MemberDAO();
		ArrayList<AdminDTO> list = mdao.memberStatus(email, category);
		
		ReservationDAO rdao = new ReservationDAO();
		AdminDTO adto = list.get(Integer.parseInt(index));
		
		HttpSession session = request.getSession();
		MemberDTO mdto = mdao.getMember(email);
		
		session.setAttribute("mdto", mdto);
		request.setAttribute("dto", adto);
		request.setAttribute("maxDate", rdao.getMaxDateCalendar(adto.getEnd_day().toString(), adto.getHouse()));
		request.setAttribute("price", rdao.rsPayment(adto.getHouse()));
		
		if("예약".equals(adto.getState())){
			request.setAttribute("state", "reservation");
		}else{
			request.setAttribute("state", "items");
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("../reservation/reserveExtend.jsp");
		dispatcher.forward(request, response);
	}
}
