package cargo.member.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cargo.admin.DTO.AdminDTO;
import cargo.common.DTO.MemberDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;

public class MemberStatusAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String category = request.getParameter("category");
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");
		
		MemberDAO mdao = new MemberDAO();
		ArrayList<AdminDTO> list = mdao.memberStatus(mdto.getEmail(), category);
		
		ActionForward forward = new ActionForward();
		
		String currentPage ="";
		
		if(category.equals("status")) {
			currentPage = "사용현황";
		}else if(category.equals("reservation")) {
			currentPage = "예약현황";
		}
		
		request.setAttribute("list", list);
		request.setAttribute("currentPage", currentPage);
		forward.setPath("/member/mypage.jsp?content=memberStatus.jsp");
		
		return forward;
	}

}
