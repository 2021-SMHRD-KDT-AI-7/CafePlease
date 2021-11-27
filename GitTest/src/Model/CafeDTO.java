package Model;

import java.util.Date;

public class CafeDTO {
	
	private String cafe_id;
	private String cafe_name;
	private String cafe_pohne;
	private String cafe_running_time;
	private String cafe_info;
	private String cafe_menu;
	private Double cafe_latitude;
	private Double cafe_longitude;
	private String cafe_addr;
	private Date reg_date;
	private String cafe_pic;
	public CafeDTO(String cafe_id, String cafe_name, String cafe_pohne, String cafe_running_time, String cafe_info,
			String cafe_menu, Double cafe_latitude, Double cafe_longitude, String cafe_addr, Date reg_date,String cafe_pic) {
		super();
		this.cafe_id = cafe_id;
		this.cafe_name = cafe_name;
		this.cafe_pohne = cafe_pohne;
		this.cafe_running_time = cafe_running_time;
		this.cafe_info = cafe_info;
		this.cafe_menu = cafe_menu;
		this.cafe_latitude = cafe_latitude;
		this.cafe_longitude = cafe_longitude;
		this.cafe_addr = cafe_addr;
		this.reg_date = reg_date;
		this.cafe_pic = cafe_pic;
	}
	public String getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(String cafe_id) {
		this.cafe_id = cafe_id;
	}
	public String getCafe_name() {
		return cafe_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public String getCafe_pohne() {
		return cafe_pohne;
	}
	public void setCafe_pohne(String cafe_pohne) {
		this.cafe_pohne = cafe_pohne;
	}
	public String getCafe_running_time() {
		return cafe_running_time;
	}
	public void setCafe_running_time(String cafe_running_time) {
		this.cafe_running_time = cafe_running_time;
	}
	public String getCafe_info() {
		return cafe_info;
	}
	public void setCafe_info(String cafe_info) {
		this.cafe_info = cafe_info;
	}
	public String getCafe_menu() {
		return cafe_menu;
	}
	public void setCafe_menu(String cafe_menu) {
		this.cafe_menu = cafe_menu;
	}
	public Double getCafe_latitude() {
		return cafe_latitude;
	}
	public void setCafe_latitude(Double cafe_latitude) {
		this.cafe_latitude = cafe_latitude;
	}
	public Double getCafe_longitude() {
		return cafe_longitude;
	}
	public void setCafe_longitude(Double cafe_longitude) {
		this.cafe_longitude = cafe_longitude;
	}
	public String getCafe_addr() {
		return cafe_addr;
	}
	public void setCafe_addr(String cafe_addr) {
		this.cafe_addr = cafe_addr;
	}
	public String getCafe_pic() {
		return cafe_pic;
	}
	public void setCafe_pic(String cafe_pic) {
		this.cafe_pic = cafe_pic;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}