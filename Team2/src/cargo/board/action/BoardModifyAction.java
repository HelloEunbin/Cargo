package cargo.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.board.DAO.BoardqDAO;
import cargo.common.DTO.BoardqDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class BoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		if (request.getParameter("no") == null) {
			response.sendRedirect(request.getContextPath()+"/bo/QuestionListAction.bo");
		}else {
			int no = Integer.parseInt(request.getParameter("no"));
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			int secret = Integer.parseInt(request.getParameter("secret"));
			
			BoardqDTO bqDTO = new BoardqDTO();
			bqDTO.setNo(no);
			bqDTO.setSubject(subject);
			bqDTO.setContent(content);
			bqDTO.setSecret(secret);
			BoardqDAO bqDAO = new BoardqDAO();
			bqDAO.updateBoard(bqDTO);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("QuestionViewAction.bo?no="+no);
			return forward;
			
			
			
		}
		
		
		
		return null;
	}

}
