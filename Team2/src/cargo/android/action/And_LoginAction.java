package cargo.android.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cargo.common.DTO.MemberDTO;
import cargo.member.DAO.MemberDAO;

public class And_LoginAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		MemberDAO mdao = new MemberDAO();
		int state = mdao.LoginMember(email, pwd);
		
		if(state==1){
			MemberDTO mdto = mdao.getMember(email);
			if(mdto.getAdmin() == 1)
				state = 4; //회원이면서 관리자일 경우 state=4
		}
		
		response.getWriter().print(state);
	}
}
