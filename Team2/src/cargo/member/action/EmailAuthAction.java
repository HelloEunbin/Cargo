package cargo.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;

public class EmailAuthAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String to_email = request.getParameter("email");

		MemberDAO mdao = new MemberDAO();
		String authNum = mdao.randomNum();
		String subject = "TEAM2_WAREHOUSE 이메일 인증";
		String content = "인증번호는 [" + authNum + "] 입니다.0o";
		int state = mdao.sendEmail(to_email, subject, content);

		ActionForward forward = new ActionForward();
		forward.setAjax(true); // ajax 방식이기 때문에 무조건 true

		JSONObject obj = new JSONObject();
		obj.put("state", state);
		obj.put("authNum", authNum);

		System.out.println(obj);

		response.getWriter().println(obj.toJSONString());

		return forward;
	}
}
