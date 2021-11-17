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
		System.out.println("로그인중");

		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		System.out.println("잘들어왔는지 보자");
		System.out.println(id + "" + pw);

		MemberDAO dao = new MemberDAO();
		dao.Login(id, pw);
		MemberDTO info = dao.Login(id, pw);

		String path = null; // 경로

		if (info != null) {
			System.out.println("로그인완료");
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
			path = null; // 성공시 이동경로
		} else {
			System.out.println("아 로그인 왜 안댐...");
			path = null; // 실패시 이동경로
		}
		response.sendRedirect(path);
	}
}
