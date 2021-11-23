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
	protected void service(HttpServletRequest request , HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("�α�����");

		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		System.out.println("�ߵ��Դ��� ����");
		System.out.println(id + "" + pwd);
		//=======	
		MemberDAO dao = new MemberDAO();
		MemberDTO info = dao.Login(id, pwd);
		
		//System.out.println("db�� ���̵� : " + info.getM_id());
		
		String path = null; // ���

		if(info != null) {
			System.out.println("�α��οϷ�");
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
			path = "Home.jsp"; // ������ �̵����
		}else {
			System.out.println("�� �α��� �� �ȴ�...");
			path = "Login.jsp"; // ���н� �̵����
		}
		response.sendRedirect(path);
	}
	
}
