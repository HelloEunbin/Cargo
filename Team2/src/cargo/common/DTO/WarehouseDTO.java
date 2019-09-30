package cargo.common.DTO;

public class WarehouseDTO {
	private String house,area;
	private int price,height,isEmpty;
	public WarehouseDTO(){}
	public WarehouseDTO(String house, String area, int price, int height, int isEmpty) {
		this.house = house;
		this.area = area;
		this.price = price;
		this.height = height;
		this.isEmpty = isEmpty;
	}
	public String getHouse() {
		return house;
	}
	public void setHouse(String house) {
		this.house = house;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getIsEmpty() {
		return isEmpty;
	}
	public void setIsEmpty(int isEmpty) {
		this.isEmpty = isEmpty;
	}
}
