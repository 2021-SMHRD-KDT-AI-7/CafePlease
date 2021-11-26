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
	
	public void Db_conn() { // �п����� �� DB���� �޼ҵ�
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
	
	public void Db_close() { // �п� DB ������¸޼ҵ�
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
	
	public ArrayList<CafeImagesDTO> ViewImages_D() { // ���� �����ֱ� �޼ҵ�
		ArrayList<CafeImagesDTO> i_list = new ArrayList<CafeImagesDTO>();
		Db_conn();

		try {
			String sql = "select * from (" + 
					"				select * from t_cafeimages where pic_id like 'D%'" + 
					"				order by dbms_random.value) ";
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
	
	public ArrayList<CafeImagesDTO> ViewImages_B() { // �ϱ� �����ֱ� �޼ҵ�
		ArrayList<CafeImagesDTO> i_list = new ArrayList<CafeImagesDTO>();
		Db_conn();

		try {
			String sql = "select * from (\r\n" + 
					"				select * from t_cafeimages where pic_id like 'P%'\r\n" + 
					"				order by dbms_random.value) ";
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
	
	public ArrayList<CafeImagesDTO> ViewImages_S() { // ���� �����ֱ� �޼ҵ�
		ArrayList<CafeImagesDTO> i_list = new ArrayList<CafeImagesDTO>();
		Db_conn();

		try {
			String sql = "select * from (\r\n" + 
					"				select * from t_cafeimages where pic_id like 'S%'\r\n" + 
					"				order by dbms_random.value) ";
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
	
	public ArrayList<CafeImagesDTO> ViewImages_N() { // ���� �����ֱ� �޼ҵ�
		ArrayList<CafeImagesDTO> i_list = new ArrayList<CafeImagesDTO>();
		Db_conn();

		try {
			String sql = "select * from (\r\n" + 
					"				select * from t_cafeimages where pic_id like 'N%'\r\n" + 
					"				order by dbms_random.value) ";
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
	
	public ArrayList<CafeImagesDTO> ViewImages_G() { // ���걸 �����ֱ� �޼ҵ�
		ArrayList<CafeImagesDTO> i_list = new ArrayList<CafeImagesDTO>();
		Db_conn();

		try {
			String sql = "select * from (\r\n" + 
					"				select * from t_cafeimages where pic_id like 'G%'\r\n" + 
					"				order by dbms_random.value) ";
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
	
}
