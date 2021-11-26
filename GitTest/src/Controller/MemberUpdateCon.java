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
		String m_pwd= null;
		String m_nickname = null;
		String ed_pw_check=null;
		
		while (true) {
			m_pwd = request.getParameter("ed_pw");
			ed_pw_check = request.getParameter("ed_pw_check");
			m_nickname = request.getParameter("ed_nick");
			// ��й�ȣ�� Ȯ���� �ٸ��ٸ� �ٽ� �ޱ�
			if (m_pwd.equals(ed_pw_check)) {
				break;
			} else {
				System.out.println("��й�ȣ �ٽ� �Է��ؾ���!!");
				response.sendRedirect("�Է�������");
			} // ���� ����̶� ���Ȯ���� �ٸ��� �Է��������� ����
		}
			
		/*HttpSession session = request.getSession();
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
		response.sendRedirect("�����ϴ� �� �ּ�"); //�����ϴ� ������ �����*/
		
	
	
		System.out.println("������ ��й�ȣ : " + m_pwd);
		System.out.println("������ ��й�ȣ Ȯ�� : " + ed_pw_check);
		System.out.println("������ �г��� : " + m_nickname);
		
	
		// ���ǿ��� �α��� �� �������� id��������??
		HttpSession session =request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		String m_id = info.getM_id();
		String m_gender = info.getM_gender();
		info = new MemberDTO(m_id, m_pwd, m_nickname, m_gender);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(info);
		
		String path = null;
		if(cnt>0) {
			System.out.println("ȸ�� ���� ���� �Ϸ�!");
			session.setAttribute("info", info);
		}else {
			System.out.println("ȸ������ ���� ����...");
		}
		
		response.sendRedirect("My_Page.jsp");
		
		
		
	}
		
}
