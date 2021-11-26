package Controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDAO;
import Model.MemberDTO;

@WebServlet("/MemberUpdateCon")
public class MemberUpdateCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("회원정보수정");
		request.setCharacterEncoding("EUC_KR");
		String m_pwd= null;
		String m_nickname = null;
		String ed_pw_check=null;
		
		while (true) {
			m_pwd = request.getParameter("ed_pw");
			ed_pw_check = request.getParameter("ed_pw_check");
			m_nickname = request.getParameter("ed_nick");
			// 비밀번호랑 확인이 다르다면 다시 받기
			if (m_pwd.equals(ed_pw_check)) {
				break;
			} else {
				System.out.println("비밀번호 다시 입력해야해!!");
				response.sendRedirect("입력페이지");
			} // 만약 비번이랑 비번확인이 다르면 입력페이지로 보냄
		}
			
		/*HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info"); 
		//로그인에서 만든 세션에서 id가져와!
		String id = info.getM_id();
		String gender = info.getM_gender();
		int grade = info.getM_grade();
		int point = info.getM_point();
		Date joindate = info.getM_joindate();
		String admin = info.getAdmin_yn();
		
		//수정!!
		info = new MemberDTO(id, pwd, nickname, gender, grade, point, joindate, admin);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(info);
		
		if(cnt>0) {
			System.out.println("수정완료"); //업데이트 완료
			session.setAttribute("info", info);
		} else {
			System.out.println("실패함");
		}
		response.sendRedirect("가야하는 곳 주소"); //가야하는 페이지 적어라*/
		
	
	
		System.out.println("변경할 비밀번호 : " + m_pwd);
		System.out.println("변경할 비밀번호 확인 : " + ed_pw_check);
		System.out.println("변경할 닉네임 : " + m_nickname);
		
	
		// 세션에서 로그인 한 정보에서 id가져오기??
		HttpSession session =request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		String m_id = info.getM_id();
		String m_gender = info.getM_gender();
		info = new MemberDTO(m_id, m_pwd, m_nickname, m_gender);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(info);
		
		String path = null;
		if(cnt>0) {
			System.out.println("회원 정보 수정 완료!");
			session.setAttribute("info", info);
		}else {
			System.out.println("회원정보 수정 실패...");
		}
		
		response.sendRedirect("My_Page.jsp");
		
		
		
	}
		
}
