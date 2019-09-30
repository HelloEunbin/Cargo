package cargo.market.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_boardDTO;
import cargo.common.DTO.M_itemDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class UploadPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MarketDAO mdao = new MarketDAO();
		List<M_itemDTO> idto = mdao.selectAllItems();
		List<M_boardDTO> bdto = mdao.selectBList();
		
		List<M_itemDTO> itemList = new ArrayList<M_itemDTO>();
		List<M_itemDTO> resultList = new ArrayList<M_itemDTO>();
		
		for(M_itemDTO idtoi: idto){
			for(M_boardDTO bdtoi: bdto){
				if(idtoi.getItem().equals(bdtoi.getItem())){
					itemList.add(idtoi);
					continue;
				}
			}
		}
		
		 for (int i = 0; i < idto.size(); i++) {
                if (!itemList.contains(idto.get(i))) {
                    resultList.add(idto.get(i));
                    continue;
                }
         }
		
		
		
		request.setAttribute("itemList", resultList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("../market/market_post.jsp");
		return forward;
	}

}
