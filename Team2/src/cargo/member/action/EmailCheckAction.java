package cargo.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.MemberDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;

public class EmailCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String email = request.getParameter("email");
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMember(email);
		
		ActionForward forward = new ActionForward();
		forward.setAjax(true); //ajax 방식이기 때문에 무조건 true
		
		if(mdto.getEmail() != null){
			response.getWriter().println(1); //이메일 존재함
		}else{
			response.getWriter().println(0); //이메일 존재하지 않음
		}
		
		return forward;
	}

}
