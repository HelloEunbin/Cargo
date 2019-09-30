package cargo.market.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_itemDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class AddItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MarketDAO dao = new MarketDAO();
		M_itemDTO idto = new M_itemDTO();
		
		idto.setCategory(request.getParameter("category"));
		idto.setName(request.getParameter("name"));
		idto.setStock(Integer.parseInt(request.getParameter("stock")));
		idto.setPrice(Integer.parseInt(request.getParameter("price")));
		idto.setItem(dao.makeItemID(idto.getCategory()));
		
		dao.insertMItem(idto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/mk/show_items.do");
		return forward;
	}

}
