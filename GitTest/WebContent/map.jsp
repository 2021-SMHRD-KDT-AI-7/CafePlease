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
	
//��Ŀ�� Ŭ���ϸ� ��Ҹ��� ǥ���� ���������� �Դϴ�
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// ��� �˻� ��ü�� �����մϴ�
var ps = new kakao.maps.services.Places(); 

// Ű����� ��Ҹ� �˻��մϴ�
ps.keywordSearch('���¿� ����', placesSearchCB); 

// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
        map.setBounds(bounds);
    } 
}

// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function displayMarker(place) {
    
    // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
    kakao.maps.event.addListener(marker, 'click', function() {
        // ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
	
</script>

</body>
</html>