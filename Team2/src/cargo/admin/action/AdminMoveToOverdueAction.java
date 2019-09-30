package cargo.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.admin.DAO.AdminDAO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class AdminMoveToOverdueAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String item = request.getParameter("item");
		String overdue = request.getParameter("overdue");
		
		AdminDAO dao = new AdminDAO();
		dao.updateOverdue(overdue,item);
		
		System.out.println(item+" moved to "+overdue);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/ad/overdue_admin");
		return forward;
	}

}
