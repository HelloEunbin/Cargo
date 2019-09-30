package cargo.market.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import cargo.common.DTO.BoardDTO;
import cargo.common.DTO.M_boardDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class modifyItemAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		MarketDAO mdao = new MarketDAO();
		
		boolean result = false;
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		String uploadPath = request.getRealPath("market/uploaded");
		
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
			String file1 = (String)files.nextElement();
			
			imagefile = multi.getFilesystemName(file1);
			originfilename = multi.getOriginalFileName(file1);
			
			System.out.println("imagefile "+imagefile);
			System.out.println("originfilename "+originfilename);
			
			M_boardDTO bdto = new M_boardDTO(date, item, title, content, imagefile);
			bdto.setNo(no);
			result = mdao.modifyItem(bdto);
			
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		
		if(result==false) {
			String msg = "게시물 수정에 실패했습니다.";
			PrintWriter out = response.getWriter();
			out.println("<script>alert("+msg+")</script>");
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("../mk/showcontent.do?no="+no);
		
		return forward;	
	}

}
