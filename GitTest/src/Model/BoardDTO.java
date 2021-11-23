package Model;

import java.util.Date;

public class BoardDTO {
	
	private int article_seq;
	private String article_title;
	private String article_content;
	private Date article_date;
	private int article_cnt;
	private String m_id;
	private String article_file1;
	private String article_file2;
	private String article_file3;
	
	public BoardDTO(int article_seq, String article_title, String article_content, Date article_date, int article_cnt,
			String m_id, String article_file1, String article_file2, String article_file3) {
		this.article_seq = article_seq;
		this.article_title = article_title;
		this.article_content = article_content;
		this.article_date = article_date;
		this.article_cnt = article_cnt;
		this.m_id = m_id;
		this.article_file1 = article_file1;
		this.article_file2 = article_file2;
		this.article_file3 = article_file3;
	}
	
	public BoardDTO(String article_title, String article_content, String m_id, String article_file1,
			String article_file2, String article_file3) {
		this.article_title = article_title;
		this.article_content = article_content;
		this.m_id = m_id;
		this.article_file1 = article_file1;
		this.article_file2 = article_file2;
		this.article_file3 = article_file3;
	}

	public int getArticle_seq() {
		return article_seq;
	}
	public void setArticle_seq(int article_seq) {
		this.article_seq = article_seq;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public String getArticle_content() {
		return article_content;
	}
	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}
	public Date getArticle_date() {
		return article_date;
	}
	public void setArticle_date(Date article_date) {
		this.article_date = article_date;
	}
	public int getArticle_cnt() {
		return article_cnt;
	}
	public void setArticle_cnt(int article_cnt) {
		this.article_cnt = article_cnt;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getArticle_file1() {
		return article_file1;
	}
	public void setArticle_file1(String article_file1) {
		this.article_file1 = article_file1;
	}
	public String getArticle_file2() {
		return article_file2;
	}
	public void setArticle_file2(String article_file2) {
		this.article_file2 = article_file2;
	}
	public String getArticle_file3() {
		return article_file3;
	}
	public void setArticle_file3(String article_file3) {
		this.article_file3 = article_file3;
	}
	
	

}
