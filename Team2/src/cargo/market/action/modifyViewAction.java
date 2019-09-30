package cargo.market.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_boardJoinDTO;
import cargo.common.DTO.M_itemDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class modifyViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		MarketDAO mdao = new MarketDAO();
		
		M_boardJoinDTO mjdto = mdao.selectJoinItem(no);
		request.setAttribute("mjdto", mjdto);
		
		List<M_itemDTO> idto = mdao.selectAllItems();
		request.setAttribute("itemList", idto);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("../market/market_modify.jsp");
		return forward;	
	
			
	}

	
	
	
	
}
