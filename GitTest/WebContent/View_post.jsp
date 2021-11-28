<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="Model.BoardDTO"%>
<%@page import="Model.BoardDAO"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="ko">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Information">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Cafe Please!</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="View_post.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
   <!-- <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script> --> 
    <meta name="generator" content="Nicepage 3.30.2, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "Cafe_Please",
		"logo": "images/_.png"
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="View_post">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
    
    <style type="text/css">
    	.row{
    		margin-bottom: 10px;
    	}
    	
    	.col-md-auto{
    		margin-left: 10px;
    	}
    
		*{margin: 0px; padding: 0px;}
		
		#user_icon{
		    position: relative;
		   /*  top: 10px; */
		    margin-right: 20px;
		
		}
		#user_id{
			margin-right:20px;
		}
		#logo{
			margin-left: 70px;
		}
		#top_menu{
			position: absolute;
			display:inline;
			top: 20px;
			right: 10px;
			color: black;
		}
		#top_menu a{
			color: #401F00;
		}
		#home{
			margin-right: 20px;
		}
		#post{
			margin-right: 20px;
		}
		#login{
			margin-right: 100px;
		}
		.view_btn{
			background-color: #A37A54;
			border: 0;
		}
    	
    </style>
  </head>
  <body class="u-body">
        
        <!-- dao, dto 만듬 -->
        <%
        	String num = request.getParameter("num");
        	BoardDAO dao = new BoardDAO();
        	BoardDTO dto = dao.viewOneBoard(num);
        	
        	// 조회수 count
        	dao.count(num);
        %>
     <!-- 새로만든 헤더부분 시작 -->
<div style="height: 85px;">
    <header style="margin-top: 20px;">
        
      <h4>
            <a href="Home.jsp">
                <img src="./images/_.png" style="width: 200px;" id="logo">
            </a>
        </h4>
          <% MemberDTO info = (MemberDTO)session.getAttribute("info"); %>
            
              <div id="top_menu">
              <%if(info != null){ %>
              <b id="user_id"> <%=info.getM_nickname() %>님 환영합니다</b> 
              <%} %>
              
              	<a href="My_Page.jsp">
              		<img src="./images/user_icon.png" id="user_icon"> </a>
              	<a href="Home.jsp" id="home">Home</a>
              	<a href="Post.jsp" id="post">Post</a>
              	<%if(info!=null){ %>
              		<a href="LogoutServiceCon" id="login">Logout</a>
              	
              	<%} else{ %>
              	<a href="Login.jsp" id="login">Login</a>
              	<%} %>
              </div>
  
          </nav>
    </header>
</div>
<!-- 새로만든 헤더부분 끝 -->
    <section class="u-align-center u-clearfix u-white u-section-1" id="sec-b4c1">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-expanded-width u-tabs u-tabs-1">
          <ul class="u-spacing-15 u-tab-list u-unstyled" role="tablist">
            <li class="u-tab-item" role="presentation">
              <a class="active u-active-custom-color-4 u-button-style u-tab-link u-tab-link-1" id="link-tab-0da5" href="#tab-0da5" role="tab" aria-controls="tab-0da5" aria-selected="true">자유게시판</a>
            </li>
          </ul>
          <div class="u-tab-content">
            <div class="u-container-style u-tab-active u-tab-pane u-white u-tab-pane-1" id="tab-0da5" role="tabpanel" aria-labelledby="link-tab-0da5">
              <div class="u-container-layout u-container-layout-1">
                <!-- <a href="https://nicepage.cloud" class="u-border-none u-btn u-btn-round u-button-style u-custom-color-4 u-custom-font u-heading-font u-hover-custom-color-6 u-radius-6 u-btn-1">수정</a>
                <a href="Post.jsp" data-page-id="32994214" class="u-border-none u-btn u-btn-round u-button-style u-custom-color-4 u-custom-font u-heading-font u-hover-custom-color-6 u-radius-6 u-btn-2"> 목록</a> -->
              </div>
            </div>
          </div>
        </div>
        
        <!-- 게시글 table시작 -->
        <div class="u-expanded-width u-table u-table-responsive u-table-1">
        <form action="update.jsp">
          <table class="u-table-entity">
            <colgroup>
              <col width="10.8%">
              <col width="89.2%">
            </colgroup>
            <div class="container px-4 d-grid gap-2 d-md-flex justify-content-md-end">
  				<div class="row gx-5">
             		<a class="btn btn-secondary btn-lg col-md-auto view_btn" href="Post.jsp" role="button">게시판</a>
             		<a class="btn btn-secondary btn-lg col-md-auto" href="Update.jsp?num=<%= num %>" role="button" style="background-color: #A37A54;">수정</a>
             	</div>
        	</div>

            <thead class="u-align-center u-custom-color-2 u-table-header u-table-header-1">
              <tr style="height: 28px;">
                <th class="u-border-1 u-border-white u-table-cell"></th>
                <th class="u-border-1 u-border-white u-table-cell">게시판 글보기</th>
              </tr>
            </thead>
            <tbody class="u-align-center u-table-alt-white u-table-body u-table-valign-middle">
              <tr style="height: 75px;">
                <td class="u-border-6 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-3">글제목</td>
                <td class="u-border-6 u-border-grey-5 u-table-cell"> <%= dto.getArticle_title() %> </td>
              </tr>
              <tr style="height: 76px;">
                <td class="u-border-6 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-5">작성자</td>
                <td class="u-border-6 u-border-grey-5 u-table-cell"> <%= dto.getM_id() %> </td>
              </tr>
              <tr style="height: 77px;">
                <td class="u-border-6 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-9">내용</td>
                <td class="u-border-6 u-border-grey-5 u-table-cell"> <%= dto.getArticle_content() %> </td>
              </tr>
              <tr style="height: 77px;">
                <td class="u-border-6 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-7">다운로드</td>
                <td class="u-border-6 u-border-grey-5 u-table-cell">
                <% if(dto.getArticle_file1() != null) { %>
                	<a href="file/<%= dto.getArticle_file1() %>" download> 다운로드1 </a> <br>
                <% } %>
                
                <% if(dto.getArticle_file2() != null) { %>
                	<a href="file/<%= dto.getArticle_file2() %>" download> 다운로드2 </a> <br>
                <% } %>
                
                <% if(dto.getArticle_file3() != null) { %>
                	<a href="file/<%= dto.getArticle_file3() %>" download> 다운로드3 </a> <br>
                <% } %>
                
                <% if(dto.getArticle_file1() != null) { %>
                	<img src="file/<%= dto.getArticle_file1() %>">
                <% } %>
                
                <% if(dto.getArticle_file2() != null) { %>
                	<img src="file/<%= dto.getArticle_file2() %>">
                <% } %>
                
                <% if(dto.getArticle_file3() != null) { %>
                	<img src="file/<%= dto.getArticle_file3() %>">
                <% } %>
                
                </td>
              </tr>
            </tbody>
          </table>
         </form>
        </div>
        <!-- 게시판 table 끝 -->
        
      </div>
    </section>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-fd77"><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1">Queen Bee Project cafe please&nbsp;<br>our team member is worker that KMJ, LMS, PHG, LMS<br>and last queen bee, KHJ<br>Thank you
        </p>
      </div></footer>
  </body>
</html>