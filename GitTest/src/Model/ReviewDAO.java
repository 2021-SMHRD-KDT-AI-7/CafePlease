package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class ReviewDAO {

	// ReviewDAO
	
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	ReviewDTO dto = null;
	int avg=0;
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

	
	public int upload_review(String cafe_id, String review_content, int num, String m_id ) {
		Db_conn();
		
		/*
		 * cafe_id VARCHAR2(20) NOT NULL, review_seq NUMBER(12, 0) NOT NULL,
		 * review_content VARCHAR2(3000) NOT NULL, cafe_ratings NUMBER(12, 0) NOT NULL,
		 * review_pic VARCHAR2(150) NULL, m_id VARCHAR2(20) NOT NULL, reg_date DATE
		 * DEFAULT SYSDATE NOT NULL, PRIMARY KEY (review_seq)
		 */
		
		try {
			String sql = "insert into t_review values(?,t_review_seq.NEXTVAL,?,?,'a',?,sysdate)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, cafe_id);
			psmt.setString(2, review_content);
			psmt.setInt(3, num);
			psmt.setString(4, m_id);
			

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		}
		return cnt;
	}
	
	// 리뷰 평점 평균 구하는 메소드
	public int avg_review() {
		Db_conn();
		
		try {
			
			String sql="select avg(cafe_ratings) from t_review";
			psmt = conn.prepareStatement(sql);
			
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				avg = rs.getInt("avg(cafe_ratings)");
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Db_close();
		}
		return avg;
	}
	
	public ArrayList<ReviewDTO> view_review() {
		
		Db_conn();
		ArrayList<ReviewDTO> r_list = new ArrayList<ReviewDTO>();
		
		try {
			String sql = "Select review_seq,review_content,cafe_ratings, m_id from t_review";
			psmt = conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				int review_seq = rs.getInt("review_seq");
				String review_content = rs.getString("review_content");
				int cafe_ratings = rs.getInt("cafe_ratings");
				String m_id = rs.getString("m_id");
				dto = new ReviewDTO(review_seq, review_content, cafe_ratings, m_id);
				r_list.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Db_close();
		}return r_list;
	}
}
