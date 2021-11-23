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
    <title>Post</title>
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
  </head>
  <body class="u-body"><header class="u-clearfix u-header u-header" id="sec-d37f"><div class="u-clearfix u-sheet u-sheet-1">
        <!-- dao, dto, array만듬 -->
        <%
        	BoardDAO dao = new BoardDAO();
        	ArrayList<BoardDTO> b_list = dao.viewBoard();
        %>
        
        <a href="Home.jsp" data-page-id="654928509" class="u-image u-logo u-image-1" data-image-width="1685" data-image-height="690" title="Home">
          <img src="images/_.png" class="u-logo-image u-logo-image-1">
        </a>
        <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
          <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px;">
            <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
              <svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
              <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><symbol id="menu-hamburger" viewBox="0 0 16 16" style="width: 16px; height: 16px;"><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
</symbol>
</defs></svg>
            </a>
          </div>
          <div class="u-custom-menu u-nav-container">
            <ul class="u-nav u-unstyled u-nav-1"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-custom-color-4 u-text-hover-palette-2-base" href="Home.jsp" style="padding: 10px 20px;">Home</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-custom-color-4 u-text-hover-palette-2-base" href="Post.jsp" style="padding: 10px 20px;">Post</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-custom-color-4 u-text-hover-palette-2-base" href="Login.jsp" style="padding: 10px 20px;">Login</a><div class="u-nav-popup"><ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-2"><li class="u-nav-item"><a class="u-button-style u-custom-color-10 u-nav-link u-text-active-custom-color-4" href="Join.jsp">Join</a>
</li></ul>
</div>
</li></ul>
          </div>
          <div class="u-custom-menu u-nav-container-collapse">
            <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
              <div class="u-inner-container-layout u-sidenav-overflow">
                <div class="u-menu-close"></div>
                <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-3"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Home.jsp" style="padding: 10px 20px;">Home</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Post.jsp" style="padding: 10px 20px;">Post</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Login.jsp" style="padding: 10px 20px;">Login</a><div class="u-nav-popup"><ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-4"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Join.jsp">Join</a>
</li></ul>
</div>
</li></ul>
              </div>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
          </div>
        </nav><span class="u-icon u-icon-circle u-text-custom-color-2 u-icon-1" data-href="My_Page.jsp" data-page-id="195028572"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 415.744 415.744" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-0149"></use></svg><svg class="u-svg-content" viewBox="0 0 415.744 415.744" x="0px" y="0px" id="svg-0149" style="enable-background:new 0 0 415.744 415.744;"><g><g><path d="M207.872,0c-53.76,0-97.28,43.52-97.28,97.28s43.52,97.28,97.28,97.28s97.28-43.52,97.28-97.28S261.632,0,207.872,0z"></path>
</g>
</g><g><g><path d="M245.76,205.824h-75.776c-76.288,0-138.24,61.952-138.24,138.24v56.32c0,8.704,6.656,15.36,15.36,15.36H368.64    c8.704,0,15.36-6.656,15.36-15.36v-56.32C384,267.776,322.048,205.824,245.76,205.824z"></path>
</g>
</g></svg></span>
      </div></header>
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
                <a href="Post_input.jsp" data-page-id="7275902" class="u-border-none u-btn u-button-style u-none u-text-custom-color-2 u-btn-1">게시글 작성하기</a>
                <h4 class="u-text u-text-default u-text-1">&lt;&lt; 1&nbsp; 2&nbsp; 3&nbsp; 4&nbsp; 5&nbsp; &gt;&gt;</h4>
              </div>
            </div>
          </div>
        </div>
        
        <!-- 자유게시판 table 시작 -->
        <div class="u-expanded-width u-table u-table-responsive u-table-1">
          <table class="u-table-entity">
            <colgroup>
              <col width="5.4%">
              <col width="45%">
              <col width="12.7%">
              <col width="16.8%">
              <col width="20.09999999999999%">
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
            <% for(int i = 0; i < b_list.size(); i++) { %>
            <tbody class="u-align-center u-table-alt-white u-table-body">
              <tr style="height: 75px;">
                <td class="u-border-1 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-6"><%= i+1 %></td>
                <td class="u-border-1 u-border-grey-5 u-table-cell">
                  <a href="View_post.jsp?num=<%= b_list.get(i).getArticle_seq() %>"data-page-id="1476824093" class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-6 u-btn-3"><%= b_list.get(i).getArticle_title() %> ></a>
                </td>
                <td class="u-border-1 u-border-grey-5 u-table-cell"><%= b_list.get(i).getArticle_date() %></td>
                <td class="u-border-1 u-border-grey-5 u-table-cell"><%= b_list.get(i).getM_id() %></td>
                <td class="u-border-1 u-border-grey-5 u-table-cell"><%= b_list.get(i).getArticle_cnt() %></td>
              </tr>
            </tbody>
            <% } %>
          </table>
        </div>
      </div>
    </section>
    
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-fd77"><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1">Queen Bee Project cafe please&nbsp;<br>our team member is worker that KMJ, LMS, PHG, LMS<br>and last queen bee, KHJ<br>Thank you
        </p>
      </div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/html5-template" target="_blank">
        <span>HTML5 Templates</span>
      </a>
      <p class="u-text">
        <span>created with</span>
      </p>
      <a class="u-link" href="https://nicepage.com/html-website-builder" target="_blank">
        <span>HTML Creator</span>
      </a>. 
    </section>
  </body>
</html>