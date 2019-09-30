package cargo.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.admin.DAO.AdminDAO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class AdminReservToItemsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		AdminDAO dao = new AdminDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		int item_price = Integer.parseInt(request.getParameter("item_price"));
		String item = request.getParameter("item");
		
		System.out.println(num+"  "+item+"  "+item_price);
		
		dao.reservToitems(num, item, item_price);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/ad/listTables?category=items");
		return forward;
	}

}
