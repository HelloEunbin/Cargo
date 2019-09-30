package cargo.common.DTO;

import java.sql.Date;

public class ReservationDTO {
	private String email,house;
	private int num,payment;
	private Date start_day,end_day,res_day;
	public ReservationDTO(){}
	public ReservationDTO(String email, String house, int num, int payment, Date start_day, Date end_day,
			Date res_day) {
		this.email = email;
		this.house = house;
		this.num = num;
		this.payment = payment;
		this.start_day = start_day;
		this.end_day = end_day;
		this.res_day = res_day;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHouse() {
		return house;
	}
	public void setHouse(String house) {
		this.house = house;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
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
	public Date getRes_day() {
		return res_day;
	}
	public void setRes_day(Date res_day) {
		this.res_day = res_day;
	}
}
