<%@page import="java.net.URLDecoder"%>
<%@page import="Model.CafeImagesDTO"%>
<%@page import="Model.CafeImagesDAO"%>
<%@page import="Model.jjimDTO"%>
<%@page import="Model.CafeDAO"%>
<%@page import="Model.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.ReviewDAO"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="Model.CafeDTO"%>
<%@page import="Model.PicDTO"%>
<%@page import="Model.PicDTO" %>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="page_type" content="np-template-header-footer-from-plugin">
<title>Cafe Please!</title>
<link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="Cafe_Info.css" media="screen">
<script type="text/javascript" src="jquery-3.6.0.min.js"></script>
<script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
<!--<script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>  -->
<meta name="generator" content="Nicepage 3.30.2, nicepage.com">
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">



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
#cate {
	margin-bottom: 50px;
	margin-left: 250px;
}

#bar {
	margin-top: 50px;
}

#cafe_id {
	margin-left: 100px;
}

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

 .cafe_info{
	color: #401F00;

}

.u-section-1 .u-gallery-1{
	overflow: scroll;
} 
#th{
	background-color: #401F00;
	color: white;
	font-weight: 700px;
	
}
.u-table-entity td{
	text-align: center;
	border:0 !important;
}


/* tab */
[role='tab'] {
	background: #fff;
	color: black;
}

[role='tab'].active {
	/* ?????? ?????? */
	background: #a37a54;
	color: #fff;
}

/* panel */
[role='tabpanel'] {
	display: none;
}

[role='tabpanel'].active {
	/* ?????? ?????? */
	display: block;
}

.tabs>li{
	display: flex;
	justify-content:center;
	align-items:center;
	vertical-align:middle;
	height: 40px;
	font-weight: 100px;
}
#btn_group{
text-align:center;
}
</style>
</head>



<body class="u-body">
	<%CafeDTO inf = (CafeDTO) session.getAttribute("inf");%>

	<%-- <%PicDTO pic =(PicDTO) session.getAttribute("pic");  %> --%>
	<% ReviewDAO dao = new ReviewDAO(); 
	   ArrayList<ReviewDTO> r_list = dao.view_review(inf.getCafe_id());
	%>

	<%PicDTO pic =(PicDTO) session.getAttribute("pic");  %>

	<!-- ???? ???????? ???????? ???????? ???????? -->
	<% 
		CafeImagesDAO dao1 = new CafeImagesDAO();
		ArrayList<CafeImagesDTO> i_list1 = null;
			ArrayList<String> list_in = new ArrayList<>();
			ArrayList<String> list_out = new ArrayList<>();
			ArrayList<String> list_food = new ArrayList<>();
			ArrayList<String> list_menu = new ArrayList<>();
			ArrayList<String> list_all = new ArrayList<>();
	
		if(request.getParameter("search_cafe") != null){	
			String search_cafe = URLDecoder.decode(request.getParameter("search_cafe"), "euc-kr") ;
			System.out.println("?????? ???? : "+search_cafe);
			i_list1 = dao1.SearchOneCafe(search_cafe);
			
			for(int i=0; i<i_list1.size();i++){
				list_all.add(i_list1.get(i).getPic_path());
				if(i_list1.get(i).getPic_type() == 1){
					list_in.add(i_list1.get(i).getPic_path());
				}else if(i_list1.get(i).getPic_type() == 2){
					list_out.add(i_list1.get(i).getPic_path());
				}else if(i_list1.get(i).getPic_type() == 3){
					list_menu.add(i_list1.get(i).getPic_path());
				}else{
					list_food.add(i_list1.get(i).getPic_path());
				}
			}
			
			System.out.println(i_list1.size());
			System.out.println("?????? ????");
		}else{
			
			i_list1 = dao1.SearchOneCafe(inf.getCafe_name());
			System.out.println(i_list1.size());
			System.out.println("?? ???? ????");
		}
	%> 

