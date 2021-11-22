package Model;

import java.util.Date;

public class CafeDTO {
	
	private String cafe_code;
	private String cafe_name;
	private String cafe_phone;
	private String cafe_running_time;
	private int cafe_latitude;
	private int cafe_longtitude;
	private String cafe_addr;
	private String cafe_tag;
	private Date reg_date;
	public String getCafe_code() {
		return cafe_code;
	}
	
	public CafeDTO(String cafe_code, String cafe_name, String cafe_phone, String cafe_running_time, int cafe_latitude,
			int cafe_longtitude, String cafe_addr,String cafe_tag, Date reg_date) {
		super();
		this.cafe_code = cafe_code;
		this.cafe_name = cafe_name;
		this.cafe_phone = cafe_phone;
		this.cafe_running_time = cafe_running_time;
		this.cafe_latitude = cafe_latitude;
		this.cafe_longtitude = cafe_longtitude;
		this.cafe_addr = cafe_addr;
		this.cafe_tag = cafe_tag;
		this.reg_date = reg_date;
	}

	public void setCafe_code(String cafe_code) {
		this.cafe_code = cafe_code;
	}
	public String getCafe_name() {
		return cafe_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public String getCafe_phone() {
		return cafe_phone;
	}
	public void setCafe_phone(String cafe_phone) {
		this.cafe_phone = cafe_phone;
	}
	public String getCafe_running_time() {
		return cafe_running_time;
	}
	public void setCafe_running_time(String cafe_running_time) {
		this.cafe_running_time = cafe_running_time;
	}
	public int getCafe_latitude() {
		return cafe_latitude;
	}
	public void setCafe_latitude(int cafe_latitude) {
		this.cafe_latitude = cafe_latitude;
	}
	public int getCafe_longtitude() {
		return cafe_longtitude;
	}
	public void setCafe_longtitude(int cafe_longtitude) {
		this.cafe_longtitude = cafe_longtitude;
	}
	public String getCafe_addr() {
		return cafe_addr;
	}
	public void setCafe_addr(String cafe_addr) {
		this.cafe_addr = cafe_addr;
	}
	public String getCafe_tag() {
		return cafe_tag;
	}
	public void setCafe_tag(String cafe_tag) {
		this.cafe_tag = cafe_tag;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}