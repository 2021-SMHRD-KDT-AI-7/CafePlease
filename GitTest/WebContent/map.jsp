<%@page import="Model.CafeDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
	html, body{
		margin:0px;
		height: 100%;
	}
</style>

</head>

<!-- 1. 기본 jsp파일을 하나 만들어서 포트번호를 확인한다!
	 2. 카카오developer 사이트에 내 계정으로 접속해서 인증을 받는다. >> api 인증키를 받는다.
	 3. 어떤 걸로 서비스를 구현할지 애플리케이션을 생성 후 수정한다.
	 4. 원하는 기능을 찾아서 붙여넣기! 해준다.
	 5. 코드에 대한 설명을 읽은 뒤에 원하는 부분을 수정해서 원하는 기능을 만들어 준다! -->

<body>
<% CafeDTO inf = (CafeDTO) session.getAttribute("inf"); %>

<div id="map" style="width:100%;height:100%;"></div>
<div id="clickLatlng"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a2d0ec402889e9beb2e6f23071881448"></script>
<script>

/* // 카카오 지도 스크립트의 중심좌표 위치(위도, 경도)값을 수정한다.
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
    center: new kakao.maps.LatLng(35.144437, 126.840318), //지도의 중심좌표.
    level: 3 //지도의 레벨(확대, 축소 정도)
};
var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

// 중심좌표 위치에 마커 표시하기
// 위에서 알아낸 위도/경도 값을 저장하는 변수를 생성한다.
var markerPosition  = new kakao.maps.LatLng(35.144437, 126.840318);

// 해당 변수를 이용해 카카오맵에 위치(마커)설정
var marker = new kakao.maps.Marker({
	position: markerPosition
});

// 마커가 지도 위에 표시되도록 위 에서 작성한 지도 생성 및 객체 리턴 변수를 연결해줍니다
marker.setMap(map); */

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(35.151916545424335, 126.92437550000001), // 지도의 중심좌표
    level: 1 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = './img/g1.gif', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(80, 85), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(10, 10)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
markerPosition = new kakao.maps.LatLng(35.151916545424335, 126.92437550000001); // 마커가 표시될 위치입니다

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition, 
image: markerImage // 마커이미지 설정 
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map); 

<%-- var iwContent = '<div style="padding:5px;">'<%= inf.getCafe_id() %>'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(33.450701, 126.570667), //인포윈도우 표시 위치입니다
iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

//인포윈도우를 생성하고 지도에 표시합니다
var infowindow = new kakao.maps.InfoWindow({
map: map, // 인포윈도우가 표시될 지도
position : iwPosition, 
content : iwContent,
removable : iwRemoveable
}); --%>

</script>

</body>
</html>