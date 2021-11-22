package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDAO;


@WebServlet("/JoinServiceCon")
public class JoinServiceCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); 
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String nick = request.getParameter("nick");
		String gender = request.getParameter("gender"); 
		
		System.out.println("�� �޾Ҵ��� Ȯ������!");
		System.out.println(id+" "+pwd+" "+nick+" "+gender);
		
		MemberDAO dao = new MemberDAO();
		
		int cnt=dao.Join(id, pwd, nick, gender);
		String path = null; //���
		
		if(cnt>0) {
			System.out.println("��Ű! ���ԿϷ�");
			request.setAttribute("id",id); //id�� ȯ���մϴ� �׷��� �Ҷ� �ʿ������ ��������
			path = "Home.jsp"; //������ �����ϴ� jsp�̸�	
		}else {System.out.println("�� �� ������?");
		    path = "Join.html"; //���н� �����ϴ� jsp�̸�
		}
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}

}
