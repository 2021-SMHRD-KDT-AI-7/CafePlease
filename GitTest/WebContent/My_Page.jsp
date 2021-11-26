<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="ko">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>My_Page</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="My_Page.css" media="screen">
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
    <meta property="og:title" content="My_Page">
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
	</style>
  </head>
  <body class="u-body">  
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
    <section class="u-align-left u-clearfix u-section-1" id="sec-f0aa">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h3 class="u-text u-text-custom-color-2 u-text-default u-text-1">
         <%if(info != null){ %>
          <font color="#ffa242"><b><%=info.getM_nickname() %></b>
           
              <%} %>
          </font>님 환영합니다!<span style="font-weight: 700;"></span>
        </h3>
        
        <!--마이페이지 탭 메뉴 부분  -->
        <div class="u-expanded-width u-tab-links-align-justify u-tabs u-tabs-1">
          <ul class="u-spacing-30 u-tab-list u-unstyled" role="tablist">
            <li class="u-tab-item" role="presentation">
              <a class="active u-active-custom-color-4 u-button-style u-tab-link u-tab-link-1" id="link-tab-3a42" href="#tab-3a42" role="tab" aria-controls="tab-3a42" aria-selected="true">내가쓴 게시글 관리</a>
            </li>
            <li class="u-tab-item" role="presentation">
              <a class="u-active-custom-color-4 u-button-style u-tab-link u-tab-link-2" id="link-tab-4d57" href="#tab-4d57" role="tab" aria-controls="tab-4d57" aria-selected="false">찜목록</a>
            </li>
            <li class="u-tab-item u-tab-item-3" role="presentation">
              <a class="u-active-custom-color-4 u-button-style u-tab-link u-tab-link-3" id="tab-d7e7" href="#link-tab-d7e7" role="tab" aria-controls="link-tab-d7e7" aria-selected="false">회원정보 수정</a>
            </li>
          </ul>
          
          <!-- 마이페이지 내용 시작 -->
          <div class="u-tab-content">
            <div class="u-align-left u-container-style u-shape-rectangle u-tab-active u-tab-pane u-tab-pane-1" id="tab-3a42" role="tabpanel" aria-labelledby="link-tab-3a42">
              <div class="u-container-layout u-container-layout-1">
                <div class="u-table u-table-responsive u-table-1">
                  <table class="u-table-entity">
                    <colgroup>
                      <col width="5.6%">
                      <col width="71.3%">
                      <col width="15.3%">
                      <col width="7.8%">
                    </colgroup>
                    <thead class="u-align-center u-custom-color-2 u-table-header u-table-header-1">
                      <tr style="height: 33px;">
                        <th class="u-border-1 u-border-white u-table-cell">번호</th>
                        <th class="u-border-1 u-border-white u-table-cell">내용</th>
                        <th class="u-border-1 u-border-white u-table-cell">작성일</th>
                        <th class="u-border-1 u-border-white u-table-cell">댓글 수</th>
                      </tr>
                    </thead>
                    <tbody class="u-align-center u-table-alt-white u-table-body">
                      <tr style="height: 75px;">
                        <td class="u-border-1 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-5">1</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">Description</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">2021.05.10</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">15</td>
                      </tr>
                      <tr style="height: 76px;">
                        <td class="u-border-1 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-9">2</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">Description</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell"> 2021.05.10</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">20</td>
                      </tr>
                      <tr style="height: 76px;">
                        <td class="u-border-1 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-13">3</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">Description</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell"> 2021.05.10</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">3</td>
                      </tr>
                      <tr style="height: 76px;">
                        <td class="u-border-1 u-border-grey-5 u-first-column u-grey-5 u-table-cell u-table-cell-17">4</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">Description</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell"> 2021.05.10</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">0</td>
                      </tr>
                      <tr style="height: 76px;">
                        <td class="u-border-1 u-border-grey-5 u-grey-5 u-table-cell u-table-cell-21">5</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">Description</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">2021.11.18</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">2</td>
                      </tr>
                      <tr style="height: 76px;">
                        <td class="u-border-1 u-border-grey-5 u-grey-5 u-table-cell u-table-cell-25">6</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">Description</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell"></td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell"></td>
                      </tr>
                      <tr style="height: 76px;">
                        <td class="u-border-1 u-border-grey-5 u-grey-5 u-table-cell u-table-cell-29">7</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell">Description</td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell"></td>
                        <td class="u-border-1 u-border-grey-5 u-table-cell"></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
            
            <!-- 게시글 찾기...기능?? 시간되면하자... -->
                <div class="u-form u-form-1">
                  <form action="#" method="POST" class="u-clearfix u-form-horizontal u-form-spacing-11 u-inner-form" style="padding: 0px;" source="custom" name="form">
                    <div class="u-form-group u-form-group-1">
                      <label for="email-2555" class="u-form-control-hidden u-label u-label-1">Email</label>
                      <input type="text" id="email-2555" name="search_cafe" class="u-border-2 u-border-grey-5 u-input u-input-rectangle u-radius-45 u-white" required="required" placeholder="검색어를 입력하세요">
                    </div>
                    <div class="u-align-left u-form-group u-form-submit">
                      <a href="#" class="u-active-custom-color-4 u-border-2 u-border-active-custom-color-4 u-border-custom-color-4 u-border-hover-custom-color-4 u-btn u-btn-round u-btn-submit u-button-style u-custom-color-4 u-hover-custom-color-4 u-radius-50 u-btn-1">검색</a>
                      <input type="submit" value="submit" class="u-form-control-hidden">
                    </div>
                    <div class="u-form-send-message u-form-send-success"> Thank you! Your message has been sent. </div>
                    <div class="u-form-send-error u-form-send-message"> Unable to send your message. Please fix errors then try again. </div>
                    <input type="hidden" value="" name="recaptchaResponse">
                  </form>
                </div>
              </div>
            </div>
            
            
            <!--찜한 카페 목록 -->
            <div class="u-align-left u-container-style u-shape-rectangle u-tab-pane u-tab-pane-2" id="tab-4d57" role="tabpanel" aria-labelledby="link-tab-4d57">
              <div class="u-container-layout u-container-layout-2">
                <h6 class="u-text u-text-custom-color-2 u-text-default u-text-2">찜한 카페&nbsp;<span class="u-text-custom-color-7">6</span>개
                </h6>
                <div class="u-list u-list-1">
                  <div class="u-repeater u-repeater-1">
                    <div class="u-container-style u-list-item u-repeater-item">
                      <div class="u-container-layout u-similar-container u-container-layout-3">
                        <img alt="" class="u-expanded-width u-image u-image-default u-image-1" data-image-width="1125" data-image-height="1500" src="images/pexelsphoto949067.jpeg">
                        <h3 class="u-text u-text-default u-text-3">마음, 안녕</h3>
                        <a href="Cafe_Info.jsp" data-page-id="95186816" class="u-active-none u-border-2 u-border-hover-palette-2-base u-border-palette-2-light-1 u-btn u-button-style u-custom-font u-heading-font u-hover-none u-none u-text-body-color u-btn-2">해당 카페로 이동</a>
                      </div>
                    </div>
                    <div class="u-container-style u-list-item u-repeater-item">
                      <div class="u-container-layout u-similar-container u-container-layout-4">
                        <img alt="" class="u-expanded-width u-image u-image-default u-image-2" data-image-width="828" data-image-height="828" src="images/cafe4.jpg">
                        <h3 class="u-text u-text-default u-text-4"> 오버롤</h3>
                        <a href="Cafe_Info.jsp" data-page-id="95186816" class="u-active-none u-border-2 u-border-hover-palette-2-base u-border-palette-2-light-1 u-btn u-button-style u-custom-font u-heading-font u-hover-none u-none u-text-body-color u-btn-3"> 해당 카페로 이동</a>
                      </div>
                    </div>
                    <div class="u-container-style u-list-item u-repeater-item">
                      <div class="u-container-layout u-similar-container u-container-layout-5">
                        <img alt="" class="u-expanded-width u-image u-image-default u-image-3" data-image-width="828" data-image-height="822" src="images/cafe5.jpg">
                        <h3 class="u-text u-text-default u-text-5">동쿠커피</h3>
                        <a href="Cafe_Info.jsp" data-page-id="95186816" class="u-active-none u-border-2 u-border-hover-palette-2-base u-border-palette-2-light-1 u-btn u-button-style u-custom-font u-heading-font u-hover-none u-none u-text-body-color u-btn-4"> 해당 카페로 이동</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="u-expanded-width u-list u-list-2">
                  <div class="u-repeater u-repeater-2">
                    <div class="u-container-style u-list-item u-repeater-item">
                      <div class="u-container-layout u-similar-container u-container-layout-6">
                        <img class="u-image u-image-4" src="images/cafe2.jpg" data-image-width="828" data-image-height="827">
                        <h3 class="u-text u-text-default u-text-6">데이오프나이트</h3>
                        <a href="Cafe_Info.jsp" data-page-id="95186816" class="u-active-none u-border-2 u-border-hover-palette-2-base u-border-palette-2-light-1 u-btn u-button-style u-hover-none u-none u-text-body-color u-btn-5"> 해당 카페로 이동</a>
                      </div>
                    </div>
                    <div class="u-container-style u-list-item u-repeater-item">
                      <div class="u-container-layout u-similar-container u-container-layout-7">
                        <img class="u-image u-image-5" src="images/cafe1.jpg" data-image-width="828" data-image-height="823">
                        <h3 class="u-text u-text-default u-text-7"> 그런느낌</h3>
                        <a href="Cafe_Info.jsp" data-page-id="95186816" class="u-active-none u-border-2 u-border-hover-palette-2-base u-border-palette-2-light-1 u-btn u-button-style u-hover-none u-none u-text-body-color u-btn-6"> 해당 카페로 이동</a>
                      </div>
                    </div>
                    <div class="u-container-style u-list-item u-repeater-item">
                      <div class="u-container-layout u-similar-container u-container-layout-8">
                        <img class="u-image u-image-6" src="images/cafe3.jpg" data-image-width="828" data-image-height="823">
                        <h3 class="u-text u-text-default u-text-8">까브</h3>
                        <a href="Cafe_Info.jsp" data-page-id="95186816" class="u-active-none u-border-2 u-border-hover-palette-2-base u-border-palette-2-light-1 u-btn u-button-style u-hover-none u-none u-text-body-color u-btn-7"> 해당 카페로 이동</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="u-align-left u-container-style u-shape-rectangle u-tab-pane" id="link-tab-d7e7" role="tabpanel" aria-labelledby="tab-d7e7">
              <div class="u-container-layout u-container-layout-9">
                <p class="u-custom-font u-heading-font u-large-text u-text u-text-variant u-text-9">변경하실 정보를 입력해주세요</p><span class="u-icon u-icon-circle u-text-custom-color-4 u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 360 360" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-8163"></use></svg><svg class="u-svg-content" viewBox="0 0 360 360" x="0px" y="0px" id="svg-8163" style="enable-background:new 0 0 360 360;"><g><path d="M303.118,0H56.882C25.516,0,0,25.516,0,56.882v246.236C0,334.484,25.516,360,56.882,360h246.236   C334.484,360,360,334.484,360,303.118V56.882C360,25.516,334.484,0,303.118,0z M322.078,303.118c0,10.454-8.506,18.96-18.959,18.96   H56.882c-10.454,0-18.959-8.506-18.959-18.96V56.882c0-10.454,8.506-18.959,18.959-18.959h246.236   c10.454,0,18.959,8.506,18.959,18.959V303.118z"></path><path d="M249.844,106.585c-6.116,0-11.864,2.383-16.19,6.71l-84.719,84.857l-22.58-22.578c-4.323-4.324-10.071-6.706-16.185-6.706   c-6.115,0-11.863,2.382-16.187,6.705c-4.323,4.323-6.703,10.071-6.703,16.185c0,6.114,2.38,11.862,6.703,16.184l38.77,38.77   c4.323,4.324,10.071,6.706,16.186,6.706c6.112,0,11.862-2.383,16.19-6.71L266.03,145.662c8.923-8.926,8.922-23.448,0-32.374   C261.707,108.966,255.958,106.585,249.844,106.585z"></path>
