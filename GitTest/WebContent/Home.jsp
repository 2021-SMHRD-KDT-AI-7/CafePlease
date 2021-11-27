<%@page import="Model.CafeImagesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.CafeImagesDAO"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="ko">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="welcome">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Home</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
	<link rel="stylesheet" href="Home.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
  <!--  <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>  -->
    <meta name="generator" content="Nicepage 3.30.2, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "Cafe_Please",
		"logo": "images/_.png"
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Home">
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
		.slide1{
		
			height: 500px;
		}
		
		.cafe_po{
			height: 700px;
		}
		.slide1>img{
			height: 350px;
		}
		.u-over-slide{
			display: none;
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
      
    <section class="u-clearfix u-uploaded-video u-video u-video-cover u-section-1" id="sec-379b">
      <div class="u-background-video u-expanded" style="">
        <div class="embed-responsive">
          <video class="embed-responsive-item" data-autoplay="1" loop="" muted="" autoplay="autoplay" playsinline="">
            <source src="files/cafe_b_ground-1.mp4" type="video/mp4">
            <p>Your browser does not support HTML5 video.</p>
          </video>
        </div>
      </div>
      <div class="u-absolute-hcenter u-expanded u-opacity u-opacity-40 u-shape u-shape-rectangle u-white u-shape-1"></div>
      <h2 class="u-align-center u-text u-text-custom-color-2 u-text-1">welcome</h2>
      <h6 class="u-align-center u-text u-text-custom-color-2 u-text-2">Cafe Please, Please cafe !</h6>
      <a href="Home.jsp#sec-d422" data-page-id="654928509" class="u-active-none u-align-center u-border-4 u-border-active-white u-border-custom-color-2 u-btn u-btn-rectangle u-button-style u-hover-none u-none u-text-custom-color-2 u-btn-1">Go to Cafe</a>
    </section>
    <section class="u-clearfix u-section-2" id="sec-d422">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-align-center u-text u-text-custom-color-2 u-text-1">오늘의 인기 <span class="u-text-custom-color-5">카페</span>에요 !
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
        <h6 class="u-align-center u-text u-text-custom-color-2 u-text-2">
          <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-custom-color-2 u-btn-2" href="Cafe_G.jsp" data-page-id="43409022">#광산구</a>
        </h6>
        <h6 class="u-align-center u-text u-text-custom-color-2 u-text-3">
          <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-custom-color-2 u-btn-3" href="Cafe_B.jsp" data-page-id="2287327524">#북구</a>
        </h6>
        <h6 class="u-align-center u-text u-text-custom-color-2 u-text-4">
          <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-custom-color-2 u-btn-4" href="Cafe_N.jsp" data-page-id="2655117539">#남구</a>
        </h6>
        <h6 class="u-align-center u-text u-text-custom-color-2 u-text-5">
          <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-custom-color-2 u-btn-5" href="Cafe_S.jsp" data-page-id="188919205">#서구</a>
        </h6>
        <h6 class="u-align-center u-text u-text-custom-color-2 u-text-6">
          <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-custom-color-2 u-btn-6" href="Cafe_D.jsp" data-page-id="83531760">#동구</a>
        </h6>
        
        <!-- 인기순위 갤러리 -->
        <div class="u-expanded-width u-gallery u-layout-grid u-lightbox u-show-text-on-hover u-gallery-1">
          <div class="u-gallery-inner u-gallery-inner-1 cafe_po">
            <div class="u-effect-fade u-gallery-item ">
              <div class="u-back-slide slide1" data-image-width="828" data-image-height="823">
                <img class="u-back-image u-expanded" src="images/cafe1.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-1">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            
            <%-- <%
            CafeImagesDAO dao = new CafeImagesDAO();
			ArrayList<CafeImagesDTO> i_list = dao.ViewImages();
			%>
			<% for(int i = 0; i<i_list.size(); i++){ %> --%>
			
            <!-- 여기서부터 이미지를 뿌려줄 곳 -->
            <div class="u-effect-fade u-gallery-item" data-href="Cafe_Info.jsp" data-page-id="95186816">
              <div class="u-back-slide slide1" data-image-width="828" data-image-height="827">
                <img class="u-back-image u-expanded" src="images/cafe5.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-2">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            <%-- <%} %> --%>
            
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide slide1" data-image-width="828" data-image-height="822">
                <img class="u-back-image u-expanded" src="images/cafe5.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-3">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide slide1" data-image-width="828" data-image-height="828">
                <img class="u-back-image u-expanded" src="images/cafe4.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-4">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide slide1" data-image-width="828" data-image-height="819">
                <img class="u-back-image u-expanded" src="images/cafe6.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-5">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide slide1" data-image-width="828" data-image-height="823">
                <img class="u-back-image u-expanded" src="images/cafe3.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-6">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
          </div>
        </div>
      <!--   <a href="Home.jsp#sec-a84a" data-page-id="654928509" class="u-active-none u-border-2 u-border-active-palette-2-dark-1 u-border-custom-color-4 u-border-hover-palette-2-base u-btn u-button-style u-custom-font u-heading-font u-hover-none u-none u-text-custom-color-4 u-text-hover-palette-2-base u-btn-7">더보기&nbsp;<span class="u-icon u-text-custom-color-4"><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" style="width: 1em; height: 1em;"><path d="M441.156,322.876l-48.666-47.386c-3.319-3.243-8.619-3.234-11.93,0.017l-81.894,80.299V8.533 c0-4.71-3.823-8.533-8.533-8.533h-68.267c-4.71,0-8.533,3.823-8.533,8.533v347.273l-81.894-80.299    c-3.311-3.243-8.602-3.251-11.921-0.017l-48.666,47.386c-1.655,1.604-2.586,3.806-2.586,6.11c0,2.304,0.939,4.506,2.586,6.11 l179.2,174.481c1.655,1.613,3.806,2.423,5.948,2.423c2.15,0,4.292-0.811,5.956-2.423l179.2-174.481 c1.647-1.604,2.577-3.806,2.577-6.11C443.733,326.682,442.803,324.48,441.156,322.876z"></path></svg><img></span>
        </a> -->
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
    </section><span style="height: 64px; width: 64px; margin-left: 0px; margin-right: auto; margin-top: 0px; background-image: none; right: 20px; bottom: 20px" class="u-back-to-top u-icon u-icon-circle u-opacity u-opacity-85 u-spacing-15 u-white" data-href="#">
        <svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 551.13 551.13"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1d98"></use></svg>
        <svg class="u-svg-content" enable-background="new 0 0 551.13 551.13" viewBox="0 0 551.13 551.13" xmlns="http://www.w3.org/2000/svg" id="svg-1d98"><path d="m275.565 189.451 223.897 223.897h51.668l-275.565-275.565-275.565 275.565h51.668z"></path></svg>
    </span>
  </body>
</html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>