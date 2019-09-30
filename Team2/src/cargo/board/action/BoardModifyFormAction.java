package cargo.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.board.DAO.BoardqDAO;
import cargo.common.DTO.BoardqDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class BoardModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		int no = 0;
		
		if(request.getParameter("no") == null) {
			forward.setRedirect(true);
			forward.setPath(request.getContextPath()+"/bo/QuestionListAction.bo");
		}else {
			no = Integer.parseInt(request.getParameter("no"));
		    BoardqDAO bqDAO = new BoardqDAO();
			BoardqDTO bqDTO = bqDAO.getBoardq(no);
			
			request.setAttribute("bqDTO", bqDTO);
			forward.setPath("../board/QuestionModify.jsp");  
		}
		
		return forward;
 
	}
}