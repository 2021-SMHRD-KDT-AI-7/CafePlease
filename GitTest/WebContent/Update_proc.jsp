<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="Model.BoardDAO"%>
<%@page import="Model.BoardDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Cafe_Please!</title>
</head>
<body>

	<!-- 글 수정 처리이기 때문에 제목, 패스워드, 글내용, 숫자만 받아도된다. -->
    <!-- 데이터베이스로부터 비밀번호를 받아와 비밀번호가 맞으면 수정할수 있고, 틀리면 쓰게하는 과정 -->
    <%
        request.setCharacterEncoding("EUC-KR");
    %>
    <!-- 사용자 데이터를 읽어들이는 빈 클래스 설정 -->
    <jsp:useBean id="getOneUpdateBoard" class="Model.BoardDTO">
        <jsp:setProperty name="getOneUpdateBoard" property="m_id" />
    </jsp:useBean>
    <%
        //데이터 베이스에 연결
        BoardDAO dao = new BoardDAO();
        //해당 게시글의 패스워드 값을 얻어옴
        String id = dao.getId(getOneUpdateBoard.getArticle_seq());//num을 기준으로 패스워드값 얻어옴
 		System.out.println();
        //기존 패스워드값과 update시 작성했던 password 값이 같은지 비교
        if (id.equals(getOneUpdateBoard.getM_id())) {
            //데이터 수정하는 메소드 호출
            /* dao.updateBoard(); */
            //수정이 완료되면 전체 게시글 보기
            response.sendRedirect("post.jsp");
        } else {//패스워드가 틀리다면
    %>
    <script type="text/javascript">
        alert("아이디가 일치 하지 않습니다. 다시 확인후 수정해 주세요.")
        history.go(-1); //한단계 이전으로 되돌아간다
    </script>
    <%
        }
    %>

</body>
</html>