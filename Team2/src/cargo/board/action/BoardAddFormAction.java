package cargo.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class BoardAddFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//한글깨짐 방지를 위한 인코딩 방식 설정
		request.setCharacterEncoding("utf-8");
		
		/*BoardqDTO bqDTO = new BoardqDTO();
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int secret = Integer.parseInt(request.getParameter("secret"));
		Timestamp date = Timestamp.valueOf(request.getParameter("date"));
		
		
		bqDTO.setEmail(email);
		bqDTO.setSubject(subject);
		bqDTO.setContent(content);
		bqDTO.setSecret(secret);
		bqDTO.setDate(date);
		
		
		BoardqDAO bqDAO = new BoardqDAO();
		int no = bqDAO.AddBoardq(bqDTO);*/
		
		ActionForward forward = new ActionForward();
		forward.setPath("../board/QuestionAdd.jsp");
		return forward;
	}

}
