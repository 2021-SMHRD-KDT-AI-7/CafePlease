package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.swing.Box.Filler;

public class BoardDAO {

//	CafePlease BoardDAO

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	int result = 0;
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

	// �Խ��� ���� �����ִ� �޼ҵ�
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
				Date article_date = rs.getDate("article_date"); //���� ���� ����
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
	
	// �Խ��� ��ȸ��
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
	
	// �Խ��� ���� ���� �޼ҵ�
	public int deleteOne(String num) {
		Db_conn();
		try {
			String sql = "delete from t_board where article_seq = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);   // num = a�±׷� �Ѿ�� �޽����� ������ ��
			cnt = psmt.executeUpdate();
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Db_close();
		} return cnt;
	}
	
	// �Խ��� ����
	// boardupdate�� �ϳ��� �Խñ��� ����
	 
    public BoardDTO getOneUpdateBoard(int num) {
        // ����Ÿ�� ����(��ü ����)
    	System.out.println("�Խù� ������Ʈ �޼ҵ� ");
        Db_conn();
        try {
            // ���� �غ�
            String sql = "select * from t_board where article_seq=?";
            // ���� ���� ��ü
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, num);
            // ���� ������ ����� ����
            rs = psmt.executeQuery();
 
            if (rs.next()) { // �Խñۿ����� ��� ������ �ϳ��� ������
/*            	dto.setArticle_seq(rs.getInt(1));
            	dto.setArticle_title(rs.getString(2));
            	dto.setArticle_content(rs.getString(3));
            	dto.setArticle_date(rs.getDate(4));
            	dto.setArticle_cnt(rs.getInt(5));
            	dto.setM_id(rs.getString(6));
            	dto.setArticle_file1(rs.getString(7));
            	dto.setArticle_file2(rs.getString(8));
            	dto.setArticle_file3(rs.getString(9));*/
            	
            	dto = new BoardDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
            	
            	System.out.println("dto test "+dto.getArticle_seq());
            	System.out.println("dto test "+dto.getArticle_cnt());
            	System.out.println("dto test "+dto.getArticle_content());
            }
 
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return dto;
    }
	
	 // update �� delete �� �ʿ��� �н����尪�� �������ִ� �޼ҵ�
    public String getId(int num) {// ������ ���� ��ü ����
        String id = "";
        // DB����
        Db_conn();
 
        try {
            // ���� �غ�
            String sql = "select m_id from t_board where article_seq=?";
            // ���� ������ ��ü ����
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, num);
            rs = psmt.executeQuery();
            // �н����� ���� ����
            if (rs.next()) {
                id = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
			Db_close();
		} 
        return id;
 
    }
 
    // �ϳ��� �Խñ��� �����ϴ� �޼ҵ�
    public int updateBoard(BoardDTO dto) {
        Db_conn();
 
        try {
            // ���� �غ�        	
            String sql = "update t_board set article_title = ? , article_content = ?, article_file1 = ?, article_file2 = ?, article_file3 = ? where article_seq=?";
            psmt = conn.prepareStatement(sql);
  
			psmt.setString(1, dto.getArticle_title());
			psmt.setString(2, dto.getArticle_content());
			psmt.setString(3, dto.getArticle_file1());
			psmt.setString(4, dto.getArticle_file2());
			psmt.setString(5, dto.getArticle_file3());
			psmt.setInt(6, dto.getArticle_seq());

			cnt = psmt.executeUpdate();
 
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
			Db_close();
		}
        return cnt;
    }
}
