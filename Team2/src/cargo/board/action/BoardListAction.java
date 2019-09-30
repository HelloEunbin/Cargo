package cargo.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.board.DAO.BoardqDAO;
import cargo.common.DTO.BoardqDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
		    currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
       
        
		BoardqDAO bdDAO = new BoardqDAO();
		int totalRowCount = bdDAO.getQuestionCount();
		int pagePerRow = 10;
		
		ArrayList<BoardqDTO> list = bdDAO.getQuestionList(currentPage, pagePerRow);
		// 현재페이지currentPage  총 열 개수totalRowCount  페이지당행 pagePerRow 마지막페이지lastPage
		int lastPage = totalRowCount/pagePerRow;
	    if(totalRowCount % pagePerRow != 0) {
	        lastPage++;
	    }
	    request.setAttribute("totalRowCount", totalRowCount);
	    request.setAttribute("currentPage", currentPage);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("list", list);
	    
		
	    ActionForward forward = new ActionForward();	
	   
		forward.setPath("../board/Question.jsp");
		return forward;
	}

}
