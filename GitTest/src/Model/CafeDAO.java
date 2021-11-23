package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class CafeDAO {

	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	CafeDTO dto = null;
	MemberDAO dao = new MemberDAO();

	public CafeDTO cafeimg_info(String img) { // 이미지를 누르면 카페이미지를 DTO에 담아서 JSP에 표현 하기
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String DB_id = "campus_c_b_1111";
			String DB_pw = "smhrd2";

			conn = DriverManager.getConnection(url, DB_id, DB_pw);

			System.out.println(img);
			String sql = "select *from t_cafe where cafe_id=(select cafe_id from t_cafe_img where pic_id =(select pic_id from t_cafeimages where pic_path=?) )";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, img);
			rs = psmt.executeQuery();

			if (rs.next()) {
				String cafe_id = rs.getString("cafe_id");
				String cafe_name = rs.getString("cafe_name");
				String cafe_phone = rs.getString("cafe_phone");
				String cafe_running_time = rs.getString("cafe_running_time");
				int cafe_latitude = rs.getInt("cafe_latitude");
				int cafe_longitude = rs.getInt("cafe_longitude");
				String cafe_addr = rs.getString("cafe_addr");
				String cafe_tag = rs.getString("cafe_tag");
				Date reg_date = rs.getDate("reg_date");

				dto = new CafeDTO(cafe_id, cafe_name, cafe_phone, cafe_running_time, cafe_latitude, cafe_longitude,
						cafe_addr, cafe_tag, reg_date);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dao.Db_close();
		}
		return dto;
	}

	public CafeDTO Cafesearch(String search_cafe) { // 카페이름을 입력하면 카페정보가 DTO타입으로 담아짐
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String DB_id = "campus_c_b_1111";
			String DB_pw = "smhrd2";

			conn = DriverManager.getConnection(url, DB_id, DB_pw);

			String sql = "select * from t_cafe where cafe_name=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, search_cafe);

			rs = psmt.executeQuery();
			if (rs.next()) {
				String cafe_id = rs.getString("cafe_id");
				String cafe_name = rs.getString("cafe_name");
				String cafe_phone = rs.getString("cafe_phone");
				String cafe_running_time = rs.getString("cafe_running_time");
				int cafe_latitude = rs.getInt("cafe_latitude");
				int cafe_longitude = rs.getInt("cafe_longitude");
				String cafe_addr = rs.getString("cafe_addr");
				String cafe_tag = rs.getString("cafe_tag");
				Date reg_date = rs.getDate("reg_date");

				dto = new CafeDTO(cafe_id, cafe_name, cafe_phone, cafe_running_time, cafe_latitude, cafe_longitude,
						cafe_addr, cafe_tag, reg_date);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dao.Db_close();
		}
		return dto;
	}
}
