package cargo.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.action.EmailAuthAction;
import cargo.member.action.EmailCheckAction;
import cargo.member.action.EmailSearchAction;
import cargo.member.action.ExtendAction;
import cargo.member.action.JoinAction;
import cargo.member.action.LoginAction;
import cargo.member.action.ModifyCheckAction;
import cargo.member.action.ModifyMemberAction;
import cargo.member.action.PwdCheckAction;
import cargo.member.action.PwdSearchAction;
import cargo.member.action.LeaveMemberAction;
import cargo.member.action.MemberStatusAction;

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		System.out.println("=============== Member ==============");
		// 가상요청 주소 가져오기
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI: " + RequestURI);
		String command = RequestURI.substring(RequestURI.lastIndexOf("/"));
		System.out.println("command: " + command);

		ActionForward forward = null;
		Action action = null;

		try {
			if (command.equals("/join")) { // 회원 가입
				String join = request.getParameter("join");
				if(join==null){
					forward = new ActionForward();
					forward.setPath("/member/join.jsp");
				}else{
					action = new JoinAction();
					forward = action.execute(request, response);
				}
			} else if (command.equals("/login")) { // 로그인
				action = new LoginAction();
				forward = action.execute(request, response);
			} else if (command.equals("/logout")) { // 로그아웃
				request.getSession().invalidate();
				response.getWriter().print("<script>");
				response.getWriter().print("alert('로그아웃 되었습니다.'); location.href='../co/index.go';");
				response.getWriter().print("</script>");
			} else if (command.equals("/emailAuth")) { // 이메일 인증
				action = new EmailAuthAction();
				forward = action.execute(request, response);
			} else if (command.equals("/emailCheck")) { // 이메일 중복 확인
				action = new EmailCheckAction();
				forward = action.execute(request, response);
			} else if(command.equals("/findMember")){
				forward= new ActionForward();
				String find = request.getParameter("find");
				if(find.equals("email"))
					forward.setPath("/member/findMember.jsp?find=email"); // 이메일 찾기 페이지
				else if(find.equals("pwd"))
					forward.setPath("/member/findMember.jsp?find=pwd"); // 비밀번호 찾기 페이지
			}	else if (command.equals("/emailSearch")) { // 이메일 찾기
				action = new EmailSearchAction();
				forward = action.execute(request, response);
			} else if (command.equals("/pwdSearch")) { // 비밀번호 찾기
				action = new PwdSearchAction();
				forward = action.execute(request, response);
			} else if (command.equals("/pwdCheck")) { // 기존 비밀번호 확인
				action = new PwdCheckAction();
				forward = action.execute(request, response);
			} else if (command.equals("/modifyMember")) { // 회원정보 수정
				String page = request.getParameter("page");
				if(page == null){
					forward = new ActionForward();
					forward.setPath("/member/mypage.jsp?content=modifyMember.jsp");
				}
				else{
					action = new ModifyMemberAction();
					forward = action.execute(request, response);
				}
			} else if (command.equals("/modifyCheck")) { // 회원정보 수정 비밀번호 확인
				action = new ModifyCheckAction();
				forward = action.execute(request, response);
			} else if(command.equals("/mypage")) {
				forward = new ActionForward();
				String category = request.getParameter("category");
				if(category.equals("info")) // 내 정보
					forward.setPath("/member/mypage.jsp");
				else if(category.equals("leave")) // 회원 탈퇴 페이지
					forward.setPath("/member/mypage.jsp?content=leave");
			} else if(command.equals("/leaveMember")) { // 회원 탈퇴
				action = new LeaveMemberAction();
				forward = action.execute(request, response);
			} else if (command.equals("/memberStatus")) { // 마이페이지 현황
				action = new MemberStatusAction();
				forward = action.execute(request, response);
			} else if (command.equals("/extend")) { // 보관 연장
				action = new ExtendAction();
				forward = action.execute(request, response);
				
			}
			

			// 모든 과정 후 페이지 이동부분
			if (forward != null) {
				if (forward.isAjax()) {
					// Ajax방식이였으면 이동시키지 말아야합니다.
				} else if (forward.isRedirect()) {
					// sendRedirect 방식으로 보내는 경우
					response.sendRedirect(forward.getPath());
				} else {
					// Dispatcher방식으로 보낼 때 forwarding 해준다
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		System.out.println("=====================================");
	}
}
