<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="Model.BoardDTO"%>
<%@page import="Model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet" href="Post.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <!-- <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script> -->
    <meta name="generator" content="Nicepage 3.30.2, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "Cafe_Please",
		"logo": "images/_.png"
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Post">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
	<style type="text/css">
	
		*{margin: 0px; padding: 0px;}
		
		#user_icon{
		    position: relative;
		    top: 10px;
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
		.u-btn-submit{
			display: flex;
			width: 70px;
			justify-content: center;
			vertical-align: middle;
			height: 25px;
		}
		.li_tab{
			background-color: #a37a54;
			color:white;
		}
		.tb{
			margin-top: 50px;
		}
	</style>
  </head>
  <body class="u-body">
  
  <!-- dao, dto, array만듬 -->
  <%
	   BoardDAO dao = new BoardDAO();
	   ArrayList<BoardDTO> b_list = dao.viewBoard();
  %>
  
   <!-- 새로만든 헤더부분 시작 -->
<div style="height: 85px;">
    <header>
        
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
            <li class="u-tab-item li_tab" role="presentation">
              <a class="active u-active-custom-color-4 u-button-style u-tab-link u-tab-link-1" id="link-tab-0da5" href="#tab-0da5" role="tab" aria-controls="tab-0da5" aria-selected="true">자유게시판</a>
            </li>
          </ul>
          <div class="u-tab-content">
            <div class="u-container-style u-tab-active u-tab-pane u-white u-tab-pane-1" id="tab-0da5" role="tabpanel" aria-labelledby="link-tab-0da5">
              <div class="u-container-layout u-container-layout-1">
                <a href="Post_input.jsp" data-page-id="7275902" class="u-border-none u-btn u-button-style u-none u-text-custom-color-2 u-btn-1">게시글 작성하기</a>
               <!--  <h4 class="u-text u-text-default u-text-1" style="margin-bottom:150px">&lt;&lt; 1&nbsp; 2&nbsp; 3&nbsp; 4&nbsp; 5&nbsp; &gt;&gt;</h4> -->
              </div>
            </div>
          </div>
        </div>
        
        <!-- 자유게시판 table 시작 -->
        <div class="u-expanded-width u-table u-table-responsive u-table-1">
          <table class="u-table-entity tb" >
            <colgroup>
              <col width="5.4%">
              <col width="50.4%">
              <col width="12%">
              <col width="16%">
              <col width="16%">
            </colgroup>
            <thead class="u-align-center u-custom-color-2 u-table-header u-table-header-1">
              <tr style="height: 48px;">
                <th class="u-border-1 u-border-white u-table-cell">번호</th>
                <th class="u-border-1 u-border-white u-table-cell">내용</th>
                <th class="u-border-1 u-border-white u-table-cell">작성일</th>
                <th class="u-border-1 u-border-white u-table-cell">작성자</th>
                <th class="u-border-1 u-border-white u-table-cell">글 조회수</th>
               
              </tr>
            </thead>
            <tbody class="u-align-center u-table-alt-white u-table-body">
            
            <!-- sql에서 게시판 작성 가져오기 시작 -->
            <% for(int i = 0; i < b_list.size(); i++) { %>
              <tr style="height: 75px;">
                <td class="u-border-1 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-6"><%= i+1 %></td>
                <td class="u-border-1 u-border-grey-5 u-table-cell">
                  <a href="View_post.jsp?num=<%= b_list.get(i).getArticle_seq() %>"data-page-id="1476824093" class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-6 u-btn-3"><%= b_list.get(i).getArticle_title() %> ></a>
                </td>
                <td class="u-border-1 u-border-grey-5 u-table-cell"><%= b_list.get(i).getArticle_date() %></td>
                <td class="u-border-1 u-border-grey-5 u-table-cell"><%= b_list.get(i).getM_id() %></td>
                <td class="u-border-1 u-border-grey-5 u-table-cell"><%= b_list.get(i).getArticle_cnt() %></td>
               
              </tr>
            <% } %>
            <!-- 끝 -->
            
            </tbody>
          </table>
          	<!-- 게시글 찾기...기능?? 시간되면하자... -->
							<!-- <div class="u-form u-form-1">
								<form action="#" method="POST"
									class="u-clearfix u-form-horizontal u-form-spacing-11 u-inner-form"
									style="padding: 0px;" source="custom" name="form">
									<div class="u-form-group u-form-group-1">
										<label for="email-2555"
											class="u-form-control-hidden u-label u-label-1">Email</label>
										<input type="text" id="email-2555" name="search_cafe"
											class="u-border-2 u-border-grey-5 u-input u-input-rectangle u-radius-45 u-white"
											required="required" placeholder="검색어를 입력하세요">
									</div>
									<div class="u-align-left u-form-group u-form-submit">
										<a href="#"
											class="u-active-custom-color-4 u-border-2 u-border-active-custom-color-4 u-border-custom-color-4 u-border-hover-custom-color-4 u-btn u-btn-round u-btn-submit u-button-style u-custom-color-4 u-hover-custom-color-4 u-radius-50 u-btn-1">검색</a>
										<input type="submit" value="submit"
											class="u-form-control-hidden">
									</div>
									<div class="u-form-send-message u-form-send-success">
										Thank you! Your message has been sent.</div>
									<div class="u-form-send-error u-form-send-message">
										Unable to send your message. Please fix errors then try again.
									</div>
									<input type="hidden" value="" name="recaptchaResponse">
								</form>
							</div>
        </div> -->
        <!-- 자유게시판 끝 -->
        	
      </div>
    </section>
    
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-fd77"><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1">Queen Bee Project cafe please&nbsp;<br>our team member is worker that KMJ, LMS, PHG, LMS<br>and last queen bee, KHJ<br>Thank you
        </p>
      </div></footer>
  </body>
</html>