package cargo.common.DTO;


public class M_cartDTO {
	
	int price, quantity; // price = 아이템 당 가격 총 금액
	String item, name, category, email, image;
	
	public M_cartDTO() {
	}
	
	public M_cartDTO(int price, int quantity, String item, String name, String category, String email, String image) {
		super();
		this.price = price;
		this.quantity = quantity;
		this.item = item;
		this.name = name;
		this.category = category;
		this.email = email;
		this.image = image;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
	

}
