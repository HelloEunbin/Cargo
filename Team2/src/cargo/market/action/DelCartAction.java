package cargo.market.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DTO.Cart;

public class DelCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String id = request.getParameter("id");
		String[] idArray = id.split(",");
		
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		cart.popList(idArray);
		
		session.setAttribute("cart", cart);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("../mk/cart.do");
		forward.setRedirect(true);
		return forward;
	}

}
