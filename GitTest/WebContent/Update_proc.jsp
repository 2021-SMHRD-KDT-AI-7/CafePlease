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

	<!-- �� ���� ó���̱� ������ ����, �н�����, �۳���, ���ڸ� �޾Ƶ��ȴ�. -->
    <!-- �����ͺ��̽��κ��� ��й�ȣ�� �޾ƿ� ��й�ȣ�� ������ �����Ҽ� �ְ�, Ʋ���� �����ϴ� ���� -->
    <%
        request.setCharacterEncoding("EUC-KR");
    %>
    <!-- ����� �����͸� �о���̴� �� Ŭ���� ���� -->
    <jsp:useBean id="getOneUpdateBoard" class="Model.BoardDTO">
        <jsp:setProperty name="getOneUpdateBoard" property="m_id" />
    </jsp:useBean>
    <%
        //������ ���̽��� ����
        BoardDAO dao = new BoardDAO();
        //�ش� �Խñ��� �н����� ���� ����
        String id = dao.getId(getOneUpdateBoard.getArticle_seq());//num�� �������� �н����尪 ����
 		System.out.println();
        //���� �н����尪�� update�� �ۼ��ߴ� password ���� ������ ��
        if (id.equals(getOneUpdateBoard.getM_id())) {
            //������ �����ϴ� �޼ҵ� ȣ��
            /* dao.updateBoard(); */
            //������ �Ϸ�Ǹ� ��ü �Խñ� ����
            response.sendRedirect("post.jsp");
        } else {//�н����尡 Ʋ���ٸ�
    %>
    <script type="text/javascript">
        alert("���̵� ��ġ ���� �ʽ��ϴ�. �ٽ� Ȯ���� ������ �ּ���.")
        history.go(-1); //�Ѵܰ� �������� �ǵ��ư���
    </script>
    <%
        }
    %>

</body>
</html>