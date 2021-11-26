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
		
		System.out.println("카페아이디 : "+cafe_id);
		System.out.println("리뷰내용 : "+review_content);
		System.out.println("회원 닉네임 : "+m_id);
		System.out.println("원두점수 : "+num);
	
		ReviewDAO dao = new ReviewDAO();
		
		int cnt = dao.upload_review(cafe_id, review_content, num, m_id);
		String path = null;
		
		if(cnt>0) {
			System.out.println("리뷰 작성 완료!!");
			path="Cafe_Info.jsp";
		}else {
			System.out.println("리뷰 작성 실패..ㅠㅠ");
			path="review.jsp";
		}
		response.sendRedirect(path);
	}
}
