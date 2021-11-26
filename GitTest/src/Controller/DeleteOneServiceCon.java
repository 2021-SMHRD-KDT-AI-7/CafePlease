package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BoardDAO;

@WebServlet("/DeleteOneServiceCon")
public class DeleteOneServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[DeleteOneServiceCon]");
		
		String num = request.getParameter("seq_num");
		
		System.out.println("메시지의 고유한 값 : " + num);
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.deleteOne(num);
		
		if(cnt > 0) {
			System.out.println("메시지 개별 삭제 성공");
		} else {
			System.out.println("메시지 개별 삭제 실패");
		}
		
		response.sendRedirect("My_Page.jsp");
		
	}

}
