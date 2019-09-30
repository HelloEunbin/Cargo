package cargo.market.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.action.AddItemAction;
import cargo.market.action.DelCartAction;
import cargo.market.action.MainpageAction;
import cargo.market.action.AddCartAction;
import cargo.market.action.AddCommentAction;
import cargo.market.action.MarketMainAction;
import cargo.market.action.OrderCartAction;
import cargo.market.action.OrderConfirmAction;
import cargo.market.action.OrderInfoAction;
import cargo.market.action.OrderItemAction;
import cargo.market.action.PostItemAction;
import cargo.market.action.ShowContentAction;
import cargo.market.action.ShowItemsAction;
import cargo.market.action.UpdateMItemAction;
import cargo.market.action.UploadPageAction;
import cargo.market.action.deleteItemAction;
import cargo.market.action.deleteMItemAction;
import cargo.market.action.modifyItemAction;
import cargo.market.action.modifyViewAction;

public class MarketController extends HttpServlet{
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
		
		System.out.println("-------------------MARKET-------------------");
		
		String RequestURI = request.getRequestURI();
		String command = RequestURI.substring(RequestURI.lastIndexOf("/"));
		
		System.out.println("RequestURI: "+RequestURI);
		System.out.println("command: "+command);
		
		ActionForward forward = null;
		Action action= null;
		
		System.out.println(command);
		
		try {
			
			if(command.equals("/market.do")){	// 메인페이지로 이동 - DB작업수정해야함
				action = new MarketMainAction();
				forward = action.execute(request, response);
			}else if(command.equals("/uploadpage.do")){	// 글쓰기 페이지로 이동
				action = new UploadPageAction();
				forward = action.execute(request, response);
			}else if(command.equals("/cart.do")){	// 장바구니 페이지로 이동
				forward = new ActionForward();
				forward.setPath("../market/market_cart.jsp");
			}else if(command.equals("/showcontent.do")){	// 상세글보기 페이지로 이동 - DB작업해서 뿌리는걸로 수정, 글번호 넘겨야함
				action = new ShowContentAction();
				forward = action.execute(request, response);
			}else if(command.equals("/postItem.do")){ // ${contextPath }/mk/postItem.do 글쓰기 + 파일업로드 액션
				action = new PostItemAction();
				forward = action.execute(request, response);
			}else if(command.equals("/modifyView.do")){ // 글 수정 화면으로 이동
				action = new modifyViewAction();
				forward = action.execute(request, response);
			}else if(command.equals("/modifyItem.do")){ // 글 수정
				action = new modifyItemAction();
				forward = action.execute(request, response);
			}else if(command.equals("/deleteItem.do")){ // 글 삭제
				action = new deleteItemAction();
				forward = action.execute(request, response);
			}else if(command.equals("/addComment.do")){ // 댓글 등록
				action = new AddCommentAction();
				forward=action.execute(request, response);
			}else if("/show_items.do".equals(command)){// M_item select
				action = new ShowItemsAction();
				forward = action.execute(request, response);
			}else if("/add_item.do".equals(command)){// add item into M_item
				action = new AddItemAction();
				forward = action.execute(request, response);
			}else if("/modi_item.do".equals(command)){// update M_item
				action = new UpdateMItemAction();
				forward = action.execute(request, response);
			}else if("/del_item.do".equals(command)){// delete M_item
				action = new deleteMItemAction();
				forward = action.execute(request, response);
			}else if(command.equals("/addCart.do")){
	        	action = new AddCartAction();
	        	forward = action.execute(request, response);
	        }else if(command.equals("/delCart.do")){
	        	action = new DelCartAction();
	        	forward = action.execute(request, response);
	        }else if(command.equals("/payCart.do")){
	        	forward = new ActionForward();
				forward.setPath("../market/market_dopay.jsp");
	        }else if(command.equals("/orderCart.do")){
	        	action = new OrderCartAction();
	        	forward = action.execute(request, response);
	        }else if(command.equals("/payItem.do")){
	        	forward = new ActionForward();
				forward.setPath("../market/market_dopay2.jsp");
	        }else if(command.equals("/orderItem.do")){
	        	action = new OrderItemAction();
	        	forward = action.execute(request, response);
	        }else if(command.equals("/confirmOrder.do")){
	        	action = new OrderConfirmAction();
	        	forward = action.execute(request, response);
	        }else if(command.equals("/orderInfo.do")){
	        	action = new OrderInfoAction();
	        	forward = action.execute(request, response);
	        }
      
			//모든 과정 후 페이지 이동부분
			if(forward !=null){
				if(forward.isAjax()){
					//Ajax방식이였으면 이동시키지 말아야합니다.
					System.out.println("Ajax!");
				}else if(forward.isRedirect()){
					//sendRedirect 방식으로 보내는 경우
					response.sendRedirect(forward.getPath());
					System.out.println("sendRedirect");
				}else{
					//Dispatcher방식으로 보낼 때 forwarding 해준다
					RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
					System.out.println("dispatch");
				}
			}else{
				System.out.println("There is no forward...WHAT?!");
			}
			
		} catch (Exception e) {
			System.out.println("MarketController 에러: " + e.getMessage());
			e.printStackTrace();
		}
		System.out.println("--------------------------------------------\n");
	}

}
