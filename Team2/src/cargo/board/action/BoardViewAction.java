package cargo.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.board.DAO.BoardqDAO;
import cargo.common.DTO.BoardqDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;


public class BoardViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int no = 0;
		String pageNum = request.getParameter("pageNum");
		if(request.getParameter("no") == null) {
		    response.sendRedirect(request.getContextPath()+"/bo/QuestionListAction.bo");
		} else {
		    no = Integer.parseInt(request.getParameter("no"));
		    
		    BoardqDAO bqDAO = new BoardqDAO();
		    BoardqDTO bqDTO = bqDAO.getBoardq(no);
		    
		    request.setAttribute("bqDTO", bqDTO);
		    request.setAttribute("pageNum", pageNum);
		ActionForward forward = new ActionForward();	
		   
			forward.setPath("../board/QuestionView.jsp");
			return forward;
		
	}
		return null;
 
	}
}
