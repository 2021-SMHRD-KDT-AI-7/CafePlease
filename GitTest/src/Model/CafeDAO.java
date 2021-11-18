package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class CafeDAO {

	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	CafeDTO dto = null;
	MemberDAO dao = new MemberDAO();

	public CafeDTO CafeInfo(String somehing) { // 이미지를 누르면 카페이미지를 DTO에 담아서 JSP에 표현 하기

		dao.Db_conn();
		String sql = "select * from t_cafe where cafe_pic1=? or cafe_pic2=? or cafe_pic3=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,somehing);
			psmt.setString(2,somehing);
			psmt.setString(3,somehing);
			
			rs = psmt.executeQuery();
			if (rs.next()) {
				String cafe_code = rs.getString("cafe_code");
				String cafe_name = rs.getString("cafe_name");
				String cafe_phone = rs.getString("cafe_phone");
				String cafe_running_time = rs.getString("cafe_running_time");
				int cafe_latitude = rs.getInt("cafe_latitude");
				int cafe_longtitude = rs.getInt("cafe_longtitude");
				String cafe_addr = rs.getString("cafe_addr");
				String cafe_pic1 = rs.getString("cafe_pic1");
				String cafe_pic2 = rs.getString("cafe_pic2");
				String cafe_pic3 = rs.getString("cafe_pic3");
				String cafe_tag = rs.getString("cafe_tag");
				Date reg_date = rs.getDate("reg_date");
				String m_id = rs.getString("m_id");

				dto = new CafeDTO(cafe_code, cafe_name, cafe_phone, cafe_running_time, cafe_latitude, cafe_longtitude,
						cafe_addr, cafe_pic1, cafe_pic2, cafe_pic3, cafe_tag, reg_date, m_id);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dao.Db_close();
		}
		return dto;
	}
}
