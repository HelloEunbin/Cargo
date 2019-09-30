package cargo.member.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import cargo.common.DTO.MemberDTO;
import cargo.common.action.Action;
import cargo.common.action.ActionForward;
import cargo.member.DAO.MemberDAO;

public class EmailSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		MemberDAO mdao = new MemberDAO();
		ArrayList<MemberDTO> memberList = mdao.getEmail(name, phone);
		
		ActionForward forward = null;
		
		JSONArray list = new JSONArray();
		JSONObject emailList = new JSONObject();
		
		if(memberList.size()!=0){
			forward = new ActionForward();
			for(MemberDTO mdto : memberList){
				if(mdto.getEmail()!=null){
					JSONObject obj = new JSONObject();
					StringBuilder secretemail = new StringBuilder(mdto.getEmail());
					int findStd = secretemail.indexOf("@");
					int findCom = secretemail.lastIndexOf(".");
					int endNum = secretemail.length();
					
					if(findStd<=3){
						secretemail = secretemail.replace(1, findStd, "");
						for(int i=1;i<findStd;i++){
							secretemail.insert(i,"*");
						}
					}else{
						secretemail = secretemail.replace(3, findStd, "");
						for(int i=3; i<findStd;i++){
							secretemail.insert(i, "*");
						}
					}
					secretemail = secretemail.replace(findStd+3, findCom, "");
					for(int i=findStd+3; i<findCom;i++){
						secretemail.insert(i, "*");
					}
					secretemail = secretemail.replace(findCom+1, endNum, "");
					for(int i=findCom+1; i<endNum; i++){
						secretemail.insert(i, "*");
					}
					String email = secretemail.toString();
					
					obj.put("email", email);
					obj.put("name", mdto.getName());
					obj.put("reg_date", mdto.getReg_date()); //날짜는 string 형식으로 바꿈
					
					list.add(obj);
				}
			}
			
			emailList.put("list", list);
			request.setAttribute("emailList", emailList);
			
			String path = request.getContextPath();
			forward.setPath("/member/findMember.jsp?find=email");
		}else{
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('조건에 일치하는 회원이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
			
			out.close();
			
		}
		return forward;
	}

}
