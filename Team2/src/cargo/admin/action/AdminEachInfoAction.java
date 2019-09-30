package cargo.admin.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.admin.DAO.AdminDAO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class AdminEachInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		/*Breadcrumbs에 나타낼 내용 넣어주는 겁니다
		 * Breadcrumbs없에면 되지만 어차피 table별 구분자가 필요하고 
		 * 나타내주면 좋은거 같아서 살렸어요
		 *  */
		String category = request.getParameter("category");
		String currntPage ="";
		if("reservation".equals(category)) currntPage="예약 내역 관리";
		else if("items".equals(category)) currntPage="창고 현황 관리";
		else if("closed".equals(category)) currntPage="종료된 보관 기록 열람";
			
		AdminDAO dao = new AdminDAO();
		request.setAttribute("list", dao.getTables(category));
		request.setAttribute("currntPage", currntPage);
		request.setAttribute("updateTime", new Date());
		
		ActionForward forward = new ActionForward();
		forward.setAjax(false);
		forward.setRedirect(false);
		forward.setPath("../admin/listTables.jsp");
		
		return forward;
	}
}
