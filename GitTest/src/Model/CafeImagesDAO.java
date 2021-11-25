package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class CafeImagesDAO {

	PreparedStatement psmt = null;
	Connection conn = null;
	int cnt = 0;
	ResultSet rs = null;
	CafeImagesDTO dto = null;
	
	public void Db_conn() { // 학원에서 준 DB연결 메소드
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String DB_id = "campus_c_b_1111";
			String DB_pw = "smhrd2";

			conn = DriverManager.getConnection(url, DB_id, DB_pw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void Db_close() { // 학원 DB 연결끊는메소드
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<CafeImagesDTO> ViewImages() { // 보여주기 메소드
		ArrayList<CafeImagesDTO> i_list = new ArrayList<CafeImagesDTO>();
		Db_conn();

		try {
			String sql = "select * from t_cafeimages";
			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();

			if (rs.next()) {
				String pic_id = rs.getString("pic_id");
				String pic_path = rs.getString("pic_path");
				int pic_type = rs.getInt("pic_type");
				Date reg_date = rs.getDate("reg_date");

				dto = new CafeImagesDTO(pic_id, pic_path, pic_type, reg_date);
				i_list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		}
		return i_list;
	}
	
	
}
