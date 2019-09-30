package cargo.market.action;

import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_boardJoinDTO;
import cargo.common.DTO.M_board_replyDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class ShowContentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		int board_no = Integer.parseInt(request.getParameter("no"));
		
		MarketDAO mdao = new MarketDAO();
		M_boardJoinDTO mjdto = mdao.selectJoinItem(board_no);
		ArrayList<M_board_replyDTO> replyList = mdao.selectAllComment(board_no);
		int count = mdao.getTotalComment(board_no);
		
		request.setAttribute("mjdto", mjdto);
		request.setAttribute("replyList", replyList);
		request.setAttribute("totalComment", count);
		
		
		/* 최근 본 아이템 쿠키 설정 */
		M_boardJoinDTO cookieDTO;
		ArrayList<M_boardJoinDTO> cookies = new ArrayList<>();
		
		Cookie[] ckList = request.getCookies();
		
		for(Cookie c : ckList){
			System.out.println("ckList "+c.getName()+", "+c.getValue());
		}
		
		if(ckList.length != 0){
			for(int i = ckList.length-1; i>=0; i--){
				Cookie ck = ckList[i];
				String name = URLDecoder.decode(ck.getName(), "UTF-8");
				
				if(name.substring(0, 2).equals("iN")){
					int bno = Integer.parseInt(URLDecoder.decode(ck.getValue(), "UTF-8"));
					cookieDTO = mdao.selectJoinItem(bno);
					cookies.add(cookieDTO);
					System.out.println("latest cookie "+bno);
				}
				if(cookies.size()>4) break;
			}
		}
		
		request.setAttribute("cookies", cookies);
		
		
		/* 확인한 아이템 쿠키 등록 */
		Cookie ck;
		
		if(ckList.length != 0){
			for(int i=0;i<ckList.length;i++){
				ck = ckList[i];
				if(ck.getName().equals("iN"+board_no)){	// 쿠키가 이미 존재한다면 삭제
					ck.setMaxAge(0);
					response.addCookie(ck);
					System.out.println("clear cookie");
					break;
				}
			}
		}
		
		Cookie c = new Cookie("iN"+board_no, request.getParameter("no"));
		c.setMaxAge(60*60*24);
		response.addCookie(c);
		
		ActionForward forward = new ActionForward();
		forward.setPath("../market/market_content.jsp");
		return forward;
	}

}
