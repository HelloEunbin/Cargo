package cargo.admin.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.admin.DAO.AdminDAO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class AdminItemsToClosedAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Date return_day = Date.valueOf(request.getParameter("return_day"));
		String item = request.getParameter("item");
		System.out.println(item+" is returned on "+return_day);
		
		AdminDAO dao = new AdminDAO();
		dao.itemsToClosed(return_day, item);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/ad/listTables?category=closed");
		return forward;
	}

}
