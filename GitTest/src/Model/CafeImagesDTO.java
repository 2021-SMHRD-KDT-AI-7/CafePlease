package Model;

import java.util.Date;

public class CafeImagesDTO {

	private String pic_id;
	private String pic_path;
	private int pic_type;
	private Date reg_date;
	
	public CafeImagesDTO(String pic_id, String pic_path, int pic_type, Date reg_date) {
		super();
		this.pic_id = pic_id;
		this.pic_path = pic_path;
		this.pic_type = pic_type;
		this.reg_date = reg_date;
	}

	public CafeImagesDTO(String pic_id, String pic_path) {
		super();
		this.pic_id = pic_id;
		this.pic_path = pic_path;
	}
	
	public String getPic_id() {
		return pic_id;
	}

	public void setPic_id(String pic_id) {
		this.pic_id = pic_id;
	}

	public String getPic_path() {
		return pic_path;
	}

	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}

	public int getPic_type() {
		return pic_type;
	}

	public void setPic_type(int pic_type) {
		this.pic_type = pic_type;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
