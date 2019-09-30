package cargo.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.board.DAO.BoardqDAO;
import cargo.common.DTO.BoardqDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class BoardReplayFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int no;		
		if(request.getParameter("no") == null) {
		    response.sendRedirect(request.getContextPath()+"/bo/QuestionListAction.bo");
		}else {
			
			no = Integer.parseInt(request.getParameter("no"));
			BoardqDAO bqDAO = new BoardqDAO();
			BoardqDTO bqDTO = bqDAO.getBoardq(no);
			request.setAttribute("bqDTO", bqDTO);
			
			ActionForward forward = new ActionForward();
			forward.setPath("../board/QuestionReplay.jsp");
			return forward;
		}
		return null;
		
	}

	}