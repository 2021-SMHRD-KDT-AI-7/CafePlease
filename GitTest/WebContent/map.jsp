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

<!-- 1. �⺻ jsp������ �ϳ� ���� ��Ʈ��ȣ�� Ȯ���Ѵ�!
	 2. īī��developer ����Ʈ�� �� �������� �����ؼ� ������ �޴´�. >> api ����Ű�� �޴´�.
	 3. � �ɷ� ���񽺸� �������� ���ø����̼��� ���� �� �����Ѵ�.
	 4. ���ϴ� ����� ã�Ƽ� �ٿ��ֱ�! ���ش�.
	 5. �ڵ忡 ���� ������ ���� �ڿ� ���ϴ� �κ��� �����ؼ� ���ϴ� ����� ����� �ش�! -->

<body>

<div id="map" style="width:100%;height:100%;"></div>
<div id="clickLatlng"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a2d0ec402889e9beb2e6f23071881448"></script>
<script>

/* // īī�� ���� ��ũ��Ʈ�� �߽���ǥ ��ġ(����, �浵)���� �����Ѵ�.
var container = document.getElementById('map'); //������ ���� ������ DOM ���۷���
var options = { //������ ������ �� �ʿ��� �⺻ �ɼ�
    center: new kakao.maps.LatLng(35.144437, 126.840318), //������ �߽���ǥ.
    level: 3 //������ ����(Ȯ��, ��� ����)
};
var map = new kakao.maps.Map(container, options); //���� ���� �� ��ü ����

// �߽���ǥ ��ġ�� ��Ŀ ǥ���ϱ�
// ������ �˾Ƴ� ����/�浵 ���� �����ϴ� ������ �����Ѵ�.
var markerPosition  = new kakao.maps.LatLng(35.144437, 126.840318);

// �ش� ������ �̿��� īī���ʿ� ��ġ(��Ŀ)����
var marker = new kakao.maps.Marker({
	position: markerPosition
});

// ��Ŀ�� ���� ���� ǥ�õǵ��� �� ���� �ۼ��� ���� ���� �� ��ü ���� ������ �������ݴϴ�
marker.setMap(map); */

var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
mapOption = { 
    center: new kakao.maps.LatLng(35.144437, 126.840318), // ������ �߽���ǥ
    level: 1 // ������ Ȯ�� ����
};

var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

var imageSrc = './img/g1.gif', // ��Ŀ�̹����� �ּ��Դϴ�    
imageSize = new kakao.maps.Size(80, 85), // ��Ŀ�̹����� ũ���Դϴ�
imageOption = {offset: new kakao.maps.Point(100, 100)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
  
//��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
markerPosition = new kakao.maps.LatLng(35.144437, 126.840318); // ��Ŀ�� ǥ�õ� ��ġ�Դϴ�

//��Ŀ�� �����մϴ�
var marker = new kakao.maps.Marker({
position: markerPosition, 
image: markerImage // ��Ŀ�̹��� ���� 
});

//��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
marker.setMap(map); 

//���������쿡 ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�
var iwContent = '<div style="padding:5px;"> <a href="https://map.kakao.com/link/map/Hello World!,35.144437, 126.840318" style="color:black" target="_blank">ī���̸� �� ��</a> </div>',
iwPosition = new kakao.maps.LatLng(35.144437, 126.840318); //���������� ǥ�� ��ġ�Դϴ�

//���������츦 �����մϴ�
var infowindow = new kakao.maps.InfoWindow({
	position : iwPosition, 
	content : iwContent 
});

//��Ŀ ���� ���������츦 ǥ���մϴ�. �ι�° �Ķ������ marker�� �־����� ������ ���� ���� ǥ�õ˴ϴ�
infowindow.open(map, marker);

</script>

</body>
</html>