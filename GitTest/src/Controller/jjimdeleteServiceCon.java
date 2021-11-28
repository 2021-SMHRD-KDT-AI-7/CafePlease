package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.jjimDAO;
import Model.jjimDTO;


@WebServlet("/jjimdeleteServiceCon")
public class jjimdeleteServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		String m_id = request.getParameter("m_id");
		
		jjimDAO dao = new jjimDAO();
		int cnt = dao.jjimdelete(m_id);
		
		if(cnt > 0) {
			System.out.println("찜 삭제 성공!!");
		} else {
			System.out.println("찜 삭제 실패ㅠㅠ");
		}
		response.sendRedirect("My_Page.jsp");
		
	}

}
