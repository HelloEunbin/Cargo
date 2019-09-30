package cargo.admin.action;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.admin.DAO.AdminDAO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class AdminShowChartsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		AdminDAO dao = new AdminDAO();
		Map<String, String> chartInfo = dao.getChartInfos();
		
		request.setAttribute("updateTime", new java.util.Date());
		request.setAttribute("chartInfo", chartInfo);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("../admin/charts.jsp");
		return forward;
	}

}