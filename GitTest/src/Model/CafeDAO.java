package Model;

import java.net.URLEncoder;
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
	PicDTO dtoa = null;
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
				String cafe_phone = rs.getString("cafe_pohne");
				String cafe_running_time = rs.getString("cafe_running_time");
				String cafe_info = rs.getString("cafe_info");
				String cafe_menu = rs.getString("cafe_menu");
				Double cafe_latitude = rs.getDouble("cafe_latitude");
				Double cafe_longitude = rs.getDouble("cafe_longitude");
				String cafe_addr = rs.getString("cafe_addr");
				Date reg_date = rs.getDate("reg_date");
				String cafe_pic = rs.getString("cafe_pic");
				dto = new CafeDTO(cafe_id, cafe_name, cafe_phone, cafe_running_time, cafe_info, cafe_menu, cafe_latitude, cafe_longitude, cafe_addr, reg_date, cafe_pic);
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
				String cafe_phone = rs.getString("cafe_pohne");
				String cafe_running_time = rs.getString("cafe_running_time");
				String cafe_info = rs.getString("cafe_info");
				String cafe_menu = rs.getString("cafe_menu");
				Double cafe_latitude = rs.getDouble("cafe_latitude");
				Double cafe_longitude = rs.getDouble("cafe_longitude");
				String cafe_addr = rs.getString("cafe_addr");
				Date reg_date = rs.getDate("reg_date");
				String cafe_pic = rs.getString("cafe_pic");

				dto = new CafeDTO(cafe_id, cafe_name, cafe_phone, cafe_running_time, cafe_info, cafe_menu, cafe_latitude, cafe_longitude, cafe_addr, reg_date, cafe_pic);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dao.Db_close();
		}
		return dto;
	}

	public PicDTO InfoPic(String search_cafe) { // 카페정보창에 사진 띄우는 메소드

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String DB_id = "campus_c_b_1111";
			String DB_pw = "smhrd2";

			conn = DriverManager.getConnection(url, DB_id, DB_pw);

			String sql = "select * from t_cafeimages where pic_id=(select pic_id from t_cafe_img where rownum=1 and cafe_id=(select cafe_id from t_cafe where cafe_name=?))";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, search_cafe);
			rs = psmt.executeQuery();

			if (rs.next()) {
				String pic_id = rs.getString("pic_id");
				String pic_path = rs.getString("pic_path");
				int pic_type = rs.getInt("pic_type");
				java.sql.Date reg_date = rs.getDate("reg_date");

				dtoa = new PicDTO(pic_id, pic_path, pic_type, reg_date);

				System.out.println(dtoa.getPic_path());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dao.Db_close();
		}
		return dtoa;
	}
}
