package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CafeDAO;
import Model.CafeDTO;
import Model.MemberDAO;
import Model.MemberDTO;
import Model.PicDTO;


@WebServlet("/SearchServiceCon")
public class SearchServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ã����");

		request.setCharacterEncoding("EUC-KR");
		String search_cafe = request.getParameter("search_cafe");

	
		System.out.println(search_cafe);
		//=======	
		CafeDAO dao = new CafeDAO();
		CafeDTO inf = dao.Cafesearch(search_cafe);
		PicDTO dtoa = dao.InfoPic(search_cafe);
			
		String path = null; // ���

		if(inf != null) {
			System.out.println("���� ã�Ҿ�");
			HttpSession session = request.getSession();
			HttpSession session_pic = request.getSession();			
			session.setAttribute("inf", inf);
			session_pic.setAttribute("pic", dtoa);			
			path = "Cafe_Info.jsp"; // ������ �̵����
		}else {
			System.out.println("�� ��ã��...");
			path = "Home.jsp"; // ���н� �̵����
		}
		response.sendRedirect(path);
	}

}
