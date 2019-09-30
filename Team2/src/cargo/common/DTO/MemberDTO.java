package cargo.common.DTO;

import java.sql.Timestamp;

public class MemberDTO {
	private String email,pwd,name,phone,detailAddr,roadAddr;
	private int postCode,admin;
	private Timestamp reg_date;
	
	public MemberDTO(){}
	public MemberDTO(String email, String pwd, String name, String phone, int postCode, 
			String roadAddr, String detailAddr, int admin, Timestamp reg_date) {
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.detailAddr = detailAddr;
		this.roadAddr = roadAddr;
		this.postCode = postCode;
		this.admin = admin;
		this.reg_date = reg_date;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
