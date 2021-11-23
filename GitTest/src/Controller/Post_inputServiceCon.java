package Controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.BoardDAO;
import Model.BoardDTO;

@WebServlet("/Post_inputServiceCon")
public class Post_inputServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[Post_inputServiceCon]");
		
		request.setCharacterEncoding("EUC-KR");
		
		String saveDirectory = request.getServletContext().getRealPath("file");
		
		int maxSize = 1024*1024*5;
		String encoding = "EUC-KR";
		
		MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		
		
		String article_title = multi.getParameter("title");
		String m_id = multi.getParameter("writer");
		String article_content = multi.getParameter("content");
		String article_file1 = URLEncoder.encode(multi.getFilesystemName("fileName[]"), "EUC-KR");
		String article_file2 = URLEncoder.encode(multi.getFilesystemName("fileName[]"), "EUC-KR");
		String article_file3 = URLEncoder.encode(multi.getFilesystemName("fileName[]"), "EUC-KR");

		
	
		BoardDTO dto = new BoardDTO(article_title, article_content, m_id, article_file1, article_file2, article_file3);
		BoardDAO dao = new BoardDAO();
		int cnt = dao.upload(dto);
		
		if(cnt > 0) {
			System.out.println("파일 업로드 성공");
		} else {
			System.out.println("파일 업로드 실패");
		}
		response.sendRedirect("Post.jsp");
	}

}
