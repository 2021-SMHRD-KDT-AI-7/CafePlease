package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CafeDAO;
import Model.CafeDTO;
import Model.MemberDAO;


@WebServlet("/CafeInfoServiceCon")
public class CafeInfoServiceCon extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      
       System.out.println("ī�� ���������"); 
   
      request.setCharacterEncoding("EUC-KR");
      String �̹���=request.getParameter("�̹���"); //Ŭ���� �̹��� ���� ��ΰ� �;���
      
       //<a href="CafeInfoServiceCon? ��� ���� �̰ŷ� ������ ������ ����. ������Ʈ�� ���!
      //something�� �޾ƿ� �̹��� ���!
   
      CafeDAO dao= new CafeDAO();
      
      CafeDTO inf= dao.cafeimg_info(�̹���);
      
      if (inf != null) {
         HttpSession session = request.getSession();
         session.setAttribute("inf", inf);
         response.sendRedirect("���ư����� ī������ ������");}
   }

}