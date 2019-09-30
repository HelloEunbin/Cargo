package cargo.market.action;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_boardDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;
import cargo.market.DTO.Paging;

public class MarketMainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		MarketDAO mdao = new MarketDAO();
		
		String category = "all";
		String keyWord = "";
		int curPage = 1;
		
		if(request.getParameter("cate") != null) category = request.getParameter("cate");
		if(request.getParameter("keyword") != null) keyWord = request.getParameter("keyword");
		if(request.getParameter("page")!= null) curPage = Integer.parseInt(request.getParameter("page"));
		
		
		
		Paging paging = new Paging();
		
		paging.setRecPerPage(9);
		paging.setPagePerGroup(5);
		paging.setTotalRecord(curPage, keyWord, category);
		
		int startNum = paging.getStartRecNum();
		int recPerPage = paging.getRecPerPage();
		
		
		ArrayList<M_boardDTO> boardList = mdao.selectBList(category, keyWord, startNum, recPerPage);
		
		
		request.setAttribute("keyWord", keyWord);
		request.setAttribute("category", category);
		request.setAttribute("boardList", boardList);
		request.setAttribute("paging", paging);
		
		ActionForward forward = new ActionForward();
		forward.setPath("../market/market_main.jsp");
		
		return forward;
		
	}

}
