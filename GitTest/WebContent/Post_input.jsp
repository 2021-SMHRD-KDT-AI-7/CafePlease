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
    <title>Post_input</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="Post_input.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
   <!--<script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>  --> 
    <meta name="generator" content="Nicepage 3.30.2, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "Cafe_Please",
		"logo": "images/_.png"
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Post_input">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
    
    <style type="text/css">
    	.row{
    		margin-bottom: 10px;
    	}
    	
    	.col-md-auto{
    		margin-left: 10px;
    	}
    	
    	*{margin: 0px; padding: 0px;}
		
		#user_icon{
		    position: relative;
		/*     top: 10px; */
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
		.post_input_icon{
			background-color: #A37A54;
			border-color: #A37A54;
		}
    </style>
    
  </head>
  <body class="u-body">
   <!-- 새로만든 헤더부분 시작 -->
<div style="height: 85px;">
    <header style="margin-top: 20px;">
        
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

    <section class="u-clearfix u-section-1" id="sec-1aeb">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h4 class="u-text u-text-custom-color-2 u-text-1">
          <span style="font-weight: 700;">게시물 작성</span>
          <span style="font-weight: 700;">
            <span style="font-weight: 400;"></span>
          </span>
        </h4><span class="u-icon u-icon-circle u-text-custom-color-4 u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 510 510" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-7224"></use></svg><svg class="u-svg-content" viewBox="0 0 510 510" id="svg-7224"><g><path d="m345 30v30h-180v-30h-90v480h360v-480zm-130.019 117.305 17.929 26.894 66.27-44.18 16.641 24.962-91.23 60.82-34.571-51.856zm145.019 287.695h-210v-30h210zm0-60h-210v-30h210zm0-60h-210v-30h210z"></path><path d="m165 0h180v30h-180z"></path>
</g></svg></span>
        <h5 class="u-text u-text-custom-color-2 u-text-2">원하는 내용을 자유롭게 적어주세요 : )</h5>
        <div class="u-expanded-width u-form u-form-1">
          
          <!-- form 시작 -->
          <form action="Post_inputServiceCon" method="POST" class="u-clearfix u-form-spacing-17 u-form-vertical u-inner-form" source="custom" name="form" style="padding: 10px;" enctype="multipart/form-data">

            <!-- 제목 -->
            <div class="u-form-group u-form-name">
              <label for="name-4c01" class="u-form-control-hidden u-label"></label>
              <input type="text" placeholder="제목" id="name-4c01" name="title" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
            </div>
            
            <!-- 작성자 -->
            <div class="u-form-group">
              <label for="email-4c01" class="u-form-control-hidden u-label"></label>
              <input type="text" placeholder="작성자" id="email-4c01" name="writer" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="required">
            </div>
           
            <!-- 파일 선택 -->
            <div class="container px-4 d-grid gap-2 d-md-flex justify-content-md-end">
  				<div class="row gx-5">
		            <!-- <a>최대 3개까지 업로드가 가능합니다.</a> <br> -->
		            <!-- <input multiple="multiple" name="fileName[]" type="file" id="email-4c01"  style="float: right;"> -->
		            <input class="upfile" name="fileName1" type="file" style="float: right;"> <br>
		            <input class="upfile" name="fileName2" type="file" style="float: right;"> <br>
		            <input class="upfile" name="fileName3" type="file" style="float: right;">
            </div>
	    </div>
           
           <!-- 내용 -->
            <div class="u-form-group u-form-message">
              <label for="message-4c01" class="u-form-control-hidden u-label"></label>
              <textarea rows="10" cols="50" id="message-4c01" name="content" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required=""></textarea>
            </div>
            
            <!-- 초기화, 작성완료 -->
            <div class="container px-4 d-grid gap-2 d-md-flex justify-content-md-end">
  				<div class="row gx-5">
	              <!-- <input type="reset" value="초기화"> -->
	              <input class="btn btn-secondary btn-lg col-md-auto post_input_icon" type="reset" value="초기화" >
	              <input class="btn btn-secondary btn-lg col-md-auto post_input_icon" type="submit" value="작성완료">
	              <!-- <input type="submit" value="작성완료"> <hr> -->
	            </div>
	         </div>
        </form>
        <!-- form끝 -->
        
        </div>
      </div>
    </section>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-fd77"><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1">Queen Bee Project cafe please&nbsp;<br>our team member is worker that KMJ, LMS, PHG, LMS<br>and last queen bee, KHJ<br>Thank you
        </p>
      </div></footer>
  </body>
</html>