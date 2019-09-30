package cargo.market.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cargo.common.DTO.M_boardDTO;
import cargo.common.DTO.M_boardJoinDTO;
import cargo.common.DTO.M_board_replyDTO;
import cargo.common.DTO.M_itemDTO;
import cargo.common.DTO.M_orderDTO;
import cargo.market.DTO.CartDTO;

public class MarketDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	private void getConnection(){
		
		Context init;
		try {
			init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
			conn = ds.getConnection();
			
		} catch (Exception e) {
			System.out.println("Error in getConnection()");
			e.printStackTrace();
		}
		
	}
	
	private void freeResource(){
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public boolean postItem(M_boardDTO mdto){ // m_board insert 글쓰기 - 파일업로드 해야함
		
		boolean result = false;
	
		try {
			
			getConnection();
			
			String sql = "INSERT INTO m_board(item, title, content, image, date) VALUES(?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mdto.getItem());
			pstmt.setString(2, mdto.getTitle());
			pstmt.setString(3, mdto.getContent());
			pstmt.setString(4, mdto.getImage());
			pstmt.setTimestamp(5, mdto.getDate());
			
			int n = pstmt.executeUpdate();
			if(n>0) {
				result = true;
			}
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			freeResource();
			System.out.println("db결과:"+ result);
			return result;		
		}
		
	
	
	public boolean modifyItem(M_boardDTO bdto){ // m_board 글수정
		
		try {
			
			getConnection();
			String sql;
				
			if(bdto.getImage()==null) {
				
				sql ="UPDATE m_board SET title=?, content=?, item=? WHERE no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bdto.getTitle());
				pstmt.setString(2, bdto.getContent());
				pstmt.setString(3, bdto.getItem());
				pstmt.setInt(4, bdto.getNo());
			}else {
				
				sql ="UPDATE m_board SET title=?, image=?, content=?, item=? WHERE no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bdto.getTitle());
				pstmt.setString(2, bdto.getImage());
				pstmt.setString(3, bdto.getContent());
				pstmt.setString(4, bdto.getItem());
				pstmt.setInt(5, bdto.getNo());
			}

			pstmt.executeUpdate();
			return true;
			
		} catch (Exception e) {
			System.out.println("modifyboard 오류 : "+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return false;
	}
	
	
	
	
	public boolean deleteItem(int no){ // m_board 글삭제
		
		int result = 0;
		
		String sql="DELETE FROM m_board WHERE no=?";
		
		try {
			
			getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			
			if(result == 0) {
				return false;
			}else {
				return true;
			}
			
		}catch(Exception e) {
			System.out.println("deleteItem 오류 : "+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return false;
		
		
	}
	
	public int getTotal(String keyWord, String category){// m_board 게시글 총 갯수 불러오기
		
		int count=0;
		
		try {
			
			getConnection();
			String sql="SELECT count(*)";
			
			switch (category) {
			
			case "all": sql += " FROM m_board";
				break;
			case "fur": sql += " FROM m_board WHERE item LIKE 'F%'";
				break;
			case "elec": sql += " FROM m_board WHERE item LIKE 'E%'";
				break;
			case "mat": sql += " FROM m_board WHERE item LIKE 'M%'";
				break;
			case "oth": sql += " FROM m_board WHERE item LIKE 'O%'";
				break;
			}
			
			if(keyWord != ""){
				if(category.equals("all")) sql += " WHERE title LIKE '%"+keyWord+"%'";
				else sql += " AND title LIKE '%"+keyWord+"%'";
			}
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			count = rs.getInt("count(*)");
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return count;
		
	}
	
	public ArrayList<M_boardJoinDTO> selectBJList(){
		ArrayList<M_boardJoinDTO> boardList = new ArrayList<>();
		M_boardJoinDTO bDTO;
		
		try {
			
			getConnection();
			String sql ="SELECT * FROM m_board b NATURAL JOIN m_item i WHERE b.onStock!=0 ORDER BY b.no DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bDTO = new M_boardJoinDTO();
				bDTO.setContent(rs.getString("content"));
				bDTO.setDate(rs.getTimestamp("date"));
				bDTO.setImage(rs.getString("image"));
				bDTO.setItem(rs.getString("item"));
				bDTO.setNo(rs.getInt("no"));
				bDTO.setOnStock(rs.getInt("onStock"));
				bDTO.setTitle(rs.getString("title"));
				bDTO.setPrice(rs.getInt("price"));
				bDTO.setStock(rs.getInt("stock"));
				
				boardList.add(bDTO);
			}
			
		} catch (Exception e) {
			System.out.println("error in selectBJList()");
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return boardList;
	}
	
	public ArrayList<M_boardDTO> selectBList(){ // m_board 목록 불러오기

		ArrayList<M_boardDTO> boardList = new ArrayList<>();
		M_boardDTO bDTO;
		
		try {
			String sql ="SELECT * FROM m_board";
			getConnection();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bDTO = new M_boardDTO();
				bDTO.setContent(rs.getString("content"));
				bDTO.setDate(rs.getTimestamp("date"));
				bDTO.setImage(rs.getString("image"));
				bDTO.setItem(rs.getString("item"));
				bDTO.setNo(rs.getInt("no"));
				bDTO.setOnStock(rs.getInt("onStock"));
				bDTO.setTitle(rs.getString("title"));
				
				boardList.add(bDTO);
			}
			
		} catch (Exception e) {
			System.out.println("error in selectBList()");
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return boardList;
		
	}
	
	public ArrayList<M_boardDTO> selectBList(String category, String keyWord, int startRecNum, int recPerPage){ // m_board 목록 불러오기 - 카테고리, 검색 등 !

		ArrayList<M_boardDTO> boardList = new ArrayList<>();
		M_boardDTO bDTO;
		
		try {
			String sql ="";
			getConnection();
			
			switch (category) {
			
				case "all": sql = "SELECT * FROM m_board";
					break;
				case "fur": sql = "SELECT * FROM m_board WHERE item LIKE 'F%'";
					break;
				case "elec": sql = "SELECT * FROM m_board WHERE item LIKE 'E%'";
					break;
				case "mat": sql = "SELECT * FROM m_board WHERE item LIKE 'M%'";
					break;
				case "oth": sql = "SELECT * FROM m_board WHERE item LIKE 'O%'";
					break;
			}
			
			if(keyWord != ""){
				if(category.equals("all")) sql += " WHERE title LIKE '%"+keyWord+"%'";
				else sql +=  " AND title LIKE '%"+keyWord+"%'";
			}
				
			sql += " ORDER BY no DESC LIMIT ?, ?";
			System.out.println(sql);
			System.out.println(startRecNum-1);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRecNum-1<0 ? 0: startRecNum-1);
			pstmt.setInt(2, recPerPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bDTO = new M_boardDTO();
				bDTO.setContent(rs.getString("content"));
				bDTO.setDate(rs.getTimestamp("date"));
				bDTO.setImage(rs.getString("image"));
				bDTO.setItem(rs.getString("item"));
				bDTO.setNo(rs.getInt("no"));
				bDTO.setOnStock(rs.getInt("onStock"));
				bDTO.setTitle(rs.getString("title"));
				
				boardList.add(bDTO);
			}
			
		} catch (Exception e) {
			System.out.println("error in selectAllItem()");
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return boardList;
		
		
	}
	
	public M_boardDTO selectBoardItem(String item){ // board 테이블 1개
		
		M_boardDTO bDTO = new M_boardDTO();
		
		try {
			getConnection();
			String sql = "SELECT * FROM m_board WHERE item=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				bDTO.setContent(rs.getString("content"));
				bDTO.setImage(rs.getString("image"));
				bDTO.setItem(rs.getString("item"));
				bDTO.setTitle(rs.getString("title"));
				bDTO.setNo(rs.getInt("no"));
				bDTO.setOnStock(rs.getInt("onStock"));
				bDTO.setDate(rs.getTimestamp("date"));
			}
			
		} catch (SQLException e) {
			System.out.println("error in selectBoardItem :"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return bDTO;
		
	}
	
	public M_itemDTO selectItem(String item){ // item 테이블 1개
		
		M_itemDTO iDTO = new M_itemDTO();
		
		try {
			getConnection();
			String sql = "SELECT * FROM m_item WHERE item=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				iDTO.setCategory(rs.getString("category"));
				iDTO.setItem(rs.getString("item"));
				iDTO.setName(rs.getString("name"));
				iDTO.setPrice(rs.getInt("price"));
				iDTO.setStock(rs.getInt("stock"));
			}
			
		} catch (SQLException e) {
			System.out.println("error in selectItem :"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return iDTO;
	}
	
	public ArrayList<M_itemDTO> selectAllItems(){ // item 테이블 전체
		ArrayList<M_itemDTO> list = new ArrayList<>();
		
		try {
			
			getConnection();
			String sql = "SELECT * FROM m_item";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				M_itemDTO iDTO = new M_itemDTO();
				
				iDTO.setCategory(rs.getString("category"));
				iDTO.setItem(rs.getString("item"));
				iDTO.setName(rs.getString("name"));
				iDTO.setPrice(rs.getInt("price"));
				iDTO.setStock(rs.getInt("stock"));
				
				list.add(iDTO);
			}
			
		} catch (SQLException e) {
			System.out.println("error in selectAllItems :"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return list;
	}//end of selelctAllItmes
	

	public void updateMItem(M_itemDTO idto) {
		try {
			getConnection();
			String sql = "update M_item set name=?, category=?, price=?, stock=? where item=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idto.getName());
			pstmt.setString(2, idto.getCategory());
			pstmt.setInt(3, idto.getPrice());
			pstmt.setInt(4, idto.getStock());
			pstmt.setString(5, idto.getItem());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("error in updateMItem :"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}//end of updateMItem
	
	public void deleteMItem(String item) {
		try {
			getConnection();
			String sql = "delete from m_item where item=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("error in deleteMItem :"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}//end of deleteMItem
	
	public M_boardJoinDTO selectJoinItem(int board_no){ // board, item JOIN 객체 반환
		
		M_boardJoinDTO bDTO = new M_boardJoinDTO();
		
		try {
			
			getConnection();
			String sql = "SELECT * FROM m_item JOIN m_board ON m_item.item = m_board.item WHERE m_board.no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				bDTO.setCategory(rs.getString("category"));
				bDTO.setContent(rs.getString("content"));
				bDTO.setDate(rs.getTimestamp("date"));
				bDTO.setImage(rs.getString("image"));
				bDTO.setItem(rs.getString("item"));
				bDTO.setName(rs.getString("name"));
				bDTO.setNo(rs.getInt("no"));
				bDTO.setOnStock(rs.getInt("onStock"));
				bDTO.setPrice(rs.getInt("price"));
				bDTO.setStock(rs.getInt("stock"));
				bDTO.setTitle(rs.getString("title"));
			}
			
		} catch (SQLException e) {
			System.out.println("error in selectJoinItem");
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return bDTO;
	}
	
	
	public int getTotalComment(int board_no){ // 댓글 갯수 가져오기
		
		int count=0;
		
		try {
			
			getConnection();
			String sql = "SELECT count(*) FROM m_board_reply WHERE board_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			count = rs.getInt("count(*)");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return count;
	}
	
	public ArrayList<M_board_replyDTO> selectAllComment(int board_no){// 댓글 가져오기
		
		ArrayList<M_board_replyDTO> replyList = new ArrayList<>();
		M_board_replyDTO rDTO ;
		
		try {
			getConnection();
			String sql = "SELECT * FROM m_board_reply WHERE board_no=? ORDER BY no";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				rDTO = new M_board_replyDTO();
				rDTO.setBoard_no(board_no);
				rDTO.setContent(rs.getString("content"));
				rDTO.setDate(rs.getTimestamp("date"));
				rDTO.setEmail(rs.getString("email"));
				rDTO.setName(rs.getString("name"));
				rDTO.setNo(rs.getInt("no"));
				
				replyList.add(rDTO);
			}
			
		} catch (SQLException e) {
			System.out.println("error in selectAllComment");
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return replyList;
	}
	
	public void insertReply(M_board_replyDTO mrdto) {   //댓글작성

        try {
           getConnection();
           String sql="insert into m_board_reply(board_no, content, email, name, date) values(?,?,?,?,?)";
           pstmt=conn.prepareStatement(sql);
           pstmt.setInt(1, mrdto.getBoard_no());
           pstmt.setString(2, mrdto.getContent());
           pstmt.setString(3, mrdto.getEmail());
           pstmt.setString(4, mrdto.getName());
           pstmt.setTimestamp(5, mrdto.getDate());
           
           pstmt.executeUpdate();
           System.out.println("작성 완료");      
        } catch (Exception e) {
           e.printStackTrace();
        }finally {
           freeResource();
        }
     }
	
	public void orderItem(M_orderDTO odto){ // 아이템 주문 - 결제 후 order 테이블로 삽입. 
		
		try {
	           getConnection();
	           String sql="insert into m_order(order_id, item, name, quantity, price, category, email, date) values(?,?,?,?,?,?,?,?)";
	           pstmt=conn.prepareStatement(sql);
	           
	           pstmt.setString(1, odto.getOrder_id());
	           pstmt.setString(2, odto.getItem());
	           pstmt.setString(3, odto.getName());
	           pstmt.setInt(4, odto.getQuantity());
	           pstmt.setInt(5, odto.getPrice());
	           pstmt.setString(6, odto.getCategory());
	           pstmt.setString(7, odto.getEmail());
	           pstmt.setDate(8, odto.getDate());
	           
	           pstmt.executeUpdate();
	          
	           
	        } catch (Exception e) {
        	   System.out.println("error in orderItem");  
	           e.printStackTrace();
	        }finally {
	           freeResource();
	        }
		
		
	}

	public String makeItemID(String category) {
		String ID = "";

		try {
			SimpleDateFormat form = new SimpleDateFormat("MMdd");
			boolean same=true;
			getConnection();
			
			while(same){
				ID = Character.toUpperCase(category.charAt(0))+form.format(new java.util.Date());
				System.out.println(ID);
				
				for(int i=0; i<4; i++){
					Random rd = new Random();
					ID += rd.nextInt(9)+1;
				}
				
				String sql = "select item from M_item where item like ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ID);
				rs = pstmt.executeQuery();
				
				if(!rs.next()) same = false;
			}
		} catch (SQLException e) {
			System.out.println("error in makeItemID :"+e.getMessage());
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return ID;
	}

	public void insertMItem(M_itemDTO idto) {
		try {
			getConnection();
			String sql ="insert into m_item(item, name, price, category, stock) values(?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idto.getItem());
			pstmt.setString(2, idto.getName());
			pstmt.setInt(3, idto.getPrice());
			pstmt.setString(4, idto.getCategory());
			pstmt.setInt(5, idto.getStock());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("error in insertMItem :"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}
	
	
	/* 주문번호 생성 메서드 */
	public String createOrderId() {
		
		StringBuffer orderId_ = new StringBuffer();
		
		java.util.Date date= new java.util.Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String today = format.format(date);
		
		for (int i = 0; i < 4; ++i) {
			int randNum = (int) (Math.random() * 10.0D);
			orderId_.append(randNum);
		}
		String orderId = today+orderId_.toString();
		return orderId;
	}
	
	public void insertOrderId(String orderid, String email){
		try {
			getConnection();
			String sql ="INSERT INTO m_order_id VALUES(?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderid);
			pstmt.setString(2, email);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("error in insertOrderId :"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
	}
	
	public void MItemStockUpdate(int stock, String item){ // 주문 후 재고수량 조절
		
		try {
			getConnection();
			String sql ="UPDATE m_item SET stock=stock-? WHERE item=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, stock);
			pstmt.setString(2, item);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("error in MItemStockUpdate :"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
	}
	
	public void MBoardonStockUpdate(String item){ // onStock 0
		
		try {
			
			M_itemDTO iDTO = selectItem(item);
			int stock = iDTO.getStock();
			System.out.println("stock :"+stock);
			
			if(stock==0){
				getConnection();
				
				String sql ="UPDATE m_board SET onStock=0 WHERE item=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, item);
				
				pstmt.executeUpdate();
			}else{
				System.out.println("stock!=0");
			}
			
			
		} catch (Exception e) {
			System.out.println("error in onStockUpdate");
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
	}
	
	// 전체주문 - 오버로딩
	public String insertMOrder(String email, List<CartDTO> clist){
		String orderId = createOrderId();
		insertOrderId(orderId, email);
		System.out.println(orderId);
		
		for(CartDTO dto: clist){
			
			M_orderDTO odto = new M_orderDTO();
			Date today = new Date(new java.util.Date().getTime());
			
			odto.setCategory(dto.getCategory());
			odto.setEmail(email);
			odto.setDate(today);
			odto.setItem(dto.getItem());
			odto.setOrder_id(orderId);
			odto.setPrice(dto.getPrice());
			odto.setQuantity(dto.getQuantity());
			odto.setName(dto.getName());
			
			orderItem(odto);
			MItemStockUpdate(dto.getQuantity(), dto.getItem());
			MBoardonStockUpdate(dto.getItem());
			
		}
		
		return orderId;
		
	}
	
	// 부분주문 - 오버로딩
	public String insertMOrder(String email, List<CartDTO> clist, String[] idArray){
		String orderId = createOrderId();
		insertOrderId(orderId, email);
		System.out.println(orderId);
		
		for(String id: idArray){
			for(CartDTO dto: clist){
				if(id.equals(dto.getItem())){
					
					M_orderDTO odto = new M_orderDTO();
					Date today = new Date(new java.util.Date().getTime());
					
					odto.setCategory(dto.getCategory());
					odto.setEmail(email);
					odto.setDate(today);
					odto.setItem(dto.getItem());
					odto.setOrder_id(orderId);
					odto.setPrice(dto.getPrice());
					odto.setQuantity(dto.getQuantity());
					odto.setName(dto.getName());
					
					orderItem(odto);
					MItemStockUpdate(dto.getQuantity(), dto.getItem());
					MBoardonStockUpdate(dto.getItem());
				}
			}	
		}
		return orderId;
	}
	
	public ArrayList<M_orderDTO> getOrders(String order_id){
		
		ArrayList<M_orderDTO> oList = new ArrayList<>();
		
		try {
			
			getConnection();
			String sql ="SELECT * FROM m_order_id i NATURAL JOIN m_order o WHERE order_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				M_orderDTO oDTO = new M_orderDTO();
				
				oDTO.setDate(rs.getDate("date"));
				oDTO.setCategory(rs.getString("category"));
				oDTO.setEmail(rs.getString("email"));
				oDTO.setItem(rs.getString("item"));
				oDTO.setName(rs.getString("name"));
				oDTO.setNo(rs.getInt("no"));
				oDTO.setOrder_id(order_id);
				oDTO.setPrice(rs.getInt("price"));
				oDTO.setQuantity(rs.getInt("quantity"));
				
				oList.add(oDTO);
			
			}
			
		} catch (Exception e) {
			System.out.println("error in MItemStockUpdate :"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return oList;
	}
	
	public ArrayList<M_orderDTO> selectOrderInfo(String email){
		
		ArrayList<M_orderDTO> oList = new ArrayList<>();
		
		try {
			getConnection();
			String sql ="SELECT * FROM m_order_id i NATURAL JOIN m_order o WHERE email=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				M_orderDTO oDTO = new M_orderDTO();
				
				oDTO.setDate(rs.getDate("date"));
				oDTO.setCategory(rs.getString("category"));
				oDTO.setEmail(rs.getString("email"));
				oDTO.setItem(rs.getString("item"));
				oDTO.setName(rs.getString("name"));
				oDTO.setNo(rs.getInt("no"));
				oDTO.setOrder_id(rs.getString("order_id"));
				oDTO.setPrice(rs.getInt("price"));
				oDTO.setQuantity(rs.getInt("quantity"));
				
				oList.add(oDTO);
			}
			
		} catch (Exception e) {
			System.out.println("error in selectOrderInfo");
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return oList;
	}
}


