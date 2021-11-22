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

	public CafeDTO CafeInfo(String somehing) { // 이미지를 누르면 카페이미지를 DTO에 담아서 JSP에 표현 하기

		dao.Db_conn();
		String sql = "select *from t_cafe where cafe_id=(select cafe_id from t_cafe_img where pic_id ='?' )"; //?에 경로가 들어 가야함! something

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
	public void CafeImg(String something) { // 카페이름을 입력하면 사진경로가 arrayList에  담겨서 줌
		dao.Db_conn();
		try {
			String sql = "select pic_path from t_cafeimages where pic_id in (select pic_id from t_cafe_img where cafe_id ='?')"; // 여기 ?에는 카페 코드
			psmt =conn.prepareStatement(sql);
			psmt.setString(1, something);
			
			rs = psmt.executeQuery();
			if(rs.next()) {                //여러값을 어캐 받을것인가 이걸 생각해보자!
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