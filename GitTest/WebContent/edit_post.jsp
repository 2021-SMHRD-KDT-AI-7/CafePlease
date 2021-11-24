<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="ko">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Information">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>edit_post</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="edit_post.css" media="screen">
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
    <meta property="og:title" content="edit_post">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
    <style type="text/css">
	
		*{margin: 0px; padding: 0px;}
		
		#user_icon{
			position: absolute;
			bottom: 0;
			
		
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
	</style>
  </head>
  <body class="u-body"><!-- 새로만든 헤더부분 시작 -->
<div style="height: 85px;">
    <header>
        
      <h4>
            <a href="Home.jsp">
                <img src="./images/_.png" style="width: 200px;" id="logo">
            </a>
        </h4>
          
              <div id="top_menu">
              	<a href="My_Page.jsp" style="margin-right:50px; " ><img src="./images/user_icon.png" id="user_icon"></a>
              	<a href="Home.jsp" id="home">Home</a>
              	<a href="Post.jsp" id="post">Post</a>
              	<% MemberDTO info = (MemberDTO)session.getAttribute("info"); %>
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
                <a href="View_post.jsp" data-page-id="1476824093" class="u-border-none u-btn u-btn-round u-button-style u-custom-color-4 u-custom-font u-heading-font u-hover-custom-color-6 u-radius-6 u-btn-1">수정</a>
              </div>
            </div>
          </div>
        </div>
        <div class="u-expanded-width u-table u-table-responsive u-table-1">
          <table class="u-table-entity">
            <colgroup>
              <col width="10.8%">
              <col width="89.2%">
            </colgroup>
            <thead class="u-align-center u-custom-color-2 u-table-header u-table-header-1">
              <tr style="height: 28px;">
                <th class="u-border-1 u-border-white u-table-cell"></th>
                <th class="u-border-1 u-border-white u-table-cell">수정할 내용을 입력하세요</th>
              </tr>
            </thead>
            <tbody class="u-align-center u-table-alt-white u-table-body u-table-valign-middle">
              <tr style="height: 75px;">
                <td class="u-border-6 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-3">글제목</td>
                <td class="u-border-6 u-border-grey-5 u-table-cell">Description</td>
              </tr>
              <tr style="height: 76px;">
                <td class="u-border-6 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-5">작성자</td>
                <td class="u-border-6 u-border-grey-5 u-table-cell">Description</td>
              </tr>
              <tr style="height: 77px;">
                <td class="u-border-6 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-7">작성일자</td>
                <td class="u-border-6 u-border-grey-5 u-table-cell">Description</td>
              </tr>
              <tr style="height: 76px;">
                <td class="u-border-6 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-9">내용</td>
                <td class="u-border-6 u-border-grey-5 u-table-cell">
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>Description<br>
                  <br>
                </td>
              </tr>
            </tbody>
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