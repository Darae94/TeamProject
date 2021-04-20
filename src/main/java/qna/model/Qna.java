package qna.model;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

public class Qna{
	private int no;
	
	@NotBlank(message = "※ 카테고리 선택 누락")
	private String category;
	
	@NotBlank(message = "※ 질문입력은 필수입니다")
	private String question;
	
	@NotBlank(message = "※ 답변입력은 필수입니다")
	private String answer;
	
	private Date regdate;
	
	public Qna() {
		super();
	}

	public Qna(int no, String category, String question, String answer, Date regdate) {
		super();
		this.no = no;
		this.category = category;
		this.question = question;
		this.answer = answer;
		this.regdate = regdate;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