<!-- ???????? ???????? ???? -->
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
              <b id="user_id"> <%=info.getM_nickname() %>?? ??????????</b> 
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
<!-- ???????? ???????? ?? -->
	<section class="u-clearfix u-section-1" id="sec-e3aa">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div class="u-clearfix u-expanded-width u-gutter-0 u-layout-spacing-top u-layout-wrap u-layout-wrap-1">
				<div class="u-layout">
					<div class="u-layout-row">
						<div
							class="u-align-left u-container-style u-layout-cell u-left-cell u-shape-rectangle u-size-60 u-white u-layout-cell-1"
							src="">
							<div class="u-container-layout u-container-layout-1">
								<div
									class="u-border-3 u-border-custom-color-2 u-expanded-width u-line u-line-horizontal u-line-1"></div>

								<!-- ??, ????????, ???? ???? -->
								<div id="bar">
									<a href="jjimServiceCon?m_id=<%= info.getM_id() %>&cafe_id=<%= inf.getCafe_id() %>" id="jjimO"
										class="u-border-none u-btn u-button-style u-none u-text-palette-1-base u-btn-1"><span
										class="u-icon u-icon-1"><svg class="u-svg-content"
												viewBox="0 0 496.158 496.158" x="0px" y="0px"
												style="width: 1em; height: 1em;">
												<path style="fill:currentColor;"
													d="M0,248.085C0,111.063,111.069,0.003,248.075,0.003c137.013,0,248.083,111.061,248.083,248.082  c0,137.002-111.07,248.07-248.083,248.07C111.069,496.155,0,385.087,0,248.085z"></path>
												<path style="fill:#FFFFFF;"
													d="M374.116,155.145c-34.799-34.8-91.223-34.8-126.022,0h-0.029c-34.801-34.8-91.224-34.8-126.023,0  c-34.801,34.8-29.783,86.842,0,126.022c31.541,41.491,89.129,109.944,126.023,109.944h0.029c36.895,0,94.481-68.453,126.022-109.944  C403.9,241.988,408.916,189.946,374.116,155.145z"></path></svg><img></span>&nbsp;
									</a>  
									
									<script type="text/javascript">
										
								        $("#jjimO").on("click", function(){
								        	alert("???????? ???? ??????????.");
								            }
								        );
										
									</script>
									
									<a href="map.jsp"
										class="u-active-none u-border-2 u-border-custom-color-4 u-btn u-btn-rectangle u-button-style u-custom-font u-heading-font u-hover-none u-none u-radius-0 u-btn-2">????</a>
									<h2 class="u-text u-text-custom-color-2 u-text-1"
										id="cafe_name"><%=inf.getCafe_name() %><span
											style="font-weight: 700;"></span>
									 </h2>
								</div>
		
								<!-- ???????? ?????? -->
								<div class="u-tab-links-align-justify u-tabs u-tabs-1">
									<ul class="u-tab-list u-unstyled tabs" role="tablist">
										<li class="u-tab-item" role="tab" id="link-tab-0410" aria-controls="tab-0410" aria-selected="true" tabindex="0"> ????????
										<!-- <a class="active u-active-white u-border-6 u-border-active-custom-color-4 u-border-custom-color-4 u-border-hover-grey-15 u-border-no-bottom u-border-no-left u-border-no-right u-button-style u-custom-color-4 u-hover-custom-color-6 u-tab-link u-tab-link-1"
											 href="#tab-0410" role="tab" aria-controls="tab-0410" aria-selected="true">????????</a> --></li>
											<li class="u-tab-item" role="tab" id="link-tab-c8f5" aria-controls="tab-c8f5" aria-selected="false" tabindex="0">????
											<!-- <a class="u-active-white u-border-6 u-border-active-custom-color-4 u-border-custom-color-4 u-border-hover-grey-15 u-border-no-bottom u-border-no-left u-border-no-right u-button-style u-custom-color-4 u-hover-custom-color-6 u-tab-link u-tab-link-3"
											 href="#tab-c8f5" 
											>????</a> -->
										</li>
									</ul>
									
									<!-- ???????????? -->
									<div class="u-tab-content">
										<div class="u-container-style u-tab-active u-tab-pane u-white u-tab-pane-1 tab_test active"
											id="tab-0410" role="tabpanel" aria-labelledby="link-tab-0410" aria-hidden="false">
											<div class="u-container-layout u-container-layout-2">
												<table class="cafe_info" >
													<tr>
														<td width="200px" align="letf">????</td>
														<td></td>
														<td width="400px" align="left"><%=inf.getCafe_addr() %></td>
														<td rowspan="8" width="300px"> <img src=<%=pic.getPic_path() %> width="300px;"> </td>
													</tr>
													<tr>
														<td><br></td>
													</tr>
													<tr>
														<td align="letf">????????</td>
														<td></td>
														<td align="left"><%=inf.getCafe_pohne() %></td>

													</tr>
													<tr>
														<td><br></td>
													</tr>
													<tr>
														<td align="letf">????????</td>
														<td width="126px"></td>
														<td align="left"><%=inf.getCafe_running_time() %></td>

													</tr>
													<tr>
														<td><br></td>
													</tr>
													<tr>
														<td align="letf">????????</td>
														<td width="100px"></td>
														<td align="left"><%=inf.getCafe_info() %></td>

													</tr>
													<tr>
														<td><br></td>
													</tr>
													<tr>
														<td align="letf">????</td>
														<td align="left"></td>
														<td>
														<%= inf.getCafe_menu() %>
														</td>
													<%-- 	<td><br><%
															String[] menus = inf.getCafe_menu().split(", ");
														
															for(String menu : menus){
																out.print(menu.substring(0, menu.length()-6)+" - ");
																out.print(menu.substring(menu.length()-6)+"");
															}
														%></td> --%>
													</tr>


												</table>
												<div>
											</div>
											<div
												class="u-align-left u-container-style u-tab-pane u-white u-tab-pane-2"
												id="tab-8453" role="tabpanel"
												aria-labelledby="link-tab-8453">
												<div
													class="u-container-layout u-valign-top u-container-layout-3">
													<p class="u-text u-text-2">
														
													</p>
													<p class="u-text u-text-3">
														
												</p>
												</div>
											</div>
											</div>
												</div>
											<!-- ???? ????   -->
											<div class="u-container-style u-tab-pane u-white u-tab-pane-3 tab_test" id="tab-c8f5" role="tabpanel" aria-labelledby="link-tab-c8f5">
												<div class="u-container-layout u-container-layout-4" aria-hidden="true">
													<a href="review.jsp" data-page-id="66156236"
														class="u-active-none u-border-2 u-border-active-palette-2-dark-1 u-border-custom-color-2 u-border-hover-palette-2-base u-btn u-button-style u-hover-none u-none u-text-custom-color-2 u-text-hover-palette-2-base u-btn-3">????
														?????? ???? !</a>
														
														<!-- ???? ?????? -->
													<div class="u-align-center u-table u-table-responsive u-table-1">
														<table class="u-table-entity">
															<colgroup>
																<col width="5.1%">
																<col width="65.9%">
																<col width="20.4%">
																<col width="8.5%">
															</colgroup>
															<tbody class="u-table-body">
																<tr style="height: 46px;" id="th">
																	<td class="u-border-1 u-border-grey-dark-1 u-table-cell">????</td>
																	<td class="u-border-1 u-border-grey-dark-1 u-table-cell">????</td>
																	<td class="u-border-1 u-border-grey-dark-1 u-table-cell">??????</td>
																	<td class="u-border-1 u-border-grey-dark-1 u-table-cell">????</td>
																</tr>
																<% for(int i=0; i<r_list.size(); i++){ %>
																
																<tr style="height: 46px;">
																	<td class="u-border-1 u-border-grey-dark-1 u-table-cell"><%= i+1 %></td>
																	<td class="u-border-1 u-border-grey-dark-1 u-table-cell"><%=r_list.get(i).getReview_content()  %></td>
																	<td class="u-border-1 u-border-grey-dark-1 u-table-cell"><%=r_list.get(i).getM_id() %></td>
																	<td class="u-border-1 u-border-grey-dark-1 u-table-cell"><%=r_list.get(i).getCafe_ratings() %></td>
																</tr>
																<%} %>
															</tbody>
														</table>
													</div>
												</div>
											</div>
									
									
									
	
										<!-- ???? ???? (????,????,????...) -->
											
											<div id="btn_group">
											<button  class="u-border-1 u-border-custom-color-2  u-btn-round u-button-style u-hover-black u-none u-radius-50 u-text-black u-text-hover-white u-btn-8 current" id = "allbtn">All Photo</button>
												
											<button  class="current u-border-1 u-border-custom-color-2 u-btn-round u-button-style u-hover-black u-none u-radius-50 u-text-black u-text-hover-white u-btn-4" id = "outbtn">out side</button>
												
											<button  class="current u-border-1 u-border-custom-color-2  u-btn-round u-button-style u-hover-black u-none u-radius-50 u-text-black u-text-hover-white u-btn-7" id = "inbtn" >inside</button>
												
											<button  class="current u-border-1 u-border-custom-color-2  u-btn-round u-button-style u-hover-black u-none u-radius-50 u-text-black u-text-hover-white u-btn-6" id = "photozone" >food</button>
												</div>
										<script>
										 
										var clicked_btn = 'All photo';
										 
										 $(document).ready(function(){
											 $(".current").on("click", function(){
												 clicked_btn = $(this).text();
												 console.log(clicked_btn);
												 if(clicked_btn =='All Photo'){
												 	$('.img_div').remove();
													 console.log(<%= list_all.size()%>);
													 <%for(int i = 0; i< list_all.size(); i++){ %>
													 	$('.img_list').prepend('<div class="u-effect-fade u-gallery-item u-gallery-item-1 img_div"> <div class="u-back-slide" data-image-width="828" data-image-height="812"><img class="u-back-image u-expanded remove_img" id="img<%=i%>"> </div> <div class="u-align-center u-over-slide u-shading u-over-slide-1"> <h3 class="u-gallery-heading"></h3><p class="u-gallery-text"></p></div></div>');
													 	$('#img<%=i%>').attr('src', '<%= list_all.get(i)%>');
													 <%} %>
													 
												 }else if(clicked_btn == 'out side'){
													 $('.img_div').remove();
													 console.log(<%= list_out.size()%>);
													 <%for(int i = 0; i< list_out.size(); i++){ %>
													 	$('.img_list').prepend('<div class="u-effect-fade u-gallery-item u-gallery-item-1 img_div"> <div class="u-back-slide" data-image-width="828" data-image-height="812"><img class="u-back-image u-expanded remove_img" id="img<%=i%>"> </div> <div class="u-align-center u-over-slide u-shading u-over-slide-1"> <h3 class="u-gallery-heading"></h3><p class="u-gallery-text"></p></div></div>');
													 	$('#img<%=i%>').attr('src', '<%= list_out.get(i)%>');
													 <%} %>
												 }
												 else if(clicked_btn == 'inside'){
													 $('.img_div').remove();
													 console.log(<%= list_in.size()%>);
													 <%for(int i = 0; i< list_in.size(); i++){ %>
													 	$('.img_list').prepend('<div class="u-effect-fade u-gallery-item u-gallery-item-1 img_div"> <div class="u-back-slide" data-image-width="828" data-image-height="812"><img class="u-back-image u-expanded remove_img" id="img<%=i%>"> </div> <div class="u-align-center u-over-slide u-shading u-over-slide-1"> <h3 class="u-gallery-heading"></h3><p class="u-gallery-text"></p></div></div>');
													 	$('#img<%=i%>').attr('src', '<%= list_in.get(i)%>');
													 <%} %>
												 }
												 else if(clicked_btn == 'food'){
													 $('.img_div').remove();
													 console.log(<%= list_food.size()%>);
													 <%for(int i = 0; i< list_food.size(); i++){ %>
													 	$('.img_list').prepend('<div class="u-effect-fade u-gallery-item u-gallery-item-1 img_div"> <div class="u-back-slide" data-image-width="828" data-image-height="812"><img class="u-back-image u-expanded remove_img" id="img<%=i%>"> </div> <div class="u-align-center u-over-slide u-shading u-over-slide-1"> <h3 class="u-gallery-heading"></h3><p class="u-gallery-text"></p></div></div>');
													 	$('#img<%=i%>').attr('src', '<%= list_food.get(i)%>');
													 <%} %>
												 }
											 })
										 })
										 
										
										 
										</script>
										<!--  ???????? ?? -->


									<!-- ?????????? ?????? -->
									<div class="u-gallery u-layout-grid u-lightbox u-show-text-on-hover u-gallery-1" id="carousel-6bb4">

										<div class="u-gallery-inner u-gallery-inner-1 img_list" role="listbox">
										
										<% for(int i = 0; i<i_list1.size(); i++){ %>
											<div class="u-effect-fade u-gallery-item u-gallery-item-1 img_div">
												<div class="u-back-slide" data-image-width="828"
													data-image-height="812">
													<img class="u-back-image u-expanded remove_img" id="img_<%= i %>"	src="<%= i_list1.get(i).getPic_path() %>">
												</div>
												<div
													class="u-align-center u-over-slide u-shading u-over-slide-1">
													<h3 class="u-gallery-heading"></h3>
													<p class="u-gallery-text"></p>
												</div>
											</div>
											  <%} %>
											
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
	</section>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">

		function eventHandler(e) {
			var $eTarget = $(e.currentTarget);
			console.log($eTarget)
			var $targetPanel = $('[aria-labelledby="' + $eTarget.attr('id')+ '"]');
			console.log($targetPanel)

			// ?????????? ?????? ????
			if (e.type === 'click') { // ???? ?? ????
				$eTarget.attr('aria-selected', true).addClass('active')
						.siblings('[role="tab"]').attr('aria-selected', false)
						.removeClass('active');

				$targetPanel.attr('aria-hidden', false).addClass('active')
						.siblings('[role="tabpanel"]')
						.attr('aria-hidden', true).removeClass('active');
			} else if (e.type === 'keydown' && e.which === 13) { // ???? ?????? ?? && ???? ?????? ??
				// e.which ?? keycode ???? ?????????? 13 ?? ???? ???? ???????? keycode
				$(this).click(); // ???? Element?? ?????????? ????????
			}
		}

		// ???????? keydown ?????? ???? - ???? ????
		$('[role="tab"]').on('click keydown', eventHandler);
	</script>


	<footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer"
		id="sec-fd77">
		<div class="u-clearfix u-sheet u-sheet-1">
			<p class="u-small-text u-text u-text-variant u-text-1">
				Queen Bee Project cafe please&nbsp;<br>our team member is
				worker that KMJ, LMS, PHG, LMS<br>and last queen bee, KHJ<br>Thank
				you
			</p>
		</div>
	</footer>
	<section class="u-backlink u-clearfix u-grey-80">
		<a class="u-link" href="https://nicepage.com/website-templates"
			target="_blank"> <span>Website Templates</span>
		</a>
		<p class="u-text">
			<span>created with</span>
		</p>
		<a class="u-link" href="" target="_blank"> <span>Website
				Builder Software</span>
		</a>.
	</section>
</body>
</html>
