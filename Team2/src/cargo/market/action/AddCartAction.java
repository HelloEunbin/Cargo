package cargo.market.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DTO.Cart;
import cargo.market.DTO.CartDTO;

public class AddCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String item = request.getParameter("item");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String img = request.getParameter("img");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int price = Integer.parseInt(request.getParameter("price"));
		
		CartDTO cdto = new CartDTO(item, name, category, img, quantity, price);
		
		
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		
		if(cart == null){
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		
		cart.push(cdto);
		
		session.setAttribute("cart", cart);
		
		ActionForward forward = new ActionForward();
		forward.setAjax(true); // Ajax는 아니지만.... 전송 X
		
		PrintWriter out = response.getWriter();
		out.print("<script>alert('장바구니에 추가되었습니다.'); history.back(); </script>");
		
		return forward;
	}

}
