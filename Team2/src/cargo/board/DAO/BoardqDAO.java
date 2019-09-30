package cargo.board.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cargo.common.DTO.BoardqDTO;


public class BoardqDAO {
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
   
   public int AddBoardq(BoardqDTO bqDTO){
      int no=0;//글번호 저장
      System.out.println("add Start");
         try {
            //e디비연결 메서드 호출
            getConnection();
            sql="select max(no) from boardq";   //가장큰 글번호 가져오기
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
            sql = "insert into boardq"
                  +"(no, name,email, subject, content, secret ,re_ref, re_lev, re_seq, date)"
                  +"values(?,?,?,?,?,?,?,0,0,?)";
            
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, no); //num
            pstmt.setString(2, bqDTO.getName());
            pstmt.setString(3, bqDTO.getEmail());
            pstmt.setString(4, bqDTO.getSubject());
            pstmt.setString(5, bqDTO.getContent());
            pstmt.setInt(6, bqDTO.getSecret());
            pstmt.setInt(7, no);   //num 주글번호 기준 re_ref그룹번호
            pstmt.setTimestamp(8, bqDTO.getDate());
          
            
            //실행
            pstmt.executeUpdate();
            System.out.println("문의게시판 " + no + "번 글 작성 완료");
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
            closeDB();
      }return no;
      
         
   }// addBoardq 끝

   
   
      public ArrayList<BoardqDTO> getQuestionList(int currentPage, int pagePerRow) {
          ArrayList<BoardqDTO> list = new ArrayList<BoardqDTO>();
          
      try {
         getConnection();
         sql = "select * from boardq order by re_ref desc, re_seq asc limit ?,?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, (currentPage-1)*pagePerRow);
         pstmt.setInt(2, pagePerRow);
         rs = pstmt.executeQuery();
         
         while(rs.next()){
            BoardqDTO bqDto = new BoardqDTO();
            bqDto.setNo(rs.getInt("no"));
            bqDto.setSubject(rs.getString("subject"));
            bqDto.setName(rs.getString("name"));
            bqDto.setDate(rs.getTimestamp("date"));
            bqDto.setSecret(rs.getInt("secret"));
            bqDto.setRe_lev(rs.getInt("re_lev"));
            list.add(bqDto);      
         }      
         
      } catch (Exception e) {
         e.printStackTrace();
      }finally {   
         closeDB();
      }
      return list;
   }

      public  int getQuestionCount() {
         int count=0;
         try {
               //12디비연걸
               getConnection();
               //3 sql 글개수 가져오기 
               sql="SELECT COUNT(*) FROM boardq";
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

      
      
      public BoardqDTO getBoardq(int no){
         BoardqDTO bqDTO =null;
         
         try{
            getConnection();
            pstmt = con.prepareStatement(
                  "select * from boardq where no=?");
            pstmt.setInt(1, no);
            rs= pstmt.executeQuery();
            
          if(rs.next()){
            bqDTO = new BoardqDTO();
               bqDTO.setNo(rs.getInt("no"));
               bqDTO.setName(rs.getString("name"));
               bqDTO.setSubject(rs.getString("subject"));
               bqDTO.setContent(rs.getString("content"));
               bqDTO.setRe_ref(rs.getInt("re_ref"));
               bqDTO.setRe_lev(rs.getInt("re_lev"));
               bqDTO.setRe_seq(rs.getInt("re_seq"));
               bqDTO.setSecret(rs.getInt("secret"));
               bqDTO.setDate(rs.getTimestamp("date"));
               bqDTO.setEmail(rs.getString("email"));

            }
         }catch(Exception e){
            e.printStackTrace();
         }finally{
            closeDB();
         }
         
         
         return bqDTO;
      }

      public int updateBoard(BoardqDTO bqDTO) {
         int row =0;
      
         try {
            getConnection();
            sql = "update boardq SET subject=?, content=?, secret=? where no=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bqDTO.getSubject());
            pstmt.setString(2, bqDTO.getContent());
            pstmt.setInt(3, bqDTO.getSecret());
            pstmt.setInt(4, bqDTO.getNo());
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
            sql = "delete from boardq where no=?";
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

      public void ReplayBoardq(BoardqDTO bqDTO) {
           int no=0;
            try {
               getConnection();
               /*답변글 글번호 구하기*/
               //기존글중 num이 가장 큰 글번호 가져오기
               sql="select max(no) from boardq";
               pstmt=con.prepareStatement(sql);
               rs=pstmt.executeQuery();
              
               //글번호가 있으면
               if (rs.next()) {
               //답변글번호 = 그글번호에 +1
                  no = rs.getInt(1)+1;
               }else{   //글번호가없으면
                        //답변 달 답변글번호를 1로 지정
                  no=1;
               }
               /*re_seq 답글순서 재배치*/
               //부모글 그룹과 같은 그룹이면서 부모글의 seq값보다 큰 답변글들은 seq값을 1증가시킨다
               sql="update boardq set re_seq=re_seq+1 where re_ref=? and re_seq>?";
               pstmt=con.prepareStatement(sql);
               pstmt.setInt(1, bqDTO.getRe_ref());   //부모글 그룹번호
               pstmt.setInt(2, bqDTO.getRe_seq());//부모글의 글 입력순서
               pstmt.executeUpdate();
               
               //답변글달기 insert// reseq+1 rslev+1 답글달기
               sql="insert into boardq values(?,?,?,?,?,?,?,?,?,?)";
               pstmt=con.prepareStatement(sql);
               pstmt.setInt(1, no);   //num
               pstmt.setString(2, bqDTO.getName());
               pstmt.setString(3, bqDTO.getEmail());
               pstmt.setString(4, bqDTO.getSubject());
               pstmt.setString(5, bqDTO.getContent());
               pstmt.setInt(6, bqDTO.getSecret());
               pstmt.setInt(7, bqDTO.getRe_ref());         //부모글 그룹번호 re_ref사용
               pstmt.setInt(8, bqDTO.getRe_lev()+1);      //부모글의 re_lev에 +1을 하여 들여쓰기
               pstmt.setInt(9, bqDTO.getRe_seq()+1);      //부모글의 re_seq에 +1을하여 답글을 단순서 정하기   
               pstmt.setTimestamp(10, bqDTO.getDate());
               //답변달기 실행
               pstmt.executeUpdate();
               
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
            closeDB();
         }
         }

      public ArrayList<BoardqDTO> getSearch(int currentPage, int pagePerRow, String search) {
         ArrayList<BoardqDTO> list = new ArrayList<BoardqDTO>();
          
         try {
            getConnection();
            sql = "select * from boardq where subject or name like ? order by re_ref desc, re_seq asc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%"+search+"%");
            pstmt.setInt(2, (currentPage-1)*pagePerRow);
            pstmt.setInt(3, pagePerRow);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
               BoardqDTO bqDto = new BoardqDTO();
               bqDto.setNo(rs.getInt("no"));
               bqDto.setSubject(rs.getString("subject"));
               bqDto.setName(rs.getString("name"));
               bqDto.setDate(rs.getTimestamp("date"));
               bqDto.setSecret(rs.getInt("secret"));
               list.add(bqDto);      
            }      
            
         } catch (Exception e) {
            e.printStackTrace();
         }finally {   
            closeDB();
         }
         return list;
      }
   
   
   

      
   
   
}//DAo