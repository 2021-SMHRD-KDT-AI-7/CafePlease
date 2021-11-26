package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.jjimDAO;
import Model.jjimDTO;

@WebServlet("/jjimServiceCon")
public class jjimServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		String m_id = request.getParameter("m_id");		
		String cafe_id = request.getParameter("cafe_id");
		
		jjimDTO dto = new jjimDTO(m_id, cafe_id);
		
		jjimDAO dao = new jjimDAO();
		int cnt = dao.jjim(dto);
		
		if(cnt > 0) {
			System.out.println("Âò ¼º°ø!!");
		} else {
			System.out.println("Âò ½ÇÆĞ¤Ğ¤Ğ");
		}
		response.sendRedirect("Cafe_info");
	}

}
