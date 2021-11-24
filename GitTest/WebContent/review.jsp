<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="ko">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="4.5">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>review</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="review.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 3.30.2, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "Cafe_Please",
		"logo": "images/_.png"
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="review">
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
    <section class="u-clearfix u-section-1" id="sec-0564">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h5 class="u-text u-text-default u-text-1">카페이름</h5>
        <h2 class="u-text u-text-default u-text-2">4.5</h2><span class="u-icon u-icon-circle u-text-grey-10 u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-15dc"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-15dc" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span><span class="u-icon u-icon-circle u-text-grey-10 u-icon-2"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-bf98"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-bf98" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span><span class="u-icon u-icon-circle u-text-grey-10 u-icon-3"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-6918"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-6918" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span><span class="u-icon u-icon-circle u-text-grey-10 u-icon-4"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-c8f7"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-c8f7" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span><span class="u-icon u-icon-circle u-text-grey-10 u-icon-5"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-3807"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-3807" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span>
        <h6 class="u-text u-text-default u-text-3">맛</h6><span class="u-icon u-icon-circle u-text-grey-10 u-icon-6"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-7d72"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-7d72" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span><span class="u-icon u-icon-circle u-text-grey-10 u-icon-7"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-2eab"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-2eab" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span><span class="u-icon u-icon-circle u-text-grey-10 u-icon-8"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-db5d"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-db5d" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span><span class="u-icon u-icon-circle u-text-grey-10 u-icon-9"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-e50b"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-e50b" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span><span class="u-icon u-icon-circle u-text-grey-10 u-icon-10"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1b78"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-1b78" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span>
        <h6 class="u-text u-text-default u-text-4">뷰</h6>
        <div class="u-border-3 u-border-grey-dark-1 u-line u-line-horizontal u-line-1"></div>
        <h5 class="u-text u-text-default u-text-5">평균 평점</h5><span class="u-icon u-icon-circle u-text-grey-10 u-icon-11"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-01fa"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-01fa" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span><span class="u-icon u-icon-circle u-text-grey-10 u-icon-12"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-a201"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-a201" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span><span class="u-icon u-icon-circle u-text-grey-10 u-icon-13"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-88b6"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-88b6" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span><span class="u-icon u-icon-circle u-text-grey-10 u-icon-14"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-d902"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-d902" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span><span class="u-icon u-icon-circle u-text-grey-10 u-icon-15"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 55.867 55.867" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-06d2"></use></svg><svg class="u-svg-content" viewBox="0 0 55.867 55.867" x="0px" y="0px" id="svg-06d2" style="enable-background:new 0 0 55.867 55.867;"><path d="M55.818,21.578c-0.118-0.362-0.431-0.626-0.808-0.681L36.92,18.268L28.83,1.876c-0.168-0.342-0.516-0.558-0.896-0.558
	s-0.729,0.216-0.896,0.558l-8.091,16.393l-18.09,2.629c-0.377,0.055-0.689,0.318-0.808,0.681c-0.117,0.361-0.02,0.759,0.253,1.024
	l13.091,12.76l-3.091,18.018c-0.064,0.375,0.09,0.754,0.397,0.978c0.309,0.226,0.718,0.255,1.053,0.076l16.182-8.506l16.18,8.506
	c0.146,0.077,0.307,0.115,0.466,0.115c0.207,0,0.413-0.064,0.588-0.191c0.308-0.224,0.462-0.603,0.397-0.978l-3.09-18.017
	l13.091-12.761C55.838,22.336,55.936,21.939,55.818,21.578z"></path></svg></span>
        <h6 class="u-text u-text-default u-text-6">서비스</h6>
        <div class="u-table u-table-responsive u-table-1">
          <table class="u-table-entity">
            <colgroup>
              <col width="100%">
            </colgroup>
            <thead class="u-align-center u-custom-color-2 u-table-header u-table-header-1">
              <tr style="height: 51px;">
                <th class="u-border-1 u-border-white u-table-cell">리뷰</th>
              </tr>
            </thead>
            <tbody class="u-align-center u-table-alt-white u-table-body">
              <tr style="height: 215px;">
                <td class="u-border-1 u-border-grey-5 u-table-cell">Description</td>
              </tr>
            </tbody>
          </table>
        </div>
        <a href="Cafe_Info.jsp" data-page-id="95186816" class="u-border-none u-btn u-btn-round u-button-style u-custom-color-4 u-hover-palette-1-light-1 u-radius-6 u-btn-1">저장</a>
      </div>
    </section>
    
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-fd77"><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1">Queen Bee Project cafe please&nbsp;<br>our team member is worker that KMJ, LMS, PHG, LMS<br>and last queen bee, KHJ<br>Thank you
        </p>
      </div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/website-design" target="_blank">
        <span>Website Design</span>
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