package cate.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

public class Cate {
	private int num;
	@NotBlank(message = "입력누락입니다.")
	private String kind;
	@NotBlank(message = "입력누락입니다.")
	@Pattern(regexp = "[A-Z0-9]*", message = "대문자와 숫자조합으로 입력해주세요.")
	private String code;
	
	public Cate() {
		super();
	}
	
	public Cate(int num, String kind, String code) {
		super();
		this.num = num;
		this.kind = kind;
		this.code = code;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
