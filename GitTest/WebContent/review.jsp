<%@page import="Model.ReviewDAO"%>
<%@page import="Model.CafeDTO"%>
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
		#review{
			margin-bottom:10px;
			width: 1000px;
			height: 200px;
			
		} 
		.blind{
		/*   position: absolute; */
  		  overflow: hidden;
 
  		  border: none;
          clip: rect(0, 0, 0, 0);
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
    <section class="u-clearfix u-section-1" id="sec-0564">
      <div class="u-clearfix u-sheet u-sheet-1">\
      <%CafeDTO inf = (CafeDTO) session.getAttribute("inf");%>
        <h5 class="u-text u-text-default u-text-1"><%=inf.getCafe_name() %></h5>
        
        <%ReviewDAO dao = new ReviewDAO(); %>
        <h2 class="u-text u-text-default u-text-2"><%=dao.avg_review()%>점</h2>

			<!-- 카페별점부분  -->
			<h6 class="u-text u-text-default u-text-3">카페에 대한 원두점수를 주세요!</h6>
		 <form action="ReviewServiceCon" method="post">
			<!-- 원두점수~ -->
			<div>
			<span class="u-icon u-icon-circle u-text-grey-10 u-icon-6 blind" style="margin-top:20px;">
				<label for="1"><img src="./images/coffe_co.gif" ></label><input type="radio" name="cafe_rating" id="1" value="2">
		    </span>
		    
			<span class="u-icon u-icon-circle u-text-grey-10 u-icon-7 blind">
				<label for="2"><img src="./images/coffe_co.gif" ></label><input type="radio" name="cafe_rating" id="2" value="1">
				</span>
				
				<span class="u-icon u-icon-circle u-text-grey-10 u-icon-8 blind">
					<label for="3"><img src="./images/coffe_co.gif" ></label><input type="radio" name="cafe_rating" id="3" value="3">
				</span>
				
				<span class="u-icon u-icon-circle u-text-grey-10 u-icon-9 blind">
					<label for="4"><img src="./images/coffe_co.gif" ></label><input type="radio" name="cafe_rating" id="4" value="5">
				</span>
					
				<span class="u-icon u-icon-circle u-text-grey-10 u-icon-10 blind">
				<label for="5"><img src="./images/coffe_co.gif" ></label><input type="radio" name="cafe_rating" id="5" value="4">
				</span>
			
			</div>
			<h6 class="u-text u-text-default u-text-4">평점</h6> 
        <div class="u-border-3 u-border-grey-dark-1 u-line u-line-horizontal u-line-1" style="margin-bottom: 20px;"></div>
        <h5 class="u-text u-text-default u-text-5">평균 평점</h5>
   			
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
                <td >
                	<textarea placeholder="리뷰를 입력해주세요" class="u-border-1 u-border-grey-5 u-table-cell" id="review" name="review_content">
                	</textarea> 
                </td>
              </tr>
            </tbody>
          </table>
          
        </div>
        <input type="submit" data-page-id="95186816" class="u-border-none u-btn u-btn-round u-button-style u-custom-color-4 u-hover-palette-1-light-1 u-radius-6 u-btn-1">
      </form>
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