package cargo.market.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_board_replyDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class AddCommentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int board_no = Integer.parseInt(request.getParameter("board_no"));
		
		M_board_replyDTO mrdto = new M_board_replyDTO();
		mrdto.setContent(request.getParameter("content"));
		mrdto.setEmail(request.getParameter("email"));
		mrdto.setName(request.getParameter("name"));
		mrdto.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
		mrdto.setDate(new Timestamp(System.currentTimeMillis()));
		
		
		System.out.println(board_no);
		
		MarketDAO mrdao = new MarketDAO();
		mrdao.insertReply(mrdto);		
		
		ActionForward forward = new ActionForward();
		forward.setPath("/mk/showcontent.do?no="+board_no);
		return forward;
		

	}

}
