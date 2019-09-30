package cargo.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.MemberDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;

public class PwdSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String email = request.getParameter("email");

		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMember(email);

		ActionForward forward = new ActionForward();
		forward.setAjax(true);

		int state = 0; // 0: 실패, 1: 성공, -1: 이메일은 존재하나 메일 발송에 실패한 경우
		if (mdto.getEmail() != null) {
			String newPwd = mdao.newPwd();
			mdto.setPwd(newPwd);
			System.out.println(newPwd);
			state = mdao.updateMember(mdto);
			if (state == 1) { // state: 0이라면 update가 안된 것 -> email존재 X, 1: update 성공
				String subject = "TEAM2_WAREHOUSE 임시 비밀번호 발송";
				String content = mdto.getName() + "님의 " + email + "의 임시 비밀번호는 [<strong>" + newPwd + "</strong>] 입니다. <br> <a href='http://localhost:8090/Team2/index.jsp'>Team2 WAREHOUSE 바로가기</a>"; //나중에 주소 수정해야함
				state = mdao.sendEmail(email, subject, content);
				if(state!=1) {
					response.getWriter().println(-1);
				}
			}
		}
		response.getWriter().println(state);
		return forward;
	}
	
}
