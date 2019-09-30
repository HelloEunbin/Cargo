package cargo.example;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;

//xml에서 /ex/*면 이곳으로 이동하게 하였음. 가상의 WebContent 폴더 안에 ex폴더를 만들었다고 보시면 됩니다요...
public class ExampleController extends HttpServlet {
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

		//가상요청 주소 가져오기
		String RequestURI=request.getRequestURI();
		System.out.println(RequestURI);
		
		String contextPath=request.getContextPath();
		System.out.println(contextPath.length());
		System.out.println(RequestURI.lastIndexOf("/"));
		
//		System.out.println("??: "+request.getPathInfo()); xml로 했을땐 안되는듯?!
		
//		String command=RequestURI.substring(contextPath.length()); //이건 선생님이 한것
		
		//이부분은 xml필터링을 *.me로 하지 않고 /폴더/*로 하였기 때문에 제가 바꾼것입니다.
		//그런데 /폴더/*로 하는게 관리하기 더 편하지 않나요? 겹치지도 않고 contextPath.length도 쓰지 않음
		String command=RequestURI.substring(RequestURI.lastIndexOf("/"));
		System.out.println(command);
		
		ActionForward forward = null;
		Action action= null;
		
		try {
			if(command.equals("/dispatcher.ex")){
				action=new ExampleDispatcherAction();
				forward = action.execute(request, response);
			}else if(command.equals("/sendRedirect.ex")){
				action= new ExampleSendRedirectAction();
				forward = action.execute(request, response);
			}else if(command.equals("/ajax.ex")){
				action = new ExampleAjaxAction();
				forward = action.execute(request, response);
				System.out.println("ajax!");
			}else{
				System.out.println("이곳은 예시 컨트롤러 입니다... 돌아가세요..!");
			}
			
			//모든 과정 후 페이지 이동부분
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
