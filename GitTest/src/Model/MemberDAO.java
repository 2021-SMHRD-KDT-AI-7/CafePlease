package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class MemberDAO {
	PreparedStatement psmt = null;
	Connection conn = null;
	int cnt = 0;
	ResultSet rs = null;
	MemberDTO dto = null;

//==================================================필요한 전역변수들
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

	public int Join(String id, String pwd, String nick, String gender) {// 회원가입 메소드
		Db_conn();
		String sql = "insert into t_member values(?,?,?,?,0,0,SYSDATE,'N')";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			psmt.setString(3, nick);
			psmt.setString(4, gender);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				Db_close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}

	public MemberDTO Login(String id, String pw) { // 로그인 메소드
		Db_conn();

		String sql = "select * from t_member where m_id=? and m_pwd=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String m_id = rs.getString("m_id");
				String m_pwd = rs.getString("m_pwd");
				String m_nickname = rs.getString("m_nickname");
				String m_gender = rs.getString("m_gender");
				int m_grade = rs.getInt("m_grade");
				int m_point = rs.getInt("m_point");
				Date m_joindate = rs.getDate("m_joindate");
				String admin_yn = rs.getString("admin_yn");

				dto = new MemberDTO(m_id, m_pwd, m_nickname, m_gender, m_grade, m_point, m_joindate, admin_yn);
				// 여기 민수형꺼 DTO따라 입력해야함
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		}
		return dto;
	}

	public int update(MemberDTO info) { // 회원정보수정
		Db_conn();

		String sql = "update t_member set m_pwd=?, where m_id = ?";
		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, info.getM_pwd());
			psmt.setString(2, info.getM_nickname());
			psmt.setString(3, info.getM_gender());
			psmt.setString(4, info.getM_id());

			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		}
		return cnt;
	}

}