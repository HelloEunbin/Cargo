package cargo.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.board.action.BoardAddAction;
import cargo.board.action.BoardAddFormAction;
import cargo.board.action.BoardDelAction;
import cargo.board.action.BoardListAction;
import cargo.board.action.BoardModifyAction;
import cargo.board.action.BoardModifyFormAction;
import cargo.board.action.BoardReplayAction;
import cargo.board.action.BoardReplayFormAction;
import cargo.board.action.BoardSearchAction;
import cargo.board.action.BoardViewAction;
import cargo.board.action.FAQAction;
import cargo.board.action.NoticeAddAction;
import cargo.board.action.NoticeAddFormAction;
import cargo.board.action.NoticeDelAction;
import cargo.board.action.NoticeListAction;
import cargo.board.action.NoticeModifyAction;
import cargo.board.action.NoticeModifyFromAction;
import cargo.board.action.NoticeSearchAction;
import cargo.board.action.NoticeViewAction;
import cargo.board.action.ViewMapAction;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

public class BoardController extends HttpServlet{
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
		
		//가상요청 주소 가져오기
				String RequestURI=request.getRequestURI();				
				
				System.out.println(RequestURI.lastIndexOf("/"));
				String command=RequestURI.substring(RequestURI.lastIndexOf("/"));
				System.out.println(command);
				
				ActionForward forward = null;
				Action action= null;
		
			try {
				
		// Question 시작
			if (command.equals("/QuestionAddForm.bo")) {
				action = new BoardAddFormAction();
				forward=action.execute(request, response);
			}else if (command.equals("/BoardAddAction.bo")) {
				action = new BoardAddAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/QuestionListAction.bo")) {
				action = new BoardListAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/QuestionViewAction.bo")) {
					action = new BoardViewAction();
					try {
						forward=action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
			}else if (command.equals("/QuestionModifyFormAction.bo")) {
						action = new BoardModifyFormAction();
						try {
							forward=action.execute(request, response);
						} catch (Exception e) {
							e.printStackTrace();
						}
					
			}else if (command.equals("/QuestionModifyAction.bo")) {
				action = new BoardModifyAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/QuestionDelAction.bo")) {
				action = new BoardDelAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/QuestionReplayFormAction.bo")) {
				action = new BoardReplayFormAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/QuestionReplayAction.bo")) {
				action = new BoardReplayAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/QuestionSearchAction.bo")) {
					action = new BoardSearchAction();
					try {
						forward=action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
			}else if (command.equals("/FAQ.bo")) {
				action = new FAQAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
				//-------------------------------Notice	시작
			}else if (command.equals("/NoticeAddFormAction.bo")) {
				action = new NoticeAddFormAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/NoticeAddAction.bo")) {
				action = new NoticeAddAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/NoticeListAction.bo")) {
				action = new NoticeListAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/NoticeViewAction.bo")) {
				action = new NoticeViewAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/NoticeModifyFormAction.bo")) {
				action = new NoticeModifyFromAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/NoticeModifyAction.bo")) {
				action = new NoticeModifyAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/NoticeDelAction.bo")) {
				action = new NoticeDelAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/NoticeSearchAction.bo")) {
				action = new NoticeSearchAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if (command.equals("/ViewMap.bo")) {
				action = new ViewMapAction();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		
			
			
			
			
			//글쓰기 - 리스트 - 글상세보기 - 글수정 - 글삭제-
		
			
			
			
				if(forward !=null){
					if(forward.isAjax()){
						//Ajax방식이였으면 이동시키지 말아야합니다.
					}else if(forward.isRedirect()){
						//sendRedirect 방식으로 보내는 경우
						response.sendRedirect(forward.getPath());
					}else{
						//Dispatcher방식으로 보낼 때 forwarding 해준다
						RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
						dispatcher.forward(request, response);
					}
				}
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			
		}

	}

	
	

