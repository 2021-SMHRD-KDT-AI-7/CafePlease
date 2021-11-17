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
		
		request.setCharacterEncoding("EUC-KR"); 
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pwd");
		String nick = request.getParameter("nick");
		String gender = (String)request.getParameter("gender"); //������ 0 �ƴϸ� 1
		
		System.out.println("�� �޾Ҵ��� Ȯ������!");
		System.out.println(id+""+pw+""+nick+""+gender);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.Join(id, pw, nick, gender);
		
		String path = null; //���
		
		if(cnt>0) {
			System.out.println("��Ű! ���ԿϷ�");
			request.setAttribute("id",id); //id�� ȯ���մϴ� �׷��� �Ҷ� �ʿ������ ��������
			path = null; //������ �����ϴ� jsp�̸�	
		}else {System.out.println("�� �� ������?");
		    path = null; //���н� �����ϴ� jsp�̸�
		}
		RequestDispatcher rd = request.getRequestDispatcher(path); //���� ��η� ���� ���ִ� �޼ҵ�
		rd.forward(request, response);
	}

}
