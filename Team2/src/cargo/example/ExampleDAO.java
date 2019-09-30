package cargo.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ExampleDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String sql;
	
	//연결 메서드 따로있습니다..
	private Connection connect() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jspbeginner");
		return ds.getConnection();
	}

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
	}//end of free
	
	public ExampleDTO exerciseDispatcher(ExampleDTO edto){
		ExampleDTO dto = null;
		try {	
/*			
  			con = connect();
 			String sql = "sql 구문";
			pstmt = con.prepareStatement(sql);
			
			//디비의 값만 변경하는 경우
			pstmt.executeUpdate();
			
			
			//디비에서 값이 반환되는 경우
			rs=pstmt.executeQuery();
			while (rs.next()) {
			ExampleDTO edto  = new ExampleDTO();
			edto.setGo(rs.getInt("go"));
			}
*/
	
			//대충 디비에 넣어주고 뭐 받아왔다고 칩시다.
			dto = new ExampleDTO(edto.getGo()+10);
			
		} catch (Exception e) {
			System.out.println("exerciseDispatcher err:"+e.getMessage());
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return dto;
	}//end of exerciseOne
	
	public int exerciseSendRedirect(ExampleDTO edto){
		int result=0;
		try {
		/*			
			con = connect();
			String sql = "sql 구문";
		pstmt = con.prepareStatement(sql);
		
		//디비의 값만 변경하는 경우
		pstmt.executeUpdate();
		
		
		//디비에서 값이 반환되는 경우
		rs=pstmt.executeQuery();
		while (rs.next()) {
		ExampleDTO edto  = new ExampleDTO();
		edto.setGo(rs.getInt("go"));
		}
		
		지금은 DB에 값을 넣어주고 성공 여부를 1/0으로 return 하는 상황이라고 칩시다
		int result = pstmt.executeUpdate(); 이런식으로..
		 */
			
		result = 1;//성공!
		} catch (Exception e) {
			System.out.println("exerciseSendRedirect err:"+e.getMessage());
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return result;
	}//end of exerciseSendRedirect
	
	public String exerciseAjax(ExampleDTO edto){
		String result="";
		try {
			/*			
			con = connect();
			String sql = "sql 구문";
			pstmt = con.prepareStatement(sql);
			
			//디비의 값만 변경하는 경우
			pstmt.executeUpdate();
			
			
			//디비에서 값이 반환되는 경우
			rs=pstmt.executeQuery();
			while (rs.next()) {
			ExampleDTO edto  = new ExampleDTO();
			edto.setGo(rs.getInt("go"));
			}
			*/
			
			//가공~!~!
			result = Integer.toString(edto.getGo()+20);
			} catch (Exception e) {
				System.out.println("exerciseAjax err:"+e.getMessage());
				e.printStackTrace();
			}finally {
				freeResource();
			}
		return result;
	}//end of exerciseAjax
}
