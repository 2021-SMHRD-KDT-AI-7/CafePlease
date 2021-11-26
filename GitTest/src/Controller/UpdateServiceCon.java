
package Controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.BoardDAO;
import Model.BoardDTO;
import Model.MemberDTO;

@WebServlet("/UpdateServiceCon")
public class UpdateServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[UpdateServiceCon]");

		request.setCharacterEncoding("EUC-KR");

		String saveDirectory = request.getServletContext().getRealPath("file");

		int maxSize = 1024 * 1024 * 5;
		String encoding = "EUC-KR";

		MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());

		String article_title = multi.getParameter("title");
		int article_seq = Integer.parseInt(multi.getParameter("seq"));
		String article_content = multi.getParameter("content");
		
		String article_file1;
		String article_file2;
		String article_file3;
		if(multi.getFilesystemName("fileName1") != null) {
			article_file1 = URLEncoder.encode(multi.getFilesystemName("fileName1"), "EUC-KR");
	      } else {
	    	  article_file1 ="null";
	      }
		
		if(multi.getFilesystemName("fileName2") != null) {
			article_file2 = URLEncoder.encode(multi.getFilesystemName("fileName2"), "EUC-KR");
	      } else {
	    	  article_file2 ="null";
	      }
		
		if(multi.getFilesystemName("fileName3") != null) {
			article_file3 = URLEncoder.encode(multi.getFilesystemName("fileName3"), "EUC-KR");
	      } else {
	    	  article_file3 ="null";
	      }
		
//		String article_file1 = URLEncoder.encode(multi.getFilesystemName("fileName1"), "EUC-KR");
//		String article_file2 = URLEncoder.encode(multi.getFilesystemName("fileName2"), "EUC-KR");
//		String article_file3 = URLEncoder.encode(multi.getFilesystemName("fileName3"), "EUC-KR");
	
		System.out.println("시퀀스 : " +article_seq);
		System.out.println("title : " + article_title);
		System.out.println("content : " + article_content);
		System.out.println("fileName : " + article_file1);
		System.out.println("fileName : " + article_file2);
		System.out.println("fileName : " + article_file3);

		BoardDTO dto = new BoardDTO(article_seq, article_title, article_content, article_file1, article_file2, article_file3);
		BoardDAO dao = new BoardDAO();
		int cnt = dao.updateBoard(dto);
		
		if (cnt > 0) {
			System.out.println("파일 수정 성공");
		} else {
			System.out.println("파일 수정 실패");
		}
		response.sendRedirect("Post.jsp");

	}

}
