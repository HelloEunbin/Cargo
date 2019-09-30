package cargo.common.DTO;

import java.sql.Timestamp;

public class M_board_replyDTO {
	
	int no, board_no;
	String content, email, name;
	Timestamp date;
	
	public M_board_replyDTO(){
		
	}
	 

	public M_board_replyDTO(int no, int board_no, String content, String email, String name, Timestamp date) {
		super();
		this.no = no;
		this.board_no = board_no;
		this.content = content;
		this.email = email;
		this.name = name;
		this.date = date;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
	
	
	
	
}
