package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class BoardDAO {

//	CafePlease BoardDAO

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	BoardDTO dto = null;

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

	// �Խ��� �ۼ� ���ε� �޼ҵ�
	// ���� 1,2,3 ���ε�
	public int upload(BoardDTO dto) {
		Db_conn();
		try {
			String sql = "insert into t_board values(t_board_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getArticle_title());
			psmt.setString(2, dto.getM_id());
			psmt.setString(3, dto.getArticle_content());
			psmt.setString(4, dto.getArticle_file1());
			psmt.setString(5, dto.getArticle_file2());
			psmt.setString(6, dto.getArticle_file3());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		}
		return cnt;
	}

	// �Խñ��� ��¥������ �����ִ� �޼ҵ�
	// �̿ϼ�
	public ArrayList<BoardDTO> viewBoard() {
		ArrayList<BoardDTO> board_list = new ArrayList<BoardDTO>();
		Db_conn();
		try {
			String sql = "select * from t_board order by article_date desc";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int num = rs.getInt("article_seq");
				String article_title = rs.getString("article_title");
				String article_content = rs.getString("article_content");
				String article_date = rs.getString("article_date");
				int article_cnt = rs.getInt("article_cnt");
//				m_id
//				article_file1
//				article_file2
//				article_file3
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		}
		return board_list;
	}

	// �Խ��� ���� �����ִ� �޼ҵ�
	public BoardDTO viewOneBoard(String num) {
		Db_conn();
		try {
			String sql = "select * from t_board where article_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setNString(1, num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				int article_seq = rs.getInt("num");
				String article_title = rs.getString("article_title");
				String article_content = rs.getString("article_content");
				Date article_date = rs.getDate("article_date"); //���� ���� ����
				int article_cnt=rs.getInt("article_cnt");
				String m_id = rs.getString("m_id");
				String article_file1=rs.getString("article_file1");
				String article_file2=rs.getString("article_file1");
				String article_file3=rs.getString("article_file1");
				dto = new BoardDTO(article_seq, article_title, article_content, article_date, article_cnt, m_id, article_file1, article_file2, article_file3);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			Db_close();
		}return dto;
	}
}