package cargo.common.DTO;

import java.sql.Timestamp;

public class M_boardDTO {

	int no, onStock;
	Timestamp date;
	String item, title, content, image;
	
	public M_boardDTO(){
		
	}
	
	public M_boardDTO(int no, int onStock, Timestamp date, String item, String title, String content, String image) {
		super();
		this.no = no;
		this.onStock = onStock;
		this.date = date;
		this.item = item;
		this.title = title;
		this.content = content;
		this.image = image;
	}
	
	public M_boardDTO(Timestamp date, String item, String title, String content, String image) {
		super();
		this.date = date;
		this.item = item;
		this.title = title;
		this.content = content;
		this.image = image;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getOnStock() {
		return onStock;
	}

	public void setOnStock(int onStock) {
		this.onStock = onStock;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
	
	
}
