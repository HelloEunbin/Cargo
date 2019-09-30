package cargo.android.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import cargo.admin.DTO.AdminDTO;
import cargo.member.DAO.MemberDAO;

public class And_StatusAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String category = request.getParameter("category");

		MemberDAO mdao = new MemberDAO();
		ArrayList<AdminDTO> list = mdao.memberStatus(email, category); //회원 한명에 대한 정보

		JSONArray jList = new JSONArray();

		for (AdminDTO adto : list) {
			JSONObject obj = new JSONObject();

			obj.put("state", adto.getState());
			obj.put("name", adto.getName());
			obj.put("phone", adto.getPhone());
			obj.put("email", adto.getEmail());
			
			obj.put("num", adto.getNum());
			obj.put("item", adto.getItem());
			obj.put("house", adto.getHouse());
			
			obj.put("res_day", "" + adto.getRes_day());
			obj.put("start_day", "" + adto.getStart_day());
			obj.put("end_day", "" + adto.getEnd_day());
			obj.put("return_day", "" + adto.getReturn_day());
			
			obj.put("payment", adto.getPayment());
			obj.put("item_price", adto.getItem_price());
			
			jList.add(obj);

		}

		response.getWriter().print(jList);
	}
}
