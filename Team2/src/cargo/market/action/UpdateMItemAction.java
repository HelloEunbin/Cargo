package cargo.market.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_itemDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class UpdateMItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String item = request.getParameter("item");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		int price = Integer.parseInt(request.getParameter("price"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		
		M_itemDTO idto = new M_itemDTO(price, stock, item, name, category);
		MarketDAO dao = new MarketDAO();
		
		dao.updateMItem(idto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/mk/show_items.do");
		return forward;
	}

}
