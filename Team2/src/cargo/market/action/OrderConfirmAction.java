package cargo.market.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cargo.common.DTO.M_orderDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;
import cargo.market.DTO.Cart;

public class OrderConfirmAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String order_id = (String) request.getAttribute("order_id");
		
		MarketDAO mdao = new MarketDAO();
		List<M_orderDTO> oLIst = mdao.getOrders(order_id);
		
		request.setAttribute("olist", oLIst);
		
		
		// 주문한 상품 카트 비우기
		String ids="";
			
		for(int i=0;i<oLIst.size();i++){
			ids += oLIst.get(i).getItem()+",";
		}
		System.out.println("ids"+ids);
		 
		String[] idArray = ids.split(",");
		System.out.println("idArray"+idArray.toString());
		
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart != null){
			cart.popList(idArray);
			session.setAttribute("cart", cart);
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("../market/market_payConfirm.jsp");
		
		return forward;
	}

}
