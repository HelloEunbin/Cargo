package cargo.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;

public class ModifyCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		String checkPwd = request.getParameter("checkPwd");
		
		MemberDAO mdao = new MemberDAO();
		int state = mdao.LoginMember(email, checkPwd);
		
		ActionForward forward = null;
		
		if(state == -1) {
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.');");
			out.println("history.back();");
			out.print("</script>");

			System.out.println("로그인 오류 ");
			out.close();
		} else {
			forward = new ActionForward();
			
			request.setAttribute("modifyCheck", 1); //정보 수정 페이지 나타내기
			forward.setPath("/member/mypage.jsp?content=modifyMember.jsp");
		}
		return forward;
	}
}
