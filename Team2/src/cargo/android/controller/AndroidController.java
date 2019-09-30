package cargo.android.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.android.action.And_Admin_ExtendAction;
import cargo.android.action.And_Admin_MemberAction;
import cargo.android.action.And_Admin_ReleaseItemAction;
import cargo.android.action.And_Admin_StatusAction;
import cargo.android.action.And_Admin_WarehousingCheckAction;
import cargo.android.action.And_ExtendAction;
import cargo.android.action.And_LoginAction;
import cargo.android.action.And_StatusAction;

public class AndroidController extends HttpServlet {
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

		System.out.println("=============== Android ==============");
		// 가상요청 주소 가져오기
		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI: " + RequestURI);
		String command = RequestURI.substring(RequestURI.lastIndexOf("/"));
		System.out.println("command: " + command);

		try {
			if (command.equals("/login")) { // 로그인
				new And_LoginAction().execute(request, response);;
			} else if (command.equals("/status")) { // [회원] 보관,완료/예약
				new And_StatusAction().execute(request, response);
			} else if (command.equals("/extend")) { // [회원] 연장
				new And_ExtendAction().execute(request, response);
			} else if (command.equals("/admin_status")) { // [관리자] 창고 현황 (보관,연체/예약/종료)
				new And_Admin_StatusAction().execute(request, response);
			} else if (command.equals("/admin_extend")) { // [관리자] 연장
				new And_Admin_ExtendAction().execute(request, response);
				
				//관리자 컨트롤러는 세션값 확인 안되기 때문에 따로 빼둠
			} else if (command.equals("/admin_release_check")) { // [관리자] 창고에서 빼기전에 언제 반환하는지 체크
				new And_Admin_ReleaseItemAction().execute(request, response);
			} else if (command.equals("/admin_warehousing_check")) { // [관리자] 예약된 물건을 창고에 넣기 전 체크
				new And_Admin_WarehousingCheckAction().execute(request, response);
			} else if (command.equals("/admin_member")) { // [관리자] 회원 열람
				new And_Admin_MemberAction().execute(request, response);
			} 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		System.out.println("=====================================");
	}
}
