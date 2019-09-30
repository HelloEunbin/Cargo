package cargo.market.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import cargo.common.DTO.BoardDTO;
import cargo.common.DTO.M_boardDTO;
import cargo.common.DTO.M_itemDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class PostItemAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward=new ActionForward();
		
		String uploadPath = request.getRealPath("market/uploaded");
		System.out.println(uploadPath);
		
		int size = 10*1024*1024;
		String item="";
		String title="";
		String content="";
		Timestamp date= new Timestamp(System.currentTimeMillis());
		String imagefile="";
		String originfilename="";
		
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
			
			item = multi.getParameter("item");
			title = multi.getParameter("title");
			content = multi.getParameter("content");
			
			Enumeration files = multi.getFileNames();
			String file1 = (String) files.nextElement();
			
			imagefile = multi.getFilesystemName(file1);
			originfilename = multi.getOriginalFileName(file1);
			
			System.out.println("imagefile "+imagefile);
			System.out.println("originfilename "+originfilename);
			
		}catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		M_boardDTO mdto = new M_boardDTO(date, item, title, content, imagefile);
		MarketDAO mdao = new MarketDAO();
		
		boolean b = mdao.postItem(mdto);
		
		if(b){//디비에 게시물 넣었는지 확인
			
			forward.setRedirect(true);
			forward.setPath(request.getContextPath()+"/mk/market.do");
			
		}else {
			String msg = "게시물 등록에 실패했습니다.";
			PrintWriter out = response.getWriter();
			out.println("<script>alert("+msg+")</script>");
		}
		
		return forward;	
		
	}
	
	
	
}
