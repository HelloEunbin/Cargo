package cargo.common.DTO;

import java.sql.Timestamp;

public class M_boardJoinDTO {

	// M_itemDTO
	int price, stock;
	String item, name, category;
	
	// M_boardDTO
	int no, onStock;
	Timestamp date;
	String title, content, image;
	
	public M_boardJoinDTO() {
	}
	
	public M_boardJoinDTO(int price, int stock, String item, String name, String category, int no, int onStock,
			Timestamp date, String title, String content, String image) {
		super();
		this.price = price;
		this.stock = stock;
		this.item = item;
		this.name = name;
		this.category = category;
		this.no = no;
		this.onStock = onStock;
		this.date = date;
		this.title = title;
		this.content = content;
		this.image = image;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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
