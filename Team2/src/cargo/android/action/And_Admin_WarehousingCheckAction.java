package cargo.android.action;

import java.util.ArrayList;
import java.util.Map;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.JSONParser;

import cargo.admin.DAO.AdminDAO;

public class And_Admin_WarehousingCheckAction {

	AdminDAO adao = new AdminDAO();

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String jsonString = request.getParameter("result");

		JSONParser ps = new JSONParser();

		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) ps.parse(jsonString);

		// DB 정보가 변한 것은 없는지 DB에서 다시 불러옴
		map = adao.getInfo("reservation", map.get("num").toString());

		// item ID 발급하기
		String ID = "";
		ID += map.get("house").toString();
		String start_day = map.get("start_day").toString();
		ID += start_day.substring(start_day.indexOf("-") + 1).replace("-", "");

		ID = makeID(ID);
		System.out.println("발급된 ID : " + ID);
		map.put("item", ID);

		request.setAttribute("map", map);

		RequestDispatcher dispatcher = request.getRequestDispatcher("../admin/checkBeforeItems.jsp");
		dispatcher.forward(request, response);

	}

	private String makeID(String firstSixofID) {
		// item id들과 중복 비교 하기 위해 앞에 "house+날짜" 형식이 같은 id 가져오기
		ArrayList<String> IDs = adao.getItemIDs(firstSixofID);

		String ID = "";

		do {
			ID = firstSixofID;
			for (int i = 0; i < 3; i++) {
				Random rd = new Random();
				ID += rd.nextInt(9) + 1;
			}
		} while (IDs.contains(ID));

		return ID;
	}
}