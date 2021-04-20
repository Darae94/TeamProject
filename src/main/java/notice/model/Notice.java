package notice.model;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

public class Notice {
	private int no;
	
	@NotBlank(message = "※ 제목을 입력하세요")
	private String title;
	
	@NotBlank(message = "※ 내용을 입력하세요")
	private String content;
	
	private Date regdate;
	private int viewcnt;
	private int imp;
	
	public Notice() {
		super();
	}

	public Notice(int no, String title, String content, Date regdate, int viewcnt, int imp) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
		this.imp = imp;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getImp() {
		return imp;
	}
	public void setImp(int imp) {
		this.imp = imp;
	}
	
}