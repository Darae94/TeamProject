package order.model;

// 주문 정보
public class Order {

	private int onum; // 주문 번호
	private String mid;// 회원 아이디
	private String odate; // 주문 날짜

	public int getOnum() {
		return onum;
	}

	public void setOnum(int onum) {
		this.onum = onum;
	}
	
	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getOdate() {
		return odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}
	
}
