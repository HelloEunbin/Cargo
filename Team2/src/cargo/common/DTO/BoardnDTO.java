package cargo.common.DTO;

import java.sql.Timestamp;

public class BoardnDTO {

	int no;
	String name;
	String email;
	String subject;
	String content;
	Timestamp date;
	
	public BoardnDTO(){}
	public BoardnDTO(int no, String name, String subject, String content, Timestamp date, String email){
		this.no = no;
		this.name= name;
		this.subject = subject;
		this.content = content;
		this.date = date;
		this.email = email;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
}
