package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory;

public class MemberDAO {
	PreparedStatement psmt = null;
	Connection conn = null;
	int cnt = 0;
	ResultSet rs = null;
	MemberDTO dto = null;

//==================================================�ʿ��� ����������
	public void Db_conn() { // �п����� �� �������� �޼ҵ�
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

	public void Db_close() { // �п� ���� ����޼ҵ�
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

	public int Join(String id, String pw, String nickname, String gender) {
		Db_conn();

		String sql = "insert into t_member values(?,?,?,?,0,0,sysdate,N)";
		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, nickname);
			psmt.setString(4, gender);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
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

	public MemberDTO Login(String id, String pw) { // �α��� �޼ҵ�
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

				dto = new MemberDTO(m_id, m_pwd, m_nickname, m_gender);// ���� �μ����� DTO���� �Է��ؾ���
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		}
		return dto;
	}

	public int update(MemberDTO info) { // ȸ����������
		Db_conn();

		String sql = "update t_member set m_pwd=?, m_nickname=?, m_gender=? where m_id = ?";
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