</g></svg></span>

				<!-- 회원정보 수정 -->
                 <div class="u-form u-form-21">
                  <form action="MemberUpdateCon" method="POST" class="u-clearfix u-form-spacing-30 u-form-vertical u-inner-form" source="custom" name="form" style="padding: 10px;">
                    <div class="u-form-group u-form-group-3">
                      <label for="text-7466" class="u-form-control-hidden u-label"></label>
                      <input type="text" placeholder="변경하실 비밀번호를 입력해주세요" id="text-7466" name="ed_pw" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-radius-48 u-white">
                    </div>
                    <div class="u-form-group u-form-group-4">
                      <label for="text-7c4e" class="u-form-control-hidden u-label"></label>
                      <input type="text" placeholder="비밀번호를 한 번더 입력해주세요" id="text-7c4e" name="ed_pw_check" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-radius-48 u-white">
                    </div>
                    <div class="u-form-group u-form-group-5">
                      <label for="text-13b4" class="u-form-control-hidden u-label"></label>
                      <input type="text" placeholder="변경하실 닉네임을 입력해주세요" id="text-13b4" name="ed_nick" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-radius-48 u-white">
                    </div>
                    <div class="u-align-center u-form-group u-form-submit">
                      <input type="submit" class="u-border-none u-btn u-btn-submit u-button-style u-custom-color-4 u-hover-palette-1-dark-1 u-btn-8"><br>
                     
                      <input type="submit" value="submit" class="u-form-control-hidden">
                    </div>
                    <div class="u-form-send-message u-form-send-success"> Thank you! Your message has been sent. </div>
                    <div class="u-form-send-error u-form-send-message"> Unable to send your message. Please fix errors then try again. </div>
                    <input type="hidden" value="" name="recaptchaResponse">
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- < 회원정보 수정 
                <div class="u-form u-form-21">
                  <form action="MemberUpdateCon" method="POST" class="u-clearfix u-form-spacing-30 u-form-vertical u-inner-form" source="custom" name="form" style="padding: 10px;">
                    <div class="u-form-group u-form-group-3">
                      <label for="text-7466" class="u-form-control-hidden u-label"></label>
                      <input type="text" placeholder="변경하실 비밀번호를 입력해주세요" id="text-7466" name="ed_pw" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-radius-48 u-white">
                    </div>
                    <div class="u-form-group u-form-group-4">
                      <label for="text-7c4e" class="u-form-control-hidden u-label"></label>
                      <input type="text" placeholder="비밀번호를 한 번더 입력해주세요" id="text-7c4e" name="ed_pw_check" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-radius-48 u-white">
                    </div>
                    <div class="u-form-group u-form-group-5">
                      <label for="text-13b4" class="u-form-control-hidden u-label"></label>
                      <input type="text" placeholder="변경하실 닉네임을 입력해주세요" id="text-13b4" name="ed_nick" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-radius-48 u-white">
                    </div>
                    <div class="u-align-center u-form-group u-form-submit">
                      <input type="submit" class="u-border-none u-btn u-btn-submit u-button-style u-custom-color-4 u-hover-palette-1-dark-1 u-btn-8"><br>
                     
                      <input type="submit" value="submit" class="u-form-control-hidden">
                    </div>
                    <div class="u-form-send-message u-form-send-success"> Thank you! Your message has been sent. </div>
                    <div class="u-form-send-error u-form-send-message"> Unable to send your message. Please fix errors then try again. </div>
                    <input type="hidden" value="" name="recaptchaResponse">
                  </form>
                </div> -->
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-fd77"><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1">Queen Bee Project cafe please&nbsp;<br>our team member is worker that KMJ, LMS, PHG, LMS<br>and last queen bee, KHJ<br>Thank you
        </p>
      </div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/jsp-templates" target="_blank">
        <span>HTML Template</span>
      </a>
      <p class="u-text">
        <span>created with</span>
      </p>
      <a class="u-link" href="https://nicepage.com/website-builder" target="_blank">
        <span>Website Builder</span>
      </a>. 
    </section>
  </body>
</html>