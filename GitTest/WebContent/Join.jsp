<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="ko">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="INTUITIVE">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Cafe Please!</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="Join.css" media="screen">
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
    <meta property="og:title" content="Join">
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
    <section class="u-clearfix u-uploaded-video u-video u-section-1" id="sec-5643">
      <div class="u-background-video u-expanded u-video-contain" style="">
        <div class="embed-responsive">
          <video class="embed-responsive-item" data-autoplay="1" loop="" muted="" autoplay="autoplay" playsinline="">
            <source src="files/cafe_b_ground.mp4" type="video/mp4">
            <p>Your browser does not support HTML5 video.</p>
          </video>
        </div>
      </div>
      <div class="u-absolute-hcenter u-expanded u-opacity u-opacity-40 u-shape u-shape-rectangle u-white"></div>
      <div class="u-opacity u-opacity-60 u-radius-15 u-shape u-shape-round u-white u-shape-2"></div>
      <h1 class="u-text u-text-1">Join us</h1>
      <div class="u-form u-form-1">
        <form action="JoinServiceCon" method="post" class="u-clearfix u-form-spacing-20 u-form-vertical u-inner-form" style="padding: 10px" source="custom" name="form">
          <div class="u-form-group u-form-name">
            <label for="name-3b9a" class="u-form-control-hidden u-label">Name</label>
            <input type="text" placeholder="Enter your ID" id="name-3b9a" name="id" class="u-border-2 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-input-1" required="">
          </div>
          <div class="u-form-group">
            <label for="email-3b9a" class="u-form-control-hidden u-label">Password</label>
            <input type="password" placeholder="Enter YOUR PASSWORD" id="email-3b9a" name="pwd" class="u-border-2 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-input-2" required="required">
          </div>
          <div class="u-form-group">
            <label for="message-3b9a" class="u-form-control-hidden u-label">nickname</label>
            <input placeholder="Enter your NICKNAME" rows="4" cols="50" id="message-3b9a" name="nick" class="u-border-2 u-border-black u-border-no-left u-border-no-right u-border-no-top u-input u-input-rectangle u-input-3" required="required" type="text">
          </div>
          <div class="u-form-group u-form-radiobutton u-form-group-4">
            <div class="u-form-radio-button-wrapper"> 
              <input type="radio" name="gender" value="Male">
              <label class="u-label" for="radiobutton">Male</label>
              <br>
              <input type="radio" name="gender" value="Female">
              <label class="u-label" for="radiobutton">Female</label>
              <br>
            </div>
          </div>
          <div class="u-align-center u-form-group u-form-submit">
           
            <input type="submit" value="회원가입" class="u-border-2 u-border-black u-btn u-btn-rectangle u-btn-submit u-button-style u-none u-btn-1"><br>
           <!-- <a href="Home.jsp" >  </a>--> 
           
           <input type="submit" value="submit" class="u-form-control-hidden">   
          </div>
        <!-- <div class="u-form-send-message u-form-send-success"> Thank you! Your message has been sent. </div>
          <div class="u-form-send-error u-form-send-message"> Unable to send your message. Please fix errors then try again. </div>
          <input type="hidden" value="" name="recaptchaResponse"> -->  
        </form>
      </div>
      <h3 class="u-align-center u-text u-text-2">Welcome to Cafe Please : )</h3>
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