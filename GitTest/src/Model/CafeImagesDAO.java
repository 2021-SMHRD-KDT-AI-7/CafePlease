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
	
	public ArrayList<CafeImagesDTO> ViewImages_D() { // 동구 보여주기 메소드
		ArrayList<CafeImagesDTO> i_list = new ArrayList<CafeImagesDTO>();
		Db_conn();

		try {
			String sql = "select * from (select * from t_cafeimages where pic_id like 'D%'	order by dbms_random.value) ";
			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();

			while (rs.next()) {
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
	
	public ArrayList<CafeImagesDTO> ViewImages_B() { // 북구 보여주기 메소드
		ArrayList<CafeImagesDTO> i_list = new ArrayList<CafeImagesDTO>();
		Db_conn();

		try {
			String sql = "select * from (select * from t_cafeimages where pic_id like 'P%' order by dbms_random.value) ";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
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
	
	public ArrayList<CafeImagesDTO> ViewImages_S() { // 서구 보여주기 메소드
		ArrayList<CafeImagesDTO> i_list = new ArrayList<CafeImagesDTO>();
		Db_conn();

		try {
			String sql = "select * from (select * from t_cafeimages where pic_id like 'S%'	order by dbms_random.value) ";
			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();

			while (rs.next()) {
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
	
	public ArrayList<CafeImagesDTO> ViewImages_N() { // 남구 보여주기 메소드
		ArrayList<CafeImagesDTO> i_list = new ArrayList<CafeImagesDTO>();
		Db_conn();

		try {
			String sql = "select * from (select * from t_cafeimages where pic_id like 'N%'	order by dbms_random.value) ";
			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();

			while (rs.next()) {
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
	
	public ArrayList<CafeImagesDTO> ViewImages_G() { // 광산구 보여주기 메소드
		ArrayList<CafeImagesDTO> i_list = new ArrayList<CafeImagesDTO>();
		Db_conn();

		try {
			String sql = "select * from (select * from t_cafeimages where pic_id like 'G%' order by dbms_random.value) ";
			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();

			while (rs.next()) {
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
	
	public ArrayList<CafeImagesDTO> SearchOneCafe(String search_cafe) {  // 카페 검색으로 카페인포 이미지 보여주기
		ArrayList<CafeImagesDTO> i_list1 = new ArrayList<CafeImagesDTO>();
		Db_conn();
		
		try {
			String sql = "select T.pic_id, T.pic_path from t_cafeimages T, t_cafe_img I, t_cafe C where T.pic_id = I.pic_id and I.cafe_id = C.cafe_id and C.Cafe_name =?";
			System.out.println(sql);
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, search_cafe);
			rs = psmt.executeQuery();
			
			System.out.println(rs.next());
			if(rs != null) {
			
			while(rs.next()) {
				String pic_id = rs.getString("pic_id");
				String pic_path = rs.getString("pic_path");

				dto = new CafeImagesDTO(pic_id, pic_path);
				i_list1.add(dto);
			}}
			else {
			}
		}catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			Db_close();
		}		
		return i_list1;
	}
	public ArrayList<CafeImagesDTO> ViewImages_DM() { // 동명동 보여주기 메소드
		ArrayList<CafeImagesDTO> i_list = new ArrayList<CafeImagesDTO>();
		Db_conn();

		try {
			String sql = "select * from (select * from t_cafeimages where pic_id like 'D01%'order by dbms_random.value) ";
			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();

			while (rs.next()) {
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
	
	public ArrayList<CafeImagesDTO> ViewImages_CJ() { // 충장로 보여주기 메소드
		ArrayList<CafeImagesDTO> i_list = new ArrayList<CafeImagesDTO>();
		Db_conn();

		try {
			String sql = "select * from (select * from t_cafeimages where pic_id like 'D02%'order by dbms_random.value) ";
			psmt = conn.prepareStatement(sql);
		
			rs = psmt.executeQuery();

			while (rs.next()) {
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

	public ArrayList<CafeImagesDTO> TopCafe() {
		ArrayList<CafeImagesDTO> p_list = new ArrayList<CafeImagesDTO>();
		Db_conn();
		try {
			String sql = "select * from (select A.pic_id, A.pic_path, A.cafe_id, A.cafe_pic, rank() OVER (PARTITION BY cafe_id order by pic_id) AS RankNo from (select T.pic_id, T.pic_path, I.cafe_id, C.cafe_pic from t_cafeimages T, t_cafe_img I, (select rownum, total.* from (select cafe_name, cafe_id, cafe_pic, cafe_ranking*0.0001+cafe_new_yn as total  from t_cafe order by total desc) total where rownum<8) C where T.pic_id = I.pic_id and I.cafe_id = C.cafe_id) A) where RankNo =1";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			System.out.println(rs.next());
			
			while (rs.next()) {
				String pic_path = rs.getString("pic_path");
				String cafe_id = rs.getString("cafe_id");
				String cafe_pic = rs.getString("cafe_pic");

				dto = new CafeImagesDTO(pic_path, cafe_id, cafe_pic);
				p_list.add(dto);
			}
			
			for (int i=0; i<p_list.size(); i++) {
				System.out.println(p_list.get(i).getCafe_id());
			}
			System.out.println(p_list.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		}
		return p_list;
	}
	
}
