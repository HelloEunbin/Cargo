package cargo.member.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.MemberDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;

public class JoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String email = request.getParameter("email");
		
		int admin;
		if (email.equals("admin"))
			admin = 1;
		else
			admin = 0;
		
		MemberDTO mdto = new MemberDTO(email, request.getParameter("pwd"), request.getParameter("name"), request.getParameter("phone"), 
				Integer.parseInt(request.getParameter("postCode")), request.getParameter("roadAddr"), request.getParameter("detailAddr"), 
				admin, new Timestamp(System.currentTimeMillis()));

		MemberDAO mdao = new MemberDAO();
		int state = mdao.insertMember(mdto);

		ActionForward forward = null;

		if (state == 0) { // 실패했을 때
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('회원 가입을 다시 시도해 주세요');");
			out.println("history.back();");
			out.print("</script>");

			System.out.println(" 회원 가입 오류 ");
			out.close();
			
			return null;
		} else { // 성공했을 때
			forward =  new ActionForward();
			String path = request.getContextPath();
			forward.setRedirect(true);
			
			forward.setPath(path+"/index.jsp");
		}
		return forward;
	}
}
