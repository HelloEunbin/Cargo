package cargo.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.board.DAO.BoardnDAO;
import cargo.common.DTO.BoardnDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class NoticeModifyFromAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int no=0;
		
		if(request.getParameter("no") == null) {
		    response.sendRedirect(request.getContextPath()+"/bo/NoticeListAction.bo");
		}else {
		   no = Integer.parseInt(request.getParameter("no"));
		     
		    BoardnDAO bnDAO = new BoardnDAO();
			BoardnDTO bnDTO = bnDAO.getBoardn(no);
			request.setAttribute("bnDTO", bnDTO);
			
			ActionForward forward = new ActionForward();	
			forward.setPath("../board/NoticeModify.jsp");  
			
			return forward;
		
	}
		return null;
 
	}
}