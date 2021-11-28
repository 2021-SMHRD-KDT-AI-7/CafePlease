package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class jjimDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	jjimDTO dto = null;

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
	
	// 찜목록 추가
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
	
	// 찜목록 삭제
	public int jjimdelete(String m_id) {
		Db_conn();
		try {
			
			String sql = "delect from t_jjim where cafe_id = (select cafe_id from t_jjim where m_id = ?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, m_id);
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		}
		return cnt;
	}
	
	// 찜목록  id와 카페id 가져오기
	public ArrayList<jjimDTO> id(String id) {
		ArrayList<jjimDTO> ids = new ArrayList<jjimDTO>();
		Db_conn();
		try {
			String sql = "select * from t_jjim where m_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String m_id = rs.getString("m_id");
				String cafe_id = rs.getString("cafe_id");
				
				dto = new jjimDTO(m_id, cafe_id);
				ids.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		} return ids;
	}
	
	// 찜목록 조회
	public ArrayList<jjimDTO> jjimlist(String num) {
		ArrayList<jjimDTO> jlist = new ArrayList<jjimDTO>();
		Db_conn();
		try {
			String sql = "select cafe_name, cafe_pic from t_cafe where cafe_id in (select cafe_id from t_jjim where m_id = ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String m_id = rs.getString("cafe_name");
				String cafe_id = rs.getString("cafe_pic");
				
				dto = new jjimDTO(m_id, cafe_id);
				jlist.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		} return jlist;
	}
}
