package cargo.board.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.board.DAO.BoardqDAO;
import cargo.common.DTO.BoardqDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class BoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//한글깨짐 방지를 위한 인코딩 방식 설정
		request.setCharacterEncoding("utf-8");
		
		BoardqDTO bqDTO = new BoardqDTO();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int secret = Integer.parseInt(request.getParameter("secret"));
		
		
		
		bqDTO.setName(name);
		bqDTO.setEmail(email);
		bqDTO.setSubject(subject);
		bqDTO.setContent(content);
		bqDTO.setSecret(secret);
		bqDTO.setDate(new Timestamp (System.currentTimeMillis()));
		

		System.out.println(subject);
		System.out.println(content);
		System.out.println(secret);
		
		
		BoardqDAO bqDAO = new BoardqDAO();
		bqDAO.AddBoardq(bqDTO);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/Team2/bo/QuestionListAction.bo");
		return forward;
		
	}

}
