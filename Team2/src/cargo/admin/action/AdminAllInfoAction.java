package cargo.admin.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.admin.DAO.AdminDAO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class AdminAllInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		AdminDAO dao = new AdminDAO();
		/*3태이블 and member join해서 모든 정보를 가져온다.*/
		request.setAttribute("list", dao.getTables());
		request.setAttribute("updateTime", new Date());
		ActionForward forward = new ActionForward();
		forward.setAjax(false);
		forward.setRedirect(false);
		forward.setPath("../admin/admin_index.jsp");
		
		return forward;
	}

}
