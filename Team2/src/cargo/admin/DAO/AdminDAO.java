package cargo.admin.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cargo.admin.DTO.AdminDTO;
import cargo.admin.DTO.ChartDTO;
import cargo.admin.DTO.OverdueDTO;
import cargo.common.DTO.MemberDTO;

public class AdminDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String sql;
	
	//연결 메서드 따로있습니다..
	private Connection connect() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jspbeginner");
		return ds.getConnection();
	}//end of connect

	//자원해재
	public void freeResource() {
		try {
			if (this.con != null) {
				this.con.close();
			}
			if (this.rs != null) {
				this.rs.close();
			}
			if (this.pstmt != null) {
				this.pstmt.close();
			}
		} catch (Exception e) {
			System.out.println("자원해제 err: " + e.getMessage());
			e.printStackTrace();
		}
	}//end of freeResource
	
	public ArrayList<AdminDTO> getTables(String category){
		sql="";
		ArrayList<AdminDTO> list = new ArrayList<>();
		
		/*String인데 값 없는경우 '-'
		 *int인데 값없는 경우 -1
		 *Date인데 값 없는경우 null
		 *로 DB에서 가져옵니다.
		 *null 피하기 위해.. Date경우에는 표시해줄때 꼬일 것 같아서 그냥 null로 받아옵니다.*/
		String resev = 
				"select '예약' as state, m.name, m.phone, m.email,"
				+ " r.num, '-' as item, r.house,"
				+ " r.res_day, r.start_day, r.end_day, null as return_day,"
				+ " r.payment, -1 as item_price, '-' as overdue"
				+ " from reservation as r"
				+ " left join member as m"
				+ " on r.email = m.email";
	
		String itm =
				"select '보관' as state, m.name, m.phone, m.email,"
				+ " -1 as num, i.item, i.house,"
				+ " null as res_day, i.start_day, i.end_day, null as return_day,"
				+ " i.payment, i.item_price, i.overdue"
				+ " from items as i"
				+ " left join member as m"
				+ " on i.email = m.email";

		/*예전 기록의 경우 회원이 탈퇴했을때 없어진 정보는 null대신 "탈퇴한 회원"으로 채움
		 * ifnull은 oracle NVL함수와 같은 기능으로 ifnull(v1,v2) v1이 null이면 v2로 대체
		 * String이  null 이면 '탈퇴한 회원'
		 * int null 이면 -1*/
		String cld=
				"select '완료' as state, ifnull(m.name, '탈퇴한 회원') as name, ifnull(m.phone, '탈퇴한 회원') as phone,"
				+ " c.email, -1 as num, c.item, c.house,"
				+ " null as res_day, c.start_day, c.end_day, c.return_day,"
				+ " c.payment, c.item_price, '-' as overdue"
				+ " from closed as c"
				+ " left join member as m"
				+ " on c.email = m.email";
		
		if("reservation".equals(category)){
			sql = resev;
		}else if("items".equals(category)){
			sql = itm;
		}else if("closed".equals(category)){
			sql = cld;
		}else if("all".equals(category)){
			sql = "("+resev+") UNION all ("+itm+") UNION all ("+cld+")";
		}
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				AdminDTO dto = new AdminDTO();	
				//상태 이름 휴대전화 이메일  +예약번호 물품ID 창고번호  +예약일 시작일 종료일 +가져간 날  이용금액 +물품 가격
				
				dto.setState(rs.getString("state"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				
				dto.setNum(rs.getInt("num"));
				dto.setItem(rs.getString("item"));
				dto.setHouse(rs.getString("house"));
				dto.setOverdue(rs.getString("overdue"));
				
				dto.setRes_day(rs.getDate("res_day"));
				dto.setStart_day(rs.getDate("start_day"));
				dto.setEnd_day(rs.getDate("end_day"));
				dto.setReturn_day(rs.getDate("return_day"));
				
				dto.setPayment(rs.getInt("payment"));
				dto.setItem_price(rs.getInt("item_price"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getTables err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return list;
	}//end of getTables(String category)
	
	public ArrayList<AdminDTO> getTables(){
		return getTables("all");
	}//다 받아오는거는 getTables()만 호출하면 되도록... 인자 안넣도록..... 왜냐.. 귀찮으니까.... 
	
	public ArrayList<MemberDTO> getMembersTable() {
		ArrayList<MemberDTO> list = new ArrayList<>();
		sql="select * from member";
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MemberDTO mdto = new MemberDTO();
				mdto.setAdmin(rs.getInt("admin"));
				mdto.setName(rs.getString("name"));
				mdto.setEmail(rs.getString("email"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setPwd(rs.getString("pwd"));
				mdto.setPostCode(rs.getInt("postCode"));
				mdto.setDetailAddr(rs.getString("detailAddr"));
				mdto.setRoadAddr(rs.getString("roadAddr"));
				mdto.setReg_date(rs.getTimestamp("reg_date"));
				
				list.add(mdto);
			}
		} catch (Exception e) {
			System.out.println("getMembersTable err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return list;
	}//end of getMembersTable
	
	public ArrayList<OverdueDTO> getOverdueTable() {
		ArrayList<OverdueDTO> list = new ArrayList<>();
		sql="select datediff(curdate(),end_day) as overdue_day, datediff(curdate(),end_day)*w.price as arrears,"
						+ " round((i.payment*0.1),-1)-(datediff(curdate(),end_day)*w.price) as now_deposit,"
						+ " m.email, m.name, m.phone, m.postCode, m.roadAddr, m.detailAddr,"
						+ " w.house, w.price,"
						+ " i.item ,i.start_day, i.end_day, i.payment, i.item_price, i.overdue"
						+ " from items as i"
						+ " join member as m on i.email = m.email"
						+ " join warehouse as w on i.house = w.house"
						+ " where end_day<curdate()";
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int overdue_day = rs.getInt("overdue_day");
				int arrears = rs.getInt("arrears");
				int now_deposit = rs.getInt("now_deposit");
				
				OverdueDTO odto = new OverdueDTO(overdue_day, arrears, now_deposit);
				
				odto.setHouse(rs.getString("house"));
				odto.setPrice(rs.getInt("price"));
				
				odto.setEmail(rs.getString("email"));
				odto.setName(rs.getString("name"));
				odto.setPhone(rs.getString("phone"));
				odto.setPostCode(rs.getInt("postCode"));
				odto.setDetailAddr(rs.getString("detailAddr"));
				odto.setRoadAddr(rs.getString("roadAddr"));
				
				odto.setStart_day(rs.getDate("start_day"));
				odto.setEnd_day(rs.getDate("end_day"));
				odto.setPayment(rs.getInt("payment"));
				odto.setItem_price(rs.getInt("item_price"));
				odto.setItem(rs.getString("item"));
				odto.setOverdue(rs.getString("overdue"));
				
				list.add(odto);
			}
		} catch (Exception e) {
			System.out.println("getOverdueTable err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return list;
	}//end of getOverdueTable
	
	public HashMap<String, Object> getInfo(String category, String primary){
		HashMap<String, Object> map = new HashMap<>();
		sql="";
		
		/*String인데 값 없는경우 '-'
		 *int인데 값없는 경우 -1
		 *Date인데 값 없는경우 null
		 *로 DB에서 가져옵니다.
		 *null 피하기 위해.. Date경우에는 표시해줄때 꼬일 것 같아서 그냥 null로 받아옵니다.*/
		String resev = 
				"select '-' as item, r.num, r.email, r.house, '-' as overdue,"
				+ " r.start_day,  r.end_day, r.res_day, r.payment, -1 as item_price, null as return_day,"
				+ " m.name, m.phone, m.postCode, m.roadAddr, m.detailAddr"
				+ " from reservation as r"
				+ " left join member as m"
				+ " on r.email = m.email"
				+ " where r.num =?";
		
		String itm =
				"select i.item, -1 as num, i.email, i.house, i.overdue,"
				+ " i.start_day, i.end_day, null as res_day, i.payment, i.item_price, null as return_day,"
				+ " m.name, m.phone, m.postCode, m.roadAddr, m.detailAddr"
				+ " from items as i"
				+ " left join member as m"
				+ " on i.email = m.email"
				+ " where i.item =?";
		
		/*예전 기록의 경우 회원이 탈퇴했을때 없어진 정보는 null대신 "탈퇴한 회원"으로 채움
		 * ifnull은 oracle NVL함수와 같은 기능으로 ifnull(v1,v2) v1이 null이면 v2로 대체
		 * String이  null 이면 '탈퇴한 회원'
		 * int null 이면 -1*/
		String cld=
				"select c.item, null as num, c.email, c.house, '-' as overdue,"
				+ " c.start_day, c.end_day, null as res_day, c.payment, c.item_price, c.return_day,"
				+ " ifnull(m.name, '탈퇴한 회원') as name, ifnull(m.phone, '탈퇴한 회원') as phone,"
				+ " ifnull(m.postCode, -1) as postCode, ifnull(m.roadAddr, '탈퇴한 회원') as roadAddr,"
				+ " ifnull(m.detailAddr, '탈퇴한 회원') as detailAddr"
				+ " from closed as c"
				+ " left join member as m"
				+ " on c.email = m.email"
				+ " where c.item =?";
		
		
		if("reservation".equals(category)){
			sql = resev;
		}else if("items".equals(category)){
			sql = itm;
		}else if("closed".equals(category)){
			sql = cld;
		}
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, primary);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				map.put("name",rs.getString("name"));
				map.put("phone",rs.getString("phone"));
				map.put("email",rs.getString("email"));
				map.put("roadAddr",rs.getString("roadAddr"));
				map.put("detailAddr",rs.getString("detailAddr"));
				map.put("house",rs.getString("house"));
				map.put("item",rs.getString("item"));
				map.put("overdue",rs.getString("overdue"));
				
				map.put("num",rs.getInt("num"));
				map.put("postCode",rs.getInt("postCode"));
				map.put("payment",rs.getInt("payment"));
				map.put("item_price",rs.getInt("item_price"));
				
				if(rs.getDate("res_day")!=null) map.put("res_day",rs.getDate("res_day").toString());
				map.put("start_day",rs.getDate("start_day").toString());
				map.put("end_day",rs.getDate("end_day").toString());
				if(rs.getDate("return_day")!=null) map.put("return_day",rs.getDate("return_day").toString());
				
			}
		} catch (Exception e) {
			System.out.println("getInfo err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return map;
	}//end of getInfo(String category, String email, String house)
	

	public HashMap<String, Object> getMemberInfo(String email) {
		sql="select * from member where email=?";
		HashMap<String, Object> map = new HashMap<>();
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				map.put("admin",rs.getInt("admin"));
				map.put("name",rs.getString("name"));
				map.put("email",rs.getString("email"));
				map.put("phone",rs.getString("phone"));
				map.put("pwd",rs.getString("pwd"));
				map.put("postCode",rs.getInt("postCode"));
				map.put("detailAddr",rs.getString("detailAddr"));
				map.put("roadAddr",rs.getString("roadAddr"));
				map.put("reg_date",rs.getTimestamp("reg_date").toString());				
			}
		} catch (Exception e) {
			System.out.println("getMemberInfo err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return map;
	}//end of getMemberInfo

	public HashMap<String, Object> getOverdueInfo(String item) {
		HashMap<String, Object> map = new HashMap<>();
		sql=
		"select datediff(curdate(),end_day) as overdue_day, datediff(curdate(),end_day)*w.price as arrears,"
				+ " round((i.payment*0.1),-1)-(datediff(curdate(),end_day)*w.price) as now_deposit,"
				+ " m.email, m.name, m.phone, m.postCode, m.roadAddr, m.detailAddr,"
				+ " w.house, w.price,"
				+ " i.item ,i.start_day, i.end_day, i.payment, i.item_price, i.overdue"
				+ " from items as i"
				+ " join member as m on i.email = m.email"
				+ " join warehouse as w on i.house = w.house"
				+ " where end_day<curdate() and i.item =?";
		
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				map.put("overdue", rs.getString("overdue")); 
				map.put("overdue_day", rs.getInt("overdue_day")); 
				map.put("arrears", rs.getInt("arrears")); 
				map.put("now_deposit", rs.getInt("now_deposit")); 
				
				map.put("house", rs.getString("house"));
				map.put("price", rs.getInt("price"));
				
				map.put("email", rs.getString("email"));
				map.put("name",rs.getString("name"));
				map.put("phone",rs.getString("phone"));
				map.put("postCode",rs.getInt("postCode"));
				map.put("detailAddr",rs.getString("detailAddr"));
				map.put("roadAddr",rs.getString("roadAddr"));
				
				map.put("start_day",rs.getDate("start_day").toString());
				map.put("end_day",rs.getDate("end_day").toString());
				map.put("payment",rs.getInt("payment"));
				map.put("item_price",rs.getInt("item_price"));
				map.put("item",rs.getString("item"));
			}
		} catch (Exception e) {
			System.out.println("getOverdueInfo err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return map;
	}//end of getOverdueInfo

	public ArrayList<String> getItemIDs(String firstSixofID) {
		ArrayList<String> IDs = new ArrayList<>();
		
		sql = "select item"
				+ " from items"
				+ " where house like ?";
		try {
			con = connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, firstSixofID+"%");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				IDs.add(rs.getString("item"));
			}
		} catch (Exception e) {
			System.out.println("getItemIDs err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return IDs;
	}//end of getItemIDs

	public void reservToitems(int num, String item, int item_price) {
		try {
			sql = "insert into items(item, item_price, email, house, start_day, end_day, payment)"
				+ " select ? as item, ? as item_price, email, house, start_day, end_day, payment"
				+ " from reservation where num = ?";
		
			con = connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item);
			pstmt.setInt(2, item_price);
			pstmt.setInt(3, num);
			
			pstmt.executeUpdate();
			
			sql="update warehouse"
					+ " set isEmpty = 1"
					+ " where house = ( "
					+ " select house "
					+ " from items"
					+ " where item = ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item);
			pstmt.executeUpdate();
			
			sql ="delete from reservation"
					+ " where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("reservToitems err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}//end of reservToitems

	public void updateOverdue(String overdue, String item) {
		try {
			sql = "update items"
					+ " set overdue=?"
					+ " where item=?";
		
			con = connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, overdue);
			pstmt.setString(2, item);
			
			pstmt.executeUpdate();
			
			sql="update warehouse"
					+ " set isEmpty = 0"
					+ " where house = ( "
					+ " select house"
					+ " from items"
					+ " where item = ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateOverdue err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}//end of updateOverdue

	public void itemsToClosed(Date return_day, String item) {
		try {
			sql = "insert into closed(item, item_price, email, house, start_day, end_day, return_day, payment)"
				+ " select item, item_price, email, house, start_day, end_day, ? as return_day, payment"
				+ " from items where item = ?";
		
			con = connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, return_day);
			pstmt.setString(2, item);
			
			pstmt.executeUpdate();
			
			sql="update warehouse"
					+ " set isEmpty = 0"
					+ " where house = ( "
					+ " select house"
					+ " from closed"
					+ " where item = ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item);
			pstmt.executeUpdate();
			
			sql ="delete from items"
					+ " where item=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, item);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("itemsToClosed err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}

	public Map<String, String> getChartInfos() {
		Map<String, String> chartInfo = new HashMap<>();
		
		try {
			/*combochart 정보 가져오는 부분*/
			sql = "select date_format(start_day,'%Y-%m') as months, left(house, 1) as h, sum(payment) as sumpay"
					+ " from (SELECT start_day, house, payment FROM closed"
					+ " where start_day > DATE_ADD((select last_day(start_day) from items order by start_day desc limit 1), INTERVAL -6 MONTH)"
					+ " union all"
					+ " SELECT start_day, house, payment FROM items"
					+ " where start_day > DATE_ADD((select last_day(start_day) from items order by start_day desc limit 1), INTERVAL -6 MONTH)) as temp"
					+ " group by months, h";
		
			con = connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			List<String> list = new ArrayList<>();
			ChartDTO cdto = new ChartDTO();
			list.add("['Month', 'A 창고', 'B 창고', 'C 창고', 'D 창고', 'total']");
			
			while (rs.next()) {
				if(!rs.getString("months").equals(cdto.getMonth())){
					list.add(cdto.toComboArray());
					cdto = new ChartDTO(rs.getString("months"));
				}
				
				char h = rs.getString("h").charAt(0);
				switch (h) {
				case 'A':
					cdto.setAPayment(rs.getInt("sumpay"));
					break;
				case 'B':
					cdto.setBPayment(rs.getInt("sumpay"));
					break;
				case 'C':
					cdto.setCPayment(rs.getInt("sumpay"));
					break;
				case 'D':
					cdto.setDPayment(rs.getInt("sumpay"));
					break;
				}
			}
			
			list.add(cdto.toComboArray());
			list.remove(1);
			
			chartInfo.put("combo", list.toString());
			
			/*piechart 정보 가져오는 부분*/
			sql="select left(house,1) as h, count(*) as count from ("
					+ " select house from reservation"
					+ " union all"
					+ " select house from items"
					+ " union all"
					+ " select house from closed) as temp"
					+ " group by h";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			list.clear();
			list.add("['창고 종류', '주문 갯수']");
			
			while (rs.next()) {
				char h = rs.getString("h").charAt(0);
				switch (h) {
				case 'A':
					list.add("['A창고',"+rs.getString("count")+"]");
					break;
				case 'B':
					list.add("['B창고',"+rs.getString("count")+"]");
					break;
				case 'C':
					list.add("['C창고',"+rs.getString("count")+"]");
					break;
				case 'D':
					list.add("['D창고',"+rs.getString("count")+"]");
					break;
				}
			}
			chartInfo.put("pie", list.toString());
			
			/*barchart 정보 가져오는 부분*/
			sql="select left(house,1) as h, count(*) as count"
					+ " from warehouse"
					+ " where isEmpty=1"
					+ " group by h";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			list.clear();
			list.add("['창고', '사용 중', { role: 'style' } ]");
			
			while (rs.next()) {
				char h = rs.getString("h").charAt(0);
				switch (h) {
				case 'A':
					list.add("['A창고',"+rs.getString("count")+",'color: #3366CC']");
					break;
				case 'B':
					list.add("['B창고',"+rs.getString("count")+",'color: #DC3912']");
					break;
				case 'C':
					list.add("['C창고',"+rs.getString("count")+",'color: #FF9900']");
					break;
				case 'D':
					list.add("['D창고',"+rs.getString("count")+",'color: #109618']");
					break;
				}
			}
			chartInfo.put("bar", list.toString());
			
			System.out.println("bar: "+chartInfo.get("bar"));
			System.out.println("pie: "+chartInfo.get("pie"));
			System.out.println("combo: "+chartInfo.get("combo"));
		} catch (Exception e) {
			System.out.println("getChartInfos err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return chartInfo;
	}//end of getChartInfos

	public void deleteResevation(int num) {
		try {
			sql="delete from reservation where num=?";
			con = connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteResevation err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}//end of deleteResevation

}
