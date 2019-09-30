package cargo.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;

public class LeaveMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String email = request.getParameter("email");
		String pwd = request.getParameter("currentPwd");

		MemberDAO mdao = new MemberDAO();
		int state = mdao.deleteMember(email, pwd);
		
		ActionForward forward = null;
		
		if (state == 0) { // 실패했을 때
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('보관 또는 예약하신 내역이 있어 탈퇴 처리가 되지 않습니다. \\n내역을 다시 한 번 확인해 주시기 바랍니다.');");
			out.println("history.back();");
			out.print("</script>");

			out.close();
			
			return null;
		} else if (state == -1) { // 비밀번호가 다를 때
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('비밀번호가 틀려 탈퇴 처리가 되지 않습니다. \\n비밀번호를 다시 한 번 확인해 주시기 바랍니다.');");
			out.println("history.back();");
			out.print("</script>");

			System.out.println("aaa");
			out.close();
			
			return null;
		} else { // 성공했을 때
			forward =  new ActionForward();
			forward.setRedirect(true);
			
			HttpSession session = request.getSession(); //탈퇴했기 때문에 session값도 없앰
			session.removeAttribute("mdto");
			
			String path = request.getContextPath();
			forward.setPath(path+"/co/index.go");
		}
		return forward;
	}

}
