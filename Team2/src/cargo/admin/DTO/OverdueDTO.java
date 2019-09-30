package cargo.admin.DTO;

import java.sql.Date;

/*연체된 정보를 받아오는 DTO*/
public class OverdueDTO {
	/*연체 정보들*/
	private int overdue_day; //예정된 수령일로부터 얼마나 지났는지 (단위 : 일)	
	private int arrears; //연체된 금액 overdue*해당 동 하루 가격
	private int now_deposit; //처음에 받은 보증금에서 연체된 금액을 뺀 값 
	
	/*Warehouse*/
	private String house;
	private int price;
	
	/*Member*/
	private String email,name,phone,detailAddr,roadAddr;
	private int postCode;
	
	/*Items*/
	private Date start_day, end_day;
	private int payment, item_price;
	private String item;
	
	//연체만 따로 저장하는 창고위치 알려주는 컬럼(연체되서 옮기면 이 칼럼에 그 위치 추가)
	private String overdue; 

	public OverdueDTO(){}
	
	public OverdueDTO(int overdue_day, int arrears, int now_deposit) {
		this.overdue_day = overdue_day;
		this.arrears = arrears;
		this.now_deposit = now_deposit;
	}

	public int getOverdue_day() {
		return overdue_day;
	}

	public void setOverdue_day(int overdue_day) {
		this.overdue_day = overdue_day;
	}

	public int getArrears() {
		return arrears;
	}

	public void setArrears(int arrears) {
		this.arrears = arrears;
	}

	public int getNow_deposit() {
		return now_deposit;
	}

	public void setNow_deposit(int now_deposit) {
		this.now_deposit = now_deposit;
	}

	public String getHouse() {
		return house;
	}

	public void setHouse(String house) {
		this.house = house;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public String getRoadAddr() {
		return roadAddr;
	}

	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public Date getStart_day() {
		return start_day;
	}

	public void setStart_day(Date start_day) {
		this.start_day = start_day;
	}

	public Date getEnd_day() {
		return end_day;
	}

	public void setEnd_day(Date end_day) {
		this.end_day = end_day;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getOverdue() {
		return overdue;
	}

	public void setOverdue(String overdue) {
		this.overdue = overdue;
	}

	
}
