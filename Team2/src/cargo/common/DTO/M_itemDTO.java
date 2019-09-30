package cargo.common.DTO;

public class M_itemDTO {
	
	int price, stock;
	String item, name, category;
	
	public M_itemDTO() {
	}
	
	public M_itemDTO(int price, int stock, String item, String name, String category) {
		this.price = price;
		this.stock = stock;
		this.item = item;
		this.name = name;
		this.category = category;
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
	
	
	
	

}
