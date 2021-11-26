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
			
		String cafe_id = request.getParameter("cafe_id");
		
		jjimDTO dto = new jjimDTO(cafe_id);
		
		jjimDAO dao = new jjimDAO();
		int cnt = dao.jjim(dto);
		
		if(cnt > 0) {
			System.out.println("찜 삭제 성공!!");
		} else {
			System.out.println("찜 삭제 실패ㅠㅠ");
		}
		response.sendRedirect("Cafe_Info.jsp");
		
	}

}
