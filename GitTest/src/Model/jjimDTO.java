package Model;

public class jjimDTO {

	private String m_id;
	private String cafe_id;
	
	public jjimDTO(String m_id, String cafe_id) {
		super();
		this.m_id = m_id;
		this.cafe_id = cafe_id;
	}

	public jjimDTO(String cafe_id) {
		super();
		this.cafe_id = cafe_id;
	}


	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getCafe_id() {
		return cafe_id;
	}

	public void setCafe_id(String cafe_id) {
		this.cafe_id = cafe_id;
	}
	
}
