package cargo.board.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cargo.common.DTO.BoardnDTO;

public class BoardnDAO {

   private Connection con;
   private PreparedStatement pstmt;
   private ResultSet rs;
   String sql;
   
   
    private void getConnection(){
         
         Context init;
         try {
            init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
            con = ds.getConnection();
            
         } catch (Exception e) {
            System.out.println("Error in getConnection()");
            e.printStackTrace();
         }
         
      }
   
    //자원해제
     private void closeDB(){
         try {
            if(pstmt != null) pstmt.close();
            if(con != null) con.close();
            if(rs != null) rs.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
         
      }// close
     
     
   public int AddBoardn(BoardnDTO bnDTO) {
      int no=0;//글번호 저장
      System.out.println("add Start");
         try {
            //e디비연결 메서드 호출
            getConnection();
            sql="select max(no) from boardn";   //가장큰 글번호 가져오기
            pstmt = con.prepareStatement(sql);
            //rs 실행 저장
            rs = pstmt.executeQuery();
            //데이터 있으면 num=max(num)+1  없으면 num=1
            if(rs.next()){
               no=rs.getInt(1)+1; //글번호 최대값 +1
            }else{
               no=1;       //글이없을경우
            }
            //insert
            sql = "insert into boardn"
                  +"(no, name,email, subject, content, date)"
                  +"values(?,?,?,?,?,?)";
            
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, no); //num
            pstmt.setString(2, bnDTO.getName());
            pstmt.setString(3, bnDTO.getEmail());
            pstmt.setString(4, bnDTO.getSubject());
            pstmt.setString(5, bnDTO.getContent());
            pstmt.setTimestamp(6, bnDTO.getDate());
          
            
            //실행
            pstmt.executeUpdate();
            System.out.println("문의게시판 " + no + "번 글 작성 완료");
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
            closeDB();
      }return no;
      
   }//add

   public int getNoticeCount() {
      int count=0;
      try {
            //12디비연걸
            getConnection();
            //3 sql 글개수 가져오기 
            sql="SELECT COUNT(*) FROM boardn";
            pstmt=con.prepareStatement(sql);
            //4 rs 실행저장
            rs=pstmt.executeQuery();
            //5 rs데이터 있으면 count 저장
            if(rs.next()){
               count=rs.getInt(1);
            }      
            System.out.println("작성된 글 수 : " + count);
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
            closeDB();
         }
         return count;
           
   }

   public ArrayList<BoardnDTO> getNoticeList(int currentPage, int pagePerRow) {
      ArrayList<BoardnDTO> list = new ArrayList<BoardnDTO>();
      
      try {
         getConnection();
         sql = "select * from boardn ORDER BY no desc LIMIT ?,?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, (currentPage-1)*pagePerRow);
         pstmt.setInt(2, pagePerRow);
         rs = pstmt.executeQuery();
         
         while(rs.next()){
            BoardnDTO bnDto = new BoardnDTO();
            bnDto.setNo(rs.getInt("no"));
            bnDto.setSubject(rs.getString("subject"));
            bnDto.setName(rs.getString("name"));
            bnDto.setDate(rs.getTimestamp("date"));
            list.add(bnDto);      
         }      
         
      } catch (Exception e) {
         e.printStackTrace();
      }finally {   
         closeDB();
      }
      return list;
   }

   public BoardnDTO getBoardn(int no) {
      BoardnDTO bnDTO =null;
      try{
         getConnection();
         pstmt = con.prepareStatement(
               "select no, name, subject, content, date, email from boardn where no=?");
         pstmt.setInt(1, no);
         rs= pstmt.executeQuery();
       if(rs.next()){
         bnDTO = new BoardnDTO();
            bnDTO.setNo(rs.getInt("no"));
            bnDTO.setName(rs.getString("name"));
            bnDTO.setSubject(rs.getString("subject"));
            bnDTO.setContent(rs.getString("content"));
            bnDTO.setDate(rs.getTimestamp("date"));
         }
      }catch(Exception e){
         e.printStackTrace();
      }finally{
         closeDB();
      }
      
      
      return bnDTO;
   }

   public int updateBoard(BoardnDTO bnDTO) {
      int row =0;
      
      try {
         getConnection();
         sql = "update boardn SET subject=?, content=? where no=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, bnDTO.getSubject());
         pstmt.setString(2, bnDTO.getContent());
         pstmt.setInt(3, bnDTO.getNo());
         row = pstmt.executeUpdate();
         System.out.println("수정완료");
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("updat에서 오류");
      }finally {
         closeDB();
      }
      
      return row;
   }

   public int delBoard(int no) {
      int row = 0;
      
      try{
         getConnection();
         sql = "delete from boardn where no=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, no);
         row = pstmt.executeUpdate();
         System.out.print("삭제완료");
      }catch (Exception e) {
         e.printStackTrace();
         System.out.print("del에서 오류");
      }finally {
         closeDB();
      }
      
      return row;
   }

public ArrayList<BoardnDTO> getSearch(int currentPage, int pagePerRow, String search) {
		ArrayList<BoardnDTO> list = new ArrayList<BoardnDTO>();
		
		try {
			getConnection();
			sql = "select * from boardn where subject or name like ? order by no limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, (currentPage-1)*pagePerRow);
			pstmt.setInt(3, pagePerRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardnDTO bqDto = new BoardnDTO();
				bqDto.setNo(rs.getInt("no"));
				bqDto.setSubject(rs.getString("subject"));
				bqDto.setName(rs.getString("name"));
				bqDto.setDate(rs.getTimestamp("date"));
				list.add(bqDto);		
			}		
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {	
			closeDB();
		}
		return list;
	}

   
   
}//dao
