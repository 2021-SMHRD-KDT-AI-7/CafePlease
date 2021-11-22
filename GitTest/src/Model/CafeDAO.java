package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class CafeDAO {

	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	CafeDTO dto = null;
	MemberDAO dao = new MemberDAO();

	public CafeDTO CafeInfo(String somehing) { // �̹����� ������ ī���̹����� DTO�� ��Ƽ� JSP�� ǥ�� �ϱ�

		dao.Db_conn();
		String sql = "select *from t_cafe where cafe_id=(select cafe_id from t_cafe_img where pic_id ='?' )"; //?�� ��ΰ� ��� ������! something

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,somehing);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				String cafe_code = rs.getString("cafe_code");
				String cafe_name = rs.getString("cafe_name");
				String cafe_phone = rs.getString("cafe_phone");
				String cafe_running_time = rs.getString("cafe_running_time");
				int cafe_latitude = rs.getInt("cafe_latitude");
				int cafe_longtitude = rs.getInt("cafe_longtitude");
				String cafe_addr = rs.getString("cafe_addr");
				String cafe_tag = rs.getString("cafe_tag");
				Date reg_date = rs.getDate("reg_date");
			
				dto = new CafeDTO(cafe_code, cafe_name, cafe_phone, cafe_running_time, cafe_latitude, cafe_longtitude, cafe_addr, cafe_tag, reg_date);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {;
			dao.Db_close();
		}
		return dto;
	}
	public void CafeImg(String something) { // ī���̸��� �Է��ϸ� ������ΰ� arrayList��  ��ܼ� ��
		dao.Db_conn();
		try {
			String sql = "select pic_path from t_cafeimages where pic_id in (select pic_id from t_cafe_img where cafe_id ='?')"; // ���� ?���� ī�� �ڵ�
			psmt =conn.prepareStatement(sql);
			psmt.setString(1, something);
			
			rs = psmt.executeQuery();
			if(rs.next()) {                //�������� ��ĳ �������ΰ� �̰� �����غ���!
				String pic_id =rs.getString("pic_id");
				String  pic_path = rs.getString("pic_path");
				int pic_type=rs.getInt("pic_type");
				Date reg_date=rs.getDate("reg_date");
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
			
	}
}