package cargo.market.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cargo.common.DTO.M_boardDTO;
import cargo.common.DTO.M_boardJoinDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.market.DAO.MarketDAO;

public class MainpageAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	   
      request.setCharacterEncoding("UTF-8");
      MarketDAO mdao = new MarketDAO();
      
      
      ArrayList<M_boardJoinDTO> boardList1 = mdao.selectBJList();
      ArrayList<M_boardJoinDTO> boardList = new ArrayList<>();
      
      for (int i = 0; i < 3; i++) {
    	 M_boardJoinDTO mt = new M_boardJoinDTO();
         mt= boardList1.get(i);
         boardList.add(mt);
      }
      
      request.setAttribute("boardList", boardList);
      
      ActionForward forward = new ActionForward();
      
      
      String RequestURI = request.getRequestURI();
	  String command = RequestURI.substring(RequestURI.lastIndexOf("/"));
      
      
      if("/login.go".equals(command))	forward.setPath("../index.jsp?login=true");
  	  else	forward.setPath("../index.jsp");
      
      forward.setRedirect(false);
      return forward;
      
   }

}