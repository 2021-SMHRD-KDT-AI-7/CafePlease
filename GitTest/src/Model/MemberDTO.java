package Model;

import java.util.Date;

public class MemberDTO {
	
	private String m_id;
	private String m_pwd;
	private String m_nickname;
	private String m_gender;
	private int m_grade;
	private int m_point;
	private Date m_joindate;
	private String admin_yn;
	
	public MemberDTO(String m_id, String m_pwd, String m_nickname, String m_gender, int m_grade, int m_point,
			Date m_joindate, String admin_yn) {
		super();
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_nickname = m_nickname;
		this.m_gender = m_gender;
		this.m_grade = m_grade;
		this.m_point = m_point;
		this.m_joindate = m_joindate;
		this.admin_yn = admin_yn;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public int getM_grade() {
		return m_grade;
	}
	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}
	public int getM_point() {
		return m_point;
	}
	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	public Date getM_joindate() {
		return m_joindate;
	}
	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}
	public String getAdmin_yn() {
		return admin_yn;
	}
	public void setAdmin_yn(String admin_yn) {
		this.admin_yn = admin_yn;
	}
	

}
