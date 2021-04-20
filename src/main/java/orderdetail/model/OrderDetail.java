package orderdetail.model;

public class OrderDetail {

	private int odnum; // 주문 상세 번호
	private int onum; // 주문 번호
	private int pnum; // 상품 번호
	private String oday; // 관람 날짜
	private String otime; // 관람 시간
	private int oqty; // 주문 수량

	public int getOdnum() {
		return odnum;
	}

	public void setOdnum(int odnum) {
		this.odnum = odnum;
	}

	public int getOnum() {
		return onum;
	}

	public void setOnum(int onum) {
		this.onum = onum;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getOday() {
		return oday;
	}

	public void setOday(String oday) {
		this.oday = oday;
	}

	public String getOtime() {
		return otime;
	}

	public void setOtime(String otime) {
		this.otime = otime;
	}

	public int getOqty() {
		return oqty;
	}

	public void setOqty(int oqty) {
		this.oqty = oqty;
	}
	
}
