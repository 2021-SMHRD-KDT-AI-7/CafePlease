package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class jjimDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;

	public void Db_conn() { // 학원에서 준 서버연결 메소드
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

	public void Db_close() { // 학원 서버 연결메소드
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
	
	public int jjim(jjimDTO dto) {
		Db_conn();
		try {
			
			String sql = "insert into t_jjim values(?, ?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getM_id());
			psmt.setString(2, dto.getCafe_id());
			
			System.out.println(dto.getM_id());
			System.out.println(dto.getCafe_id());
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		}
		return cnt;
	}
	
}
