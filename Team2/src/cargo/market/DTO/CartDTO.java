package cargo.market.DTO;

public class CartDTO {
	
	String item, name, category, img;
	int quantity, price;
	
	public CartDTO() {
	}
	
	public CartDTO(String item, String name, String category, String img, int quantity, int price) {
		super();
		this.item = item;
		this.name = name;
		this.img = img;
		this.category = category;
		this.quantity = quantity;
		this.price = price;
	}

	public String getItem() {
		return item;
	}
	public String getName() {
		return name;
	}
	public String getCategory() {
		return category;
	}
	public int getQuantity() {
		return quantity;
	}
	public int getPrice() {
		return price;
	}
	public String getImg(){
		return img;
	}
	public void setImg(String img){
		this.img = img;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public void setPrice(int price) {
		this.price = price;
	} 
	
	
	
}
