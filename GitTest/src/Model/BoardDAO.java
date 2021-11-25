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
	int result = 0;
	ResultSet rs = null;
	BoardDTO dto = null;

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

	// 게시판 작성 업로드 메소드
	// 파일 1,2,3 업로드
	public int upload(BoardDTO dto) {
		Db_conn();
		try {
			String sql = "insert into t_board values(t_board_seq.NEXTVAL, ?, ?, sysdate, 0, ?, ?, ?, ?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getArticle_title());
			psmt.setString(2, dto.getArticle_content());
			psmt.setString(3, dto.getM_id());
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

	// 게시글을 날짜순으로 보여주는 메소드
	// 미완성
	public ArrayList<BoardDTO> viewBoard() {
		ArrayList<BoardDTO> board_list = new ArrayList<BoardDTO>();
		Db_conn();
		try {
			String sql = "select * from t_board order by article_date desc";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int article_seq = rs.getInt("article_seq");
				String article_title = rs.getString("article_title");
				Date article_date = rs.getDate("article_date");
				int article_cnt = rs.getInt("article_cnt");
				String m_id = rs.getString("m_id");
				
				dto = new BoardDTO(article_seq, article_title, article_date, article_cnt, m_id);
				board_list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		}
		return board_list;
	}

	// 게시판 내용 보여주는 메소드
	public BoardDTO viewOneBoard(String num) {
		Db_conn();
		try {
			String sql = "select * from t_board where article_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				int article_seq = rs.getInt("article_seq");
				String article_title = rs.getString("article_title");
				String article_content = rs.getString("article_content");
				Date article_date = rs.getDate("article_date"); //여기 에러 뭐지
				int article_cnt=rs.getInt("article_cnt");
				String m_id = rs.getString("m_id");
				String article_file1=rs.getString("article_file1");
				String article_file2=rs.getString("article_file2");
				String article_file3=rs.getString("article_file3");
				dto = new BoardDTO(article_seq, article_title, article_content, article_date, article_cnt, m_id, article_file1, article_file2, article_file3);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			Db_close();
		}return dto;
	}
	
	// 게시판 조회수
	public void count(String no) {
		Db_conn();
		int cnt = 0;
		try {
			String sql = "select article_cnt from t_board where article_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
				cnt++;
			}
			
			String sql1 = "update t_board set article_cnt = ? where article_seq = ?";
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, cnt);
			psmt.setString(2, no);
			psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		}
	}
	
	// 게시판 개별 삭제 메소드
	public int deleteOne(String num) {
		Db_conn();
		try {
			String sql = "delete from t_board where article_seq = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);   // num = a태그로 넘어온 메시지의 고유한 값
			cnt = psmt.executeUpdate();
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		} return cnt;
	}
	
	// 게시판 수정
	/*
	 * public int rectify(BoardDTO dto) { Db_conn(); String sql =
	 * "update t_board set article_title = ?, article_content = ?, article_date = sysdate, m_id = ?, article_file1 = ?, article_file2 = ?, article_file3 = ? where article_seq = ?"
	 * ; try { psmt = conn.prepareStatement(sql);
	 * 
	 * psmt.setString(1, dto.getArticle_title()); psmt.setString(2,
	 * dto.getArticle_content()); psmt.setString(3, dto.getM_id());
	 * psmt.setString(4, dto.getArticle_file1()); psmt.setString(5,
	 * dto.getArticle_file2()); psmt.setString(6, dto.getArticle_file3());
	 * psmt.setInt(6, dto.getArticle_seq());
	 * 
	 * return psmt.executeUpdate();
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { Db_close(); } return
	 * -1;
	 * 
	 * }
	 */
}
