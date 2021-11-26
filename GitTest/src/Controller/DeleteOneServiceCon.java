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
		
		System.out.println("�޽����� ������ �� : " + num);
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.deleteOne(num);
		
		if(cnt > 0) {
			System.out.println("�޽��� ���� ���� ����");
		} else {
			System.out.println("�޽��� ���� ���� ����");
		}
		
		response.sendRedirect("My_Page.jsp");
		
	}

}
