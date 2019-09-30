package cargo.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.board.DAO.BoardnDAO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class NoticeDelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		if (request.getParameter("no") == null) {
			response.sendRedirect(request.getContextPath()+"/bo/NoticeListAction.bo");
		}else {
			int no = Integer.parseInt(request.getParameter("no"));
			BoardnDAO bnDAO = new BoardnDAO();
			bnDAO.delBoard(no);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/Team2/bo/NoticeListAction.bo");
			return forward;
			
		}
		return null;
	}

}
