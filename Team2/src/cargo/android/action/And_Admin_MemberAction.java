package cargo.android.action;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import cargo.admin.DAO.AdminDAO;
import cargo.common.DTO.MemberDTO;

public class And_Admin_MemberAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		AdminDAO dao = new AdminDAO();
		ArrayList<MemberDTO> list = dao.getMembersTable();
		
		JSONArray jList = new JSONArray();

		for (MemberDTO adto : list) {
			JSONObject obj = new JSONObject();

			obj.put("admin", adto.getAdmin());
			obj.put("name", adto.getName());
			obj.put("email",adto.getEmail());
			obj.put("phone", adto.getPhone());
			obj.put("pwd", adto.getPwd());
			obj.put("postCode", adto.getPostCode());
			obj.put("detailAddr", adto.getDetailAddr());
			obj.put("roadAddr", adto.getRoadAddr());
			obj.put("reg_date", ""+adto.getReg_date());
			
			jList.add(obj);
		}
		response.getWriter().print(jList);
	}
}
