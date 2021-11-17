package Model;

import java.util.Date;

public class ReviewDTO {
	
	private int review_seq;
	private String review_content;
	private int cafe_ratings;
	private String review_pic;
	private String m_id;
	private Date reg_date;
	private String cafe_code;
	
	public ReviewDTO(int review_seq, String review_content, int cafe_ratings, String review_pic, String m_id,
			Date reg_date, String cafe_code) {
		super();
		this.review_seq = review_seq;
		this.review_content = review_content;
		this.cafe_ratings = cafe_ratings;
		this.review_pic = review_pic;
		this.m_id = m_id;
		this.reg_date = reg_date;
		this.cafe_code = cafe_code;
	}
	
	public int getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getCafe_ratings() {
		return cafe_ratings;
	}
	public void setCafe_ratings(int cafe_ratings) {
		this.cafe_ratings = cafe_ratings;
	}
	public String getReview_pic() {
		return review_pic;
	}
	public void setReview_pic(String review_pic) {
		this.review_pic = review_pic;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getCafe_code() {
		return cafe_code;
	}
	public void setCafe_code(String cafe_code) {
		this.cafe_code = cafe_code;
	}
	
	
}
