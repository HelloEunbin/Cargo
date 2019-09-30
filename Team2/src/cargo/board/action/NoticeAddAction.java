package cargo.board.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.board.DAO.BoardnDAO;
import cargo.common.DTO.BoardnDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class NoticeAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
request.setCharacterEncoding("utf-8");
		
		BoardnDTO bnDTO = new BoardnDTO();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		
		bnDTO.setName(name);
		bnDTO.setEmail(email);
		bnDTO.setSubject(subject);
		bnDTO.setContent(content);
		bnDTO.setDate(new Timestamp (System.currentTimeMillis()));
		

		System.out.println(subject);
		System.out.println(content);
		
		BoardnDAO bnDAO = new BoardnDAO();
		bnDAO.AddBoardn(bnDTO);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/Team2/bo/NoticeListAction.bo");
		return forward;
		
	}

}