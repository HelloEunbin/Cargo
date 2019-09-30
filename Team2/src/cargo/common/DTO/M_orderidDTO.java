package cargo.common.DTO;

public class M_orderidDTO {
	String order_id, email;
	
	public M_orderidDTO() {
	}

	public M_orderidDTO(String order_id, String email) {
		super();
		this.order_id = order_id;
		this.email = email;
	}

	public String getOrder_id() {
		return order_id;
	}

	public String getEmail() {
		return email;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
