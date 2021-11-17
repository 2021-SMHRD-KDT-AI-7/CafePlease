package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDAO;
import Model.MemberDTO;

@WebServlet("/LoginServiceCon")
public class LoginServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("�α�����");

		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		System.out.println("�ߵ��Դ��� ����");
		System.out.println(id + "" + pw);

		MemberDAO dao = new MemberDAO();
		dao.Login(id, pw);
		MemberDTO info = dao.Login(id, pw);

		String path = null; // ���

		if (info != null) {
			System.out.println("�α��οϷ�");
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
			path = null; // ������ �̵����
		} else {
			System.out.println("�� �α��� �� �ȴ�...");
			path = null; // ���н� �̵����
		}
		response.sendRedirect(path);
	}
}
