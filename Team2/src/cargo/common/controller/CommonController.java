package cargo.common.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.action.MainpageAction;

public class CommonController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String RequestURI = request.getRequestURI();
		String command = RequestURI.substring(RequestURI.lastIndexOf("/"));
		
		ActionForward forward = null;
		Action action = null;
		
		System.out.println(command);
		
		try {
			
			if("/index.go".equals(command)){ // Team2/co/index.go --> 인덱스이동
				action = new MainpageAction();
				forward = action.execute(request, response);
			}else if("/login.go".equals(command)){ // 인덱스(모달창바로띄우는)
				action = new MainpageAction();
				forward = action.execute(request, response);
			}else if("/information.go".equals(command)){
				forward = new ActionForward();
				forward.setPath("../company/information.jsp");
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
	}
}