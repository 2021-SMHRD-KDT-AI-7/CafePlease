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
		String gender = (String)request.getParameter("gender"); //성별은 0 아니면 1
		
		System.out.println("잘 받았는지 확인하자!");
		System.out.println(id+""+pw+""+nick+""+gender);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.Join(id, pw, nick, gender);
		
		String path = null; //경로
		
		if(cnt>0) {
			System.out.println("오키! 가입완료");
			request.setAttribute("id",id); //id님 환영합니다 그런거 할때 필요없으면 삭제가능
			path = null; //성공시 가야하는 jsp이름	
		}else {System.out.println("아 왜 실패임?");
		    path = null; //실패시 가야하는 jsp이름
		}
		RequestDispatcher rd = request.getRequestDispatcher(path); //여기 경로로 가게 해주는 메소드
		rd.forward(request, response);
	}

}
