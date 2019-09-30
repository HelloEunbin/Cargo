package cargo.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.admin.action.AdminAllInfoAction;
import cargo.admin.action.AdminDelReservAction;
import cargo.admin.action.AdminEachInfoAction;
import cargo.admin.action.AdminExtendReservAction;
import cargo.admin.action.AdminItemsToClosedAction;
import cargo.admin.action.AdminMemberAction;
import cargo.admin.action.AdminModalAction;
import cargo.admin.action.AdminMoveToOverdueAction;
import cargo.admin.action.AdminEnterOverdueLocationAction;
import cargo.admin.action.AdminOverdueAction;
import cargo.admin.action.AdminReleaseItemAction;
import cargo.admin.action.AdminReservToItemsAction;
import cargo.admin.action.AdminShowChartsAction;
import cargo.admin.action.AdminwarehousingCheckAction;
import cargo.common.DTO.MemberDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;


public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("------------------ADMIN------------------");
		
		String contextPath=request.getContextPath();
		
		//가상요청 주소 가져오기
		String RequestURI=request.getRequestURI();
		System.out.println("RequestURI: "+RequestURI);

		
		String command=RequestURI.substring(RequestURI.lastIndexOf("/"));
		System.out.println("command: "+command);
		
		ActionForward forward = null;
		Action action= null;
		
		//세션영역에서 로그인 정보 얻기
		int admin =0;
		if(request.getSession().getAttribute("mdto") != null){
			MemberDTO mdto = (MemberDTO) request.getSession().getAttribute("mdto");
			admin = mdto.getAdmin();
		}
		
		try {
			
			//filter 역할! 관리자가 아니면 index.jsp로 이동.
			if(admin == 0){
				System.out.println("관리자가 아님! 잘못된 접근");
				
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(contextPath+"/start.jsp");
			
			//관리자 메인 페이지
			}else  if("/admin_main".equals(command)){
				action = new AdminAllInfoAction();
				forward = action.execute(request, response);
				
			//각 상세 페이지 (예약, 창고 현황,  완료)
			}else if("/listTables".equals(command)){
				action = new AdminEachInfoAction();
				forward = action.execute(request, response);
			
			//맴버 관리 페이지
			}else if("/member_admin".equals(command)){
				action = new AdminMemberAction();
				forward = action.execute(request, response);
			
			//연체 관리 페이지
			}else if("/overdue_admin".equals(command)){
				action = new AdminOverdueAction();
				forward = action.execute(request, response);
			
			//모달로 데이터를 뿌려주는 경우
			}else if("/modal_data".equals(command)){
				action = new AdminModalAction();
				forward = action.execute(request, response);
			
			//모달에서 예약 연장 버튼을 눌렀을 경우
			}else if("/extend_reserv".equals(command)){
				action = new AdminExtendReservAction();
				forward = action.execute(request, response);
			
			//예약된 물건을 창고에 넣기 전 체크!
			}else if("/warehousing_check".equals(command)){
				action = new AdminwarehousingCheckAction();
				forward = action.execute(request, response);
			
			//예약 -> 창고
			}else if("/reserve_to_items".equals(command)){
				action = new AdminReservToItemsAction();
				forward = action.execute(request, response);
				
			//예약 start날짜에 안들어 왔을 경우 삭제하기
			}else if("/delete_reservation".equals(command)){
				action = new AdminDelReservAction();
				forward = action.execute(request, response);
				
			//창고에서 빼기 전에 언제 반환 하는지 체크
			}else if("/release_check".equals(command)){
				action = new AdminReleaseItemAction();
				forward = action.execute(request, response);
				
			//창고 -> closed
			}else if("/item_to_closed".equals(command)){
				action = new AdminItemsToClosedAction();
				forward = action.execute(request, response);
			
			//어느 연체 보관 창고에 보관할지 선택
			}else if("/enter_overdue_location".equals(command)){
				action = new AdminEnterOverdueLocationAction();
				forward = action.execute(request, response);
				
			//연체 보관 창고로 옮기기
			}else if("/move_to_overdue".equals(command)){
				action = new AdminMoveToOverdueAction();
				forward =action.execute(request, response);
				
			//chart에 필요한 정보 가져오기
			}else if("/show_charts".equals(command)){
				action =new AdminShowChartsAction();
				forward = action.execute(request, response);
			}
			
			
			//모든 과정 후 페이지 이동부분
			if(forward !=null){
				if(forward.isAjax()){
					//Ajax방식이였으면 이동시키지 말아야합니다.
					System.out.println("ajax");
				}else if(forward.isRedirect()){
					//sendRedirect 방식으로 보내는 경우
					System.out.println("sendRedirect");
					response.sendRedirect(forward.getPath());
				}else{
					//Dispatcher방식으로 보낼 때 forwarding 해준다
					System.out.println("Dispatcher");
					RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}else{
				System.out.println("There is no forward...WHAT?!");
			}
			
		} catch (Exception e) {
			System.out.println("AdminController err: "+e.getMessage());
			e.printStackTrace();
		}
		System.out.println("-----------------------------------------\n");
	}

}
