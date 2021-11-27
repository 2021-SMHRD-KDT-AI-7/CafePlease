package Model;

public class jjimDTO {

	private String m_id;
	private String cafe_id;
	private String cafe_name;
	private String cafeimages;
	
	public jjimDTO(String m_id, String cafe_id) {
		super();
		this.m_id = m_id;
		this.cafe_id = cafe_id;
	}

	public jjimDTO(String cafe_id) {
		super();
		this.cafe_id = cafe_id;
	}

	public jjimDTO(String m_id, String cafe_id, String cafe_name, String cafeimages) {
		super();
		this.m_id = m_id;
		this.cafe_id = cafe_id;
		this.cafe_name = cafe_name;
		this.cafeimages = cafeimages;
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

	public String getCafe_name() {
		return cafe_name;
	}

	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}

	public String getCafeimages() {
		return cafeimages;
	}

	public void setCafeimages(String cafeimages) {
		this.cafeimages = cafeimages;
	}

	
}
