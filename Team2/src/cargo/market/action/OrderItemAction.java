package cargo.market.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_orderDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class OrderItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String item = request.getParameter("item");
		String name =  request.getParameter("name");
		String category =  request.getParameter("category");
		String email =  request.getParameter("email");
		int price  = Integer.parseInt(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		Date date = new Date(new java.util.Date().getTime());
		
		
		MarketDAO mdao = new MarketDAO();
		String order_id = mdao.createOrderId();
		M_orderDTO odto = new M_orderDTO(price, quantity, order_id, item, name, category, email, date);

		mdao.insertOrderId(order_id, email);
		mdao.orderItem(odto);
		mdao.MItemStockUpdate(quantity, item);
		mdao.MBoardonStockUpdate(item);
		
		ActionForward forward = new ActionForward();
		forward.setPath("../mk/confirmOrder.do");
		request.setAttribute("order_id", order_id);
		
		return forward;
		
	}

}
