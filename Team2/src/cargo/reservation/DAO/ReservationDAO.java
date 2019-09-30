package cargo.reservation.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cargo.common.DTO.ItemsDTO;
import cargo.common.DTO.ReservationDTO;
import cargo.common.DTO.WarehouseDTO;

public class ReservationDAO {
	
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
	
	public ArrayList<WarehouseDTO> getHouse(String warehouse){
		
		WarehouseDTO hBean;
		ArrayList<WarehouseDTO> hList = new ArrayList<>();
		
		try {
			
			getConnection();
			String sql = "SELECT * FROM warehouse WHERE house LIKE '"+warehouse+"%' ORDER BY house";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				hBean = new WarehouseDTO();
				
				hBean.setHouse(rs.getString("house"));
				hBean.setPrice(rs.getInt("price"));
				hBean.setArea(rs.getString("area"));
				hBean.setHeight(rs.getInt("height"));
				hBean.setIsEmpty(rs.getInt("isEmpty"));
				
				hList.add(hBean);
			}
			
		} catch (SQLException e) {
			System.out.println("Error in getHouse()");
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return hList;
	}
	
	public ArrayList<ItemsDTO> getCurReservation(String house){
		ItemsDTO idto;
		ArrayList<ItemsDTO> rList = new ArrayList<>();
		
		try {
			
			getConnection();
			String sql = "SELECT * FROM items WHERE house=? ORDER BY start_day";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, house);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				idto = new ItemsDTO();
				
				idto.setEmail(rs.getString("email"));
				idto.setEnd_day(rs.getDate("end_day"));
				idto.setHouse(rs.getString("house"));
				idto.setItem(rs.getString("item"));
				idto.setItem_price(rs.getInt("item_price"));
				idto.setPayment(rs.getInt("payment"));
				idto.setStart_day(rs.getDate("start_day"));
				
				rList.add(idto);
			}
			
			
		} catch (SQLException e) {
			System.out.println("Error in getReservation()");
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return rList;
	}
	
	public ArrayList<ReservationDTO> getReservation(String house){
		ReservationDTO rdto;
		ArrayList<ReservationDTO> rList2 = new ArrayList<>();
		
		try {
			
			getConnection();
			
			String sql = "SELECT * FROM reservation WHERE house=? ORDER BY start_day";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, house);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				rdto = new ReservationDTO();
				
				rdto.setEmail(rs.getString("email"));
				rdto.setEnd_day(rs.getDate("end_day"));
				rdto.setHouse(rs.getString("house"));
				rdto.setNum(rs.getInt("num"));
				rdto.setPayment(rs.getInt("payment"));
				rdto.setRes_day(rs.getDate("res_day"));
				rdto.setStart_day(rs.getDate("start_day"));
				
				rList2.add(rdto);
			}
			
			
		} catch (SQLException e) {
			System.out.println("Error in getReservation()");
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return rList2;
	}
	
	
	public void rsCheck(ReservationDTO rsdto){
        
        try {
        	getConnection();
           String sql = "INSERT INTO reservation (email, house, start_day, end_day, res_day, payment) "
                 + "VALUES(?,?,?,?,?,?)";
           
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, rsdto.getEmail());
           pstmt.setString(2, rsdto.getHouse());
           pstmt.setDate(3, rsdto.getStart_day());
           pstmt.setDate(4, rsdto.getEnd_day());
           pstmt.setDate(5, rsdto.getRes_day());
           pstmt.setInt(6, rsdto.getPayment());
           
           pstmt.executeUpdate();         
           
        } catch (Exception e) {
        	System.out.println("Error in rsCheck()");
        	e.printStackTrace();
        }finally{
           freeResource();
        }
     }
	
	public int rsPayment(String house) {
        
        int price = 0;
        
        try {
           
           getConnection();
           String sql = "SELECT price FROM warehouse WHERE house=?";
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, house);
           rs=pstmt.executeQuery();
           
           if(rs.next()) {
              price = rs.getInt(1);
           }
                 
        } catch (Exception e) {
        	System.out.println("Error in rsPayment()");
           e.printStackTrace();
        }finally{
           freeResource();
        }
        
        return price;
     }
	
	public int simplepayment(String house) {
        
        int price = 0;
        
        try {
           
           getConnection();
           String sql = "SELECT price FROM warehouse WHERE substr(house,1,1)=?"; //ABCD
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, house);
           rs = pstmt.executeQuery();
           
           if(rs.next()){
        	   price = rs.getInt(1);
           }
              
                 
        } catch (Exception e) {
        	System.out.println("Error in simplepayment()");
           e.printStackTrace();
        }finally{
           freeResource();
        }
        
        return price;
     }
	
	public String getMaxDateCalendar(String end_day, String house){
		String sql="select start_day"
				+ " from reservation"
				+ " where end_day > ? and house =?";
		
		String next_start_day = "null";
		try {
			getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, end_day);
			pstmt.setString(2, house);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				next_start_day = "'"+rs.getString(1)+"'";
			}
			
		} catch (Exception e) {
			System.out.println("getMaxDateCalendar Error: "+e.getMessage());
	        e.printStackTrace();
		}finally{
	           freeResource();
	    }
		
		return next_start_day;
	}//end of getMaxDateCalendar
	
	public int extendEnd_day(String state, String end_day, String payment, ArrayList<String> primary){
		int result =0;
		
		String sql="update "+state
				+ " set end_day =?, payment=payment+?"
				+ " where "+primary.get(0)+"=?";
		
		try {
			getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, end_day);
			pstmt.setString(2, payment);
			
			if("reservation".equals(state)){
				pstmt.setInt(3, Integer.parseInt(primary.get(1)));
			}else{
				pstmt.setString(3, primary.get(1));
			}
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("extendEnd_day Error: "+e.getMessage());
	        e.printStackTrace();
		}finally{
	           freeResource();
	    }
		return result;
	}
}
