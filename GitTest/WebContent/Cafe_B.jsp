<%@page import="Model.CafeImagesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.CafeImagesDAO"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="ko">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="오늘의 인기 카페에요 !">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Cafe_B</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="Cafe_B.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
   <!--  <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script> -->
    <meta name="generator" content="Nicepage 3.30.2, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "Cafe_Please",
		"logo": "images/_.png"
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Cafe_B">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
    
    <style type="text/css">
	
		* {
	margin: 0px;
	padding: 0px;
}

#user_icon {
	position: relative;
	top: 10px;
	margin-right: 20px;
}

#user_id {
	margin-right: 20px;
}

#logo {
	margin-left: 70px;
}

#top_menu {
	position: absolute;
	display: inline;
	top: 20px;
	right: 10px;
	color: black;
}

#top_menu a {
	color: #401F00;
}

#home {
	margin-right: 20px;
}

#post {
	margin-right: 20px;
}

#login {
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


	<section class="u-clearfix u-section-1" id="sec-e384">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-align-center u-text u-text-custom-color-2 u-text-1">청명한 가을날 가기 좋은<br>
          <span class="u-text-custom-color-5">북구</span>에 있는 카페에요!
        </h2>
        <div class="u-form u-form-1">
          <form action="SearchServiceCon" method="POST" class="u-clearfix u-form-horizontal u-form-spacing-10 u-inner-form" style="padding: 10px" source="custom" name="form">
            <div class="u-form-group u-form-group-1">
              <label for="email-2555" class="u-form-control-hidden u-label u-label-1">Email</label>
              <input type="text" placeholder="검색하고 싶은 카페를 입력하세요" id="email-2555" name="search_cafe" class="u-border-2 u-border-grey-5 u-input u-input-rectangle u-radius-45 u-white" required="required">
            </div>
            <div class="u-align-left u-form-group u-form-submit">
               <input type="submit" value="검색" class="u-active-grey-90 u-border-2 u-border-active-custom-color-4 u-border-custom-color-4 u-border-hover-grey-90 u-btn u-btn-round u-btn-submit u-button-style u-custom-color-4 u-hover-grey-90 u-radius-50 u-btn-1">
            </div>
            <div class="u-form-send-message u-form-send-success"> Thank you! Your message has been sent. </div>
            <div class="u-form-send-error u-form-send-message"> Unable to send your message. Please fix errors then try again. </div>
            <input type="hidden" value="" name="recaptchaResponse">
          </form>
        </div>
        <h6 class="u-text u-text-custom-color-2 u-text-2"><a href="#" role="button">#용전동</a></h6>
        <h6 class="u-text u-text-custom-color-2 u-text-3"><a href="#" role="button">#운암동</a></h6>
        <h6 class="u-text u-text-custom-color-2 u-text-4"><a href="#" role="button">#전남대</a></h6>
        
             <%
            CafeImagesDAO dao = new CafeImagesDAO();
			ArrayList<CafeImagesDTO> i_list = dao.ViewImages_B();
            System.out.println(i_list.size());
			%>
        
        <div class="u-gallery u-layout-grid u-lightbox u-show-text-on-hover u-gallery-1" id="carousel-185d">
          <div class="u-gallery-inner u-gallery-inner-1" role="listbox">
            
            <% for(int i = 0; i<i_list.size(); i++){ %> 
            <a href="CafeInfoServiceCon?img=<%= i_list.get(i).getPic_path() %>"> 
            <div class="u-effect-fade u-gallery-item u-gallery-item-1">
              <div class="u-back-slide" data-image-width="828" data-image-height="823">
                <img class="u-back-image u-expanded" src="<%= i_list.get(i).getPic_path() %>" alt="P<%= i+1 %>.jpg">
              </div>
              <div class="u-align-center u-over-slide u-shading u-over-slide-1">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            </a>
            <%} %> 
                   
          </div>
        </div>
        <a href="Home.jsp#sec-a84a" data-page-id="654928509" class="u-active-none u-border-2 u-border-active-palette-2-dark-1 u-border-custom-color-4 u-border-hover-palette-2-base u-btn u-button-style u-custom-font u-heading-font u-hover-none u-none u-text-custom-color-4 u-text-hover-palette-2-base u-btn-2">더보기&nbsp;<span class="u-icon u-text-custom-color-4"><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" style="width: 1em; height: 1em;"><path d="M441.156,322.876l-48.666-47.386c-3.319-3.243-8.619-3.234-11.93,0.017l-81.894,80.299V8.533 c0-4.71-3.823-8.533-8.533-8.533h-68.267c-4.71,0-8.533,3.823-8.533,8.533v347.273l-81.894-80.299    c-3.311-3.243-8.602-3.251-11.921-0.017l-48.666,47.386c-1.655,1.604-2.586,3.806-2.586,6.11c0,2.304,0.939,4.506,2.586,6.11 l179.2,174.481c1.655,1.613,3.806,2.423,5.948,2.423c2.15,0,4.292-0.811,5.956-2.423l179.2-174.481 c1.647-1.604,2.577-3.806,2.577-6.11C443.733,326.682,442.803,324.48,441.156,322.876z"></path></svg><img></span>
        </a>
      </div>
    </section>
    
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-fd77"><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1">Queen Bee Project cafe please&nbsp;<br>our team member is worker that KMJ, LMS, PHG, LMS<br>and last queen bee, KHJ<br>Thank you
        </p>
      </div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/html-templates" target="_blank">
        <span>HTML Template</span>
      </a>
      <p class="u-text">
        <span>created with</span>
      </p>
      <a class="u-link" href="https://nicepage.cloud" target="_blank">
        <span>Website Builder</span>
      </a>. 
    </section>
  </body>
</html>