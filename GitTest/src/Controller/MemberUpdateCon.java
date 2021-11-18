package Controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDAO;
import Model.MemberDTO;

@WebServlet("/MemberUpdateCon")
public class MemberUpdateCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("ȸ����������");
		request.setCharacterEncoding("EUC_KR");
		String pwd= null;
		String nickname = null;
		
		
		while (true) {
			pwd = request.getParameter("pwd");
			String pwd_check = request.getParameter("pwd_check");
			nickname = request.getParameter("nickname");
			// ��й�ȣ�� Ȯ���� �ٸ��ٸ� �ٽ� �ޱ�
			if (pwd.equals(pwd_check)) {
				break;
			} else {
				response.sendRedirect("�Է�������");
			} // ���� ����̶� ���Ȯ���� �ٸ��� �Է��������� ����
		}
			
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info"); 
		//�α��ο��� ���� ���ǿ��� id������!
		String id = info.getM_id();
		String gender = info.getM_gender();
		int grade = info.getM_grade();
		int point = info.getM_point();
		Date joindate = info.getM_joindate();
		String admin = info.getAdmin_yn();
		
		//����!!
		info = new MemberDTO(id, pwd, nickname, gender, grade, point, joindate, admin);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(info);
		
		if(cnt>0) {
			System.out.println("�����Ϸ�"); //������Ʈ �Ϸ�
			session.setAttribute("info", info);
		} else {
			System.out.println("������");
		}
		response.sendRedirect("�����ϴ� �� �ּ�"); //�����ϴ� ������ �����
	}

}
