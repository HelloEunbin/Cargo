package cargo.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.board.DAO.BoardnDAO;
import cargo.common.DTO.BoardnDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class NoticeModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		if (request.getParameter("no") == null) {
			response.sendRedirect(request.getContextPath()+"/bo/NoticeListAction.bo");
		}else {
			int no = Integer.parseInt(request.getParameter("no"));
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			
			BoardnDTO bnDTO = new BoardnDTO();
			bnDTO.setNo(no);
			bnDTO.setSubject(subject);
			bnDTO.setContent(content);
			BoardnDAO bnDAO = new BoardnDAO();
			bnDAO.updateBoard(bnDTO);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("NoticeViewAction.bo?no="+no);
			return forward;
			
			
			
		}
		
		
		
		return null;
	}

}
