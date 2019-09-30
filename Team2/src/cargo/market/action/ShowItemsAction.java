package cargo.market.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class ShowItemsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MarketDAO dao = new MarketDAO();
		request.setAttribute("list", dao.selectAllItems());
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("../market/market_add_items.jsp");
		return forward;
	}

}
