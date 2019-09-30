package cargo.admin.DTO;

public class ChartDTO {
	private String month;
	private int APayment=0;
	private int BPayment=0;
	private int CPayment=0;
	private int DPayment=0;
	
	public ChartDTO(String month) {
		this.month = month;
	}
	
	public ChartDTO(){}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getAPayment() {
		return APayment;
	}

	public void setAPayment(int aPayment) {
		APayment = aPayment;
	}

	public int getBPayment() {
		return BPayment;
	}

	public void setBPayment(int bPayment) {
		BPayment = bPayment;
	}

	public int getCPayment() {
		return CPayment;
	}

	public void setCPayment(int cPayment) {
		CPayment = cPayment;
	}

	public int getDPayment() {
		return DPayment;
	}

	public void setDPayment(int dPayment) {
		DPayment = dPayment;
	}

	public String toComboArray() {
		int total = APayment+BPayment+CPayment+DPayment;
		return "['"+month + "' ," + APayment + "," + BPayment + "," + CPayment + "," + DPayment + ","+total+"]";
	}
}
