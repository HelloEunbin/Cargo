package cargo.market.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cargo.common.DTO.M_orderDTO;
import cargo.common.DTO.MemberDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class OrderInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");
		
			
		String email = mdto.getEmail();
		
		MarketDAO mdao = new MarketDAO();
		ArrayList<M_orderDTO> oList = mdao.selectOrderInfo(email);
		request.setAttribute("oList", oList);
			
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("../market/market_orderInfo.jsp");
		
		return forward;
	}

}
