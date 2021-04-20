package exhibition.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

public class Exhibition {
	
	private int num;
	@NotEmpty(message = "선택필수")
	private String category;
	@NotBlank(message = "필수기재사항")
	private String name;
	@NotEmpty(message = "선택필수")
	private String start_period;
	@NotEmpty(message = "선택필수")
	private String end_period;
	@NotEmpty(message = "선택필수")
	private String start_time;
	@NotEmpty(message = "선택필수")
	private String end_time;
	@NotBlank(message = "필수기재사항")
	private String place;
	@NotBlank(message = "필수기재사항")
	private String company;
	@NotNull(message = "필수기재사항")
	@Min(value=5000, message="5000원이상 기재가능")
	private int price;
	
	private String area_tel;
	@NotBlank(message = "필수기재사항")
	private String tel1;
	@NotBlank(message = "필수기재사항")
	private String tel2;
	@NotEmpty(message = "화일 선택 안함")
	private String img;
	private String style;
	private String contents;
	private MultipartFile upload;
	
	private String upload2;
	
	public String getUpload2() {
		return upload2;
	}

	public void setUpload2(String upload2) {
		this.upload2 = upload2;
	}

	public Exhibition() {
		super();
	}
	
	public Exhibition(int num, String category, String name, String start_period, String end_period, String start_time,
			String end_time, String place, String company, int price, String area_tel, String tel1, String tel2,
			String img, String style, String contents) {
		super();
		this.num = num;
		this.category = category;
		this.name = name;
		this.start_period = start_period;
		this.end_period = end_period;
		this.start_time = start_time;
		this.end_time = end_time;
		this.place = place;
		this.company = company;
		this.price = price;
		this.area_tel = area_tel;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.img = img;
		this.style = style;
		this.contents = contents;
	}
	
	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		this.img = upload.getOriginalFilename();	
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStart_period() {
		return start_period;
	}
	public void setStart_period(String start_period) {
		this.start_period = start_period;
	}
	public String getEnd_period() {
		return end_period;
	}
	public void setEnd_period(String end_period) {
		this.end_period = end_period;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getArea_tel() {
		return area_tel;
	}
	public void setArea_tel(String area_tel) {
		this.area_tel = area_tel;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
	
	
}
