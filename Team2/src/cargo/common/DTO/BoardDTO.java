package cargo.common.DTO;

import java.sql.Timestamp;


public class BoardDTO {

	
	String item, title, content;
	Timestamp date;
	String path;
	int no;
	
	public BoardDTO() {
	}

	
	public BoardDTO(String item, String title, String content, Timestamp date, String path) {
		super();
		this.item = item;
		this.title = title;
		this.content = content;
		this.date = date;
		this.path = path;
	}


	public String getItem() {
		return item;
	}


	public void setItem(String item) {
		this.item = item;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
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


	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}



	
	
}
