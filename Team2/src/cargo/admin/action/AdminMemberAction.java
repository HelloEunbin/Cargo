package cargo.admin.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cargo.admin.DAO.AdminDAO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class AdminMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		AdminDAO dao = new AdminDAO();
		request.setAttribute("list", dao.getMembersTable());
		request.setAttribute("updateTime", new Date());
		
		ActionForward forward = new ActionForward();
		forward.setAjax(false);
		forward.setRedirect(false);
		forward.setPath("../admin/member_admin.jsp");
		
		return forward;
	}

}
