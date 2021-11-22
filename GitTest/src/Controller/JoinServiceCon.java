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
		
		System.out.println("잘 받았는지 확인하자!");
		System.out.println(id+" "+pwd+" "+nick+" "+gender);
		
		MemberDAO dao = new MemberDAO();
		
		int cnt=dao.Join(id, pwd, nick, gender);
		String path = null; //경로
		
		if(cnt>0) {
			System.out.println("오키! 가입완료");
			request.setAttribute("id",id); //id님 환영합니다 그런거 할때 필요없으면 삭제가능
			path = "Home.jsp"; //성공시 가야하는 jsp이름	
		}else {System.out.println("아 왜 실패임?");
		    path = "Join.html"; //실패시 가야하는 jsp이름
		}
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}

}
