<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="Model.CafeDTO"%>    
<!DOCTYPE html>
<html style="font-size: 16px;" lang="ko">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Cafe_Info</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="Cafe_Info.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
   <!--<script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>  --> 
    <meta name="generator" content="Nicepage 3.30.2, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "Cafe_Please",
		"logo": "images/_.png"
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Cafe_Info">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
    
    <style type="text/css">
    	#cate{
    		margin-bottom: 50px;
    		margin-left: 250px;
    		
    	}
 		#bar{
 			margin-top: 50px;
 		}
 		#cafe_id{
 			margin-left: 100px;
 		}
    
  
	
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
  
  
  
  <body class="u-body">
        <%CafeDTO inf = (CafeDTO) session.getAttribute("inf");%>
       <!-- 새로만든 헤더부분 시작 -->
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
    <section class="u-clearfix u-section-1" id="sec-e3aa">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-clearfix u-expanded-width u-gutter-0 u-layout-spacing-top u-layout-wrap u-layout-wrap-1">
          <div class="u-layout">
            <div class="u-layout-row">
              <div class="u-align-left u-container-style u-layout-cell u-left-cell u-shape-rectangle u-size-60 u-white u-layout-cell-1" src="">
                <div class="u-container-layout u-container-layout-1">
                  <div class="u-border-3 u-border-custom-color-2 u-expanded-width u-line u-line-horizontal u-line-1"></div>
                  
                  <!-- 찜, 카페이름, 지도 부분 -->
                  <div id="bar">
                  <a href="#" class="u-border-none u-btn u-button-style u-none u-text-palette-1-base u-btn-1"><span class="u-icon u-icon-1"><svg class="u-svg-content" viewBox="0 0 496.158 496.158" x="0px" y="0px" style="width: 1em; height: 1em;"><path style="fill:currentColor;" d="M0,248.085C0,111.063,111.069,0.003,248.075,0.003c137.013,0,248.083,111.061,248.083,248.082  c0,137.002-111.07,248.07-248.083,248.07C111.069,496.155,0,385.087,0,248.085z"></path><path style="fill:#FFFFFF;" d="M374.116,155.145c-34.799-34.8-91.223-34.8-126.022,0h-0.029c-34.801-34.8-91.224-34.8-126.023,0  c-34.801,34.8-29.783,86.842,0,126.022c31.541,41.491,89.129,109.944,126.023,109.944h0.029c36.895,0,94.481-68.453,126.022-109.944  C403.9,241.988,408.916,189.946,374.116,155.145z"></path></svg><img></span>&nbsp; 
                  </a>
                  
                  <a href="https://nicepage.com/k/shopping-cart-html-templates" class="u-active-none u-border-2 u-border-custom-color-4 u-btn u-btn-rectangle u-button-style u-custom-font u-heading-font u-hover-none u-none u-radius-0 u-btn-2">지도</a>
                  <h2 class="u-text u-text-custom-color-2 u-text-1" id="cafe_name"><%=inf.getCafe_name() %><span style="font-weight: 700;"></span>
                  </h2>
                 </div>
                 
                 <!-- 카페정보 -->
                  <div class="u-tab-links-align-justify u-tabs u-tabs-1">
                    <ul class="u-tab-list u-unstyled" role="tablist">
                      <li class="u-tab-item" role="presentation">
                        <a class="active u-active-white u-border-6 u-border-active-custom-color-4 u-border-custom-color-4 u-border-hover-grey-15 u-border-no-bottom u-border-no-left u-border-no-right u-button-style u-custom-color-4 u-hover-custom-color-6 u-tab-link u-tab-link-1" id="link-tab-0410" href="#tab-0410" role="tab" aria-controls="tab-0410" aria-selected="true">카페정보</a>
                      </li>
                      <li class="u-tab-item" role="presentation">
                        <a class="u-active-white u-border-6 u-border-active-custom-color-4 u-border-custom-color-4 u-border-hover-grey-15 u-border-no-bottom u-border-no-left u-border-no-right u-button-style u-custom-color-4 u-hover-custom-color-6 u-tab-link u-tab-link-2" id="link-tab-8453" href="#tab-8453" role="tab" aria-controls="tab-8453" aria-selected="false">메뉴</a>
                      </li>
                      <li class="u-tab-item u-tab-item-3" role="presentation">
                        <a class="u-active-white u-border-6 u-border-active-custom-color-4 u-border-custom-color-4 u-border-hover-grey-15 u-border-no-bottom u-border-no-left u-border-no-right u-button-style u-custom-color-4 u-hover-custom-color-6 u-tab-link u-tab-link-3" id="link-tab-c8f5" href="#tab-c8f5" role="tab" aria-controls="tab-c8f5" aria-selected="false">리뷰</a>
                      </li>
                    </ul>
                    <div class="u-tab-content">
                      <div class="u-container-style u-tab-active u-tab-pane u-white u-tab-pane-1" id="tab-0410" role="tabpanel" aria-labelledby="link-tab-0410">
                        <div class="u-container-layout u-container-layout-2">
                              <%=inf.getCafe_addr() %>
                     		   <%=inf.getCafe_phone() %>
                      		  <%=inf.getCafe_running_time() %>
                        </div>
                      </div>
                      <div class="u-align-left u-container-style u-tab-pane u-white u-tab-pane-2" id="tab-8453" role="tabpanel" aria-labelledby="link-tab-8453">
                        <div class="u-container-layout u-valign-top u-container-layout-3">
                          <p class="u-text u-text-2">Sample text. Click to select the text box. Click again or double click to start editing the text. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br>
                            <br>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.&nbsp;Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                          </p>
                          <p class="u-text u-text-3">Sample text. Click to select the text box. Click again or double click to start editing the text. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br>
                            <br>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.&nbsp;Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                          </p>
                        </div>
                      </div>
                      <div class="u-container-style u-tab-pane u-white u-tab-pane-3" id="tab-c8f5" role="tabpanel" aria-labelledby="link-tab-c8f5">
                        <div class="u-container-layout u-container-layout-4">
                          <a href="review.jsp" data-page-id="66156236" class="u-active-none u-border-2 u-border-active-palette-2-dark-1 u-border-custom-color-2 u-border-hover-palette-2-base u-btn u-button-style u-hover-none u-none u-text-custom-color-2 u-text-hover-palette-2-base u-btn-3">리뷰 적으러 가기 !</a>
                          <div class="u-align-center u-table u-table-responsive u-table-1">
                            <table class="u-table-entity">
                              <colgroup>
                                <col width="5.1%">
                                <col width="65.9%">
                                <col width="20.4%">
                                <col width="8.5%">
                              </colgroup>
                              <tbody class="u-table-body">
                                <tr style="height: 46px;">
                                  <td class="u-border-1 u-border-grey-dark-1 u-table-cell">번호</td>
                                  <td class="u-border-1 u-border-grey-dark-1 u-table-cell">내용</td>
                                  <td class="u-border-1 u-border-grey-dark-1 u-table-cell">작성자</td>
                                  <td class="u-border-1 u-border-grey-dark-1 u-table-cell">평점</td>
                                </tr>
                                <tr style="height: 46px;">
                                  <td class="u-border-1 u-border-grey-dark-1 u-table-cell"></td>
                                  <td class="u-border-1 u-border-grey-dark-1 u-table-cell"></td>
                                  <td class="u-border-1 u-border-grey-dark-1 u-table-cell"></td>
                                  <td class="u-border-1 u-border-grey-dark-1 u-table-cell"></td>
                                </tr>
                                <tr style="height: 46px;">
                                  <td class="u-border-1 u-border-grey-dark-1 u-table-cell"></td>
                                  <td class="u-border-1 u-border-grey-dark-1 u-table-cell"></td>
                                  <td class="u-border-1 u-border-grey-dark-1 u-table-cell"></td>
                                  <td class="u-border-1 u-border-grey-dark-1 u-table-cell"></td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                
                 
                 
                 <!-- 카페사진들 리스트 -->
                  <div class="u-gallery u-layout-grid u-lightbox u-show-text-on-hover u-gallery-1" id="carousel-6bb4">
                  
                    <!-- 사진 버튼 (외부,내부,음료...) -->
                  	<div id="cate">
                  	<button class="u-border-1 u-border-custom-color-2  u-btn-round u-button-style u-hover-black u-none u-radius-50 u-text-black u-text-hover-white u-btn-8">All Photo</button>
                  	 <button class="u-border-1 u-border-custom-color-2 u-btn-round u-button-style u-hover-black u-none u-radius-50 u-text-black u-text-hover-white u-btn-4" > out side</button>
                  	<button class="u-border-1 u-border-custom-color-2  u-btn-round u-button-style u-hover-black u-none u-radius-50 u-text-black u-text-hover-white u-btn-7">inside</button>
                 	 <button class="u-border-1 u-border-custom-color-2 u-btn-round u-button-style u-hover-black u-none u-radius-50 u-text-black u-text-hover-white u-btn-5"> menu</button>
                 	 <button class="u-border-1 u-border-custom-color-2  u-btn-round u-button-style u-hover-black u-none u-radius-50 u-text-black u-text-hover-white u-btn-6">photo zone</button>
                  </div>
                  <!--  사진버튼 끝 -->
                  
                  
                    <div class="u-gallery-inner u-gallery-inner-1" role="listbox">
                      <div class="u-effect-fade u-gallery-item u-gallery-item-1">
                        <div class="u-back-slide" data-image-width="828" data-image-height="812">
                          <img class="u-back-image u-expanded" src="images/KakaoTalk_20211119_150234575.jpg">
                        </div>
                        <div class="u-align-center u-over-slide u-shading u-over-slide-1">
                          <h3 class="u-gallery-heading"></h3>
                          <p class="u-gallery-text"></p>
                        </div>
                      </div>
                      <div class="u-effect-fade u-gallery-item u-gallery-item-2">
                        <div class="u-back-slide" data-image-width="594" data-image-height="594">
                          <img class="u-back-image u-expanded" src="images/KakaoTalk_20211119_150234575_01.jpg">
                        </div>
                        <div class="u-align-center u-over-slide u-shading u-over-slide-2">
                          <h3 class="u-gallery-heading"></h3>
                          <p class="u-gallery-text"></p>
                        </div>
                      </div>
                      <div class="u-effect-fade u-gallery-item u-gallery-item-3">
                        <div class="u-back-slide" data-image-width="828" data-image-height="823">
                          <img class="u-back-image u-expanded" src="images/KakaoTalk_20211119_150234575_03.jpg">
                        </div>
                        <div class="u-align-center u-over-slide u-shading u-over-slide-3">
                          <h3 class="u-gallery-heading"></h3>
                          <p class="u-gallery-text"></p>
                        </div>
                      </div>
                      <div class="u-effect-fade u-gallery-item u-gallery-item-4">
                        <div class="u-back-slide" data-image-width="828" data-image-height="825">
                          <img class="u-back-image u-expanded" src="images/KakaoTalk_20211119_150234575_04.jpg">
                        </div>
                        <div class="u-align-center u-over-slide u-shading u-over-slide-4">
                          <h3 class="u-gallery-heading"></h3>
                          <p class="u-gallery-text"></p>
                        </div>
                      </div>
                      <div class="u-effect-fade u-gallery-item u-gallery-item-5">
                        <div class="u-back-slide" data-image-width="828" data-image-height="828">
                          <img class="u-back-image u-expanded" src="images/KakaoTalk_20211119_150234575_09.jpg">
                        </div>
                        <div class="u-align-center u-over-slide u-shading u-over-slide-5">
                          <h3 class="u-gallery-heading"></h3>
                          <p class="u-gallery-text"></p>
                        </div>
                      </div>
                      <div class="u-effect-fade u-gallery-item u-gallery-item-6">
                        <div class="u-back-slide" data-image-width="828" data-image-height="828">
                          <img class="u-back-image u-expanded" src="images/KakaoTalk_20211119_150234575_10.jpg">
                        </div>
                        <div class="u-align-center u-over-slide u-shading u-over-slide-6">
                          <h3 class="u-gallery-heading"></h3>
                          <p class="u-gallery-text"></p>
                        </div>
                      </div>
                      <div class="u-effect-fade u-gallery-item u-gallery-item-7">
                        <div class="u-back-slide" data-image-width="828" data-image-height="825">
                          <img class="u-back-image u-expanded" src="images/KakaoTalk_20211119_150234575_06.jpg">
                        </div>
                        <div class="u-align-center u-over-slide u-shading u-over-slide-7">
                          <h3 class="u-gallery-heading"></h3>
                          <p class="u-gallery-text"></p>
                        </div>
                      </div>
                      <div class="u-effect-fade u-gallery-item u-gallery-item-8">
                        <div class="u-back-slide" data-image-width="828" data-image-height="819">
                          <img class="u-back-image u-expanded" src="images/KakaoTalk_20211119_150234575_02.jpg">
                        </div>
                        <div class="u-align-center u-over-slide u-shading u-over-slide-8">
                          <h3 class="u-gallery-heading"></h3>
                          <p class="u-gallery-text"></p>
                        </div>
                      </div>
                      <div class="u-effect-fade u-gallery-item u-gallery-item-9">
                        <div class="u-back-slide" data-image-width="828" data-image-height="828">
                          <img class="u-back-image u-expanded" src="images/KakaoTalk_20211119_150234575_05.jpg">
                        </div>
                        <div class="u-align-center u-over-slide u-shading u-over-slide-9">
                          <h3 class="u-gallery-heading"></h3>
                          <p class="u-gallery-text"></p>
                        </div>
                      </div>
                      <div class="u-effect-fade u-gallery-item u-gallery-item-10">
                        <div class="u-back-slide" data-image-width="828" data-image-height="828">
                          <img class="u-back-image u-expanded" src="images/KakaoTalk_20211119_150234575_08.jpg">
                        </div>
                        <div class="u-align-center u-over-slide u-shading u-over-slide-10">
                          <h3 class="u-gallery-heading"></h3>
                          <p class="u-gallery-text"></p>
                        </div>
                      </div>
                      <div class="u-effect-fade u-gallery-item u-gallery-item-11">
                        <div class="u-back-slide" data-image-width="828" data-image-height="828">
                          <img class="u-back-image u-expanded" src="images/KakaoTalk_20211119_150234575_11.jpg">
                        </div>
                        <div class="u-align-center u-over-slide u-shading u-over-slide-11">
                          <h3 class="u-gallery-heading"></h3>
                          <p class="u-gallery-text"></p>
                        </div>
                      </div>
                      <div class="u-effect-fade u-gallery-item u-gallery-item-12">
                        <div class="u-back-slide" data-image-width="825" data-image-height="816">
                          <img class="u-back-image u-expanded" src="images/KakaoTalk_20211119_150234575_07.jpg">
                        </div>
                        <div class="u-align-center u-over-slide u-shading u-over-slide-12">
                          <h3 class="u-gallery-heading"></h3>
                          <p class="u-gallery-text"></p>
                        </div>
                      </div>
                    </div> 
                     <button  data-page-id="654928509" class="u-active-none u-border-2 u-border-active-palette-2-dark-1 u-border-custom-color-4 u-border-hover-palette-2-base u-btn u-button-style u-custom-font u-heading-font u-hover-none u-none u-text-custom-color-4 u-text-hover-palette-2-base u-btn-9">더보기&nbsp;
                  <span class="u-icon u-text-custom-color-4"><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" style="width: 1em; height: 1em;"><path d="M441.156,322.876l-48.666-47.386c-3.319-3.243-8.619-3.234-11.93,0.017l-81.894,80.299V8.533 c0-4.71-3.823-8.533-8.533-8.533h-68.267c-4.71,0-8.533,3.823-8.533,8.533v347.273l-81.894-80.299    c-3.311-3.243-8.602-3.251-11.921-0.017l-48.666,47.386c-1.655,1.604-2.586,3.806-2.586,6.11c0,2.304,0.939,4.506,2.586,6.11 l179.2,174.481c1.655,1.613,3.806,2.423,5.948,2.423c2.15,0,4.292-0.811,5.956-2.423l179.2-174.481 c1.647-1.604,2.577-3.806,2.577-6.11C443.733,326.682,442.803,324.48,441.156,322.876z"></path></svg><img></span>
                  </button>
                  </div>
                  
                 
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-fd77"><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1">Queen Bee Project cafe please&nbsp;<br>our team member is worker that KMJ, LMS, PHG, LMS<br>and last queen bee, KHJ<br>Thank you
        </p>
      </div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/website-templates" target="_blank">
        <span>Website Templates</span>
      </a>
      <p class="u-text">
        <span>created with</span>
      </p>
      <a class="u-link" href="" target="_blank">
        <span>Website Builder Software</span>
      </a>. 
    </section>
  </body>
</html>