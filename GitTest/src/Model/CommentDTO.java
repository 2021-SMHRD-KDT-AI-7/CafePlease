package Model;

import java.util.Date;

public class CommentDTO {

	private int comment_seq;
	private int article_seq;
	private String comment_content;
	private Date reg_date;
	private String m_id;
	
	public CommentDTO(int comment_seq, int article_seq, String comment_content, Date reg_date, String m_id) {
		super();
		this.comment_seq = comment_seq;
		this.article_seq = article_seq;
		this.comment_content = comment_content;
		this.reg_date = reg_date;
		this.m_id = m_id;
	}

	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
	}
	public int getArticle_seq() {
		return article_seq;
	}
	public void setArticle_seq(int article_seq) {
		this.article_seq = article_seq;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	
	
	
}
