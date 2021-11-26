package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CafeDTO;
import Model.MemberDTO;
import Model.ReviewDAO;

@WebServlet("/ReviewServiceCon")
public class ReviewServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[ReviewServiceCon]");
		
		request.setCharacterEncoding("EUC-KR");
		
		int num=0;
		HttpSession session=request.getSession();
		CafeDTO inf = (CafeDTO) session.getAttribute("inf");
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String cafe_id=inf.getCafe_id();
		String review_content = request.getParameter("review_content");
		String m_id=info.getM_id();
		String cafe_rating = request.getParameter("cafe_rating");
		
		
		if(cafe_rating.equals("1")) {
			num=1;
		}else if(cafe_rating.equals("2")) {
			num=2;
		}else if(cafe_rating.equals("3")) {
			num=3;
		}else if(cafe_rating.equals("4")) {
			num=4;
		}else if(cafe_rating.equals("5")) {
			num=5;
		}
		
		System.out.println("ī����̵� : "+cafe_id);
		System.out.println("���䳻�� : "+review_content);
		System.out.println("ȸ�� �г��� : "+m_id);
		System.out.println("�������� : "+num);
	
		ReviewDAO dao = new ReviewDAO();
		
		int cnt = dao.upload_review(cafe_id, review_content, num, m_id);
		String path = null;
		
		if(cnt>0) {
			System.out.println("���� �ۼ� �Ϸ�!!");
			path="Cafe_Info.jsp";
		}else {
			System.out.println("���� �ۼ� ����..�Ф�");
			path="review.jsp";
		}
		response.sendRedirect(path);
	}
}
