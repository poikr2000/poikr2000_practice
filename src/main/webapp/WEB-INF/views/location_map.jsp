<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>네이버 지도를 달아보자 v3 버전 : 네이버맵 v2 와 v3 동시 비교</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<content tag="local_script">

<!-- 예제 시작 -->

<!-- http://localhost 에서 테스트 하시려면 cpw9RMOfkmb0qIa7Vz23 키를 사용해 보세요 -->

<!-- 맵 v3 스크립트 -->
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=cpw9RMOfkmb0qIa7Vz23"></script>

<style type="text/css">

    #mapArea{
       border:1px solid #ddd;display:block;
       width:60%;
       height:300px;
       clear:both;
    }

</style>

<div class="map_wrap" align="center">
   <div id="mapArea" class="map_div"></div>
   <div class="map_tit">map v3</div>
</div>

<script type="text/javascript">

   // v3 버전 지도 생성
   
   var position = new naver.maps.LatLng(36.33853, 127.39245);
//    var position = new naver.maps.LatLng(36.40936, 127.19897);
   var map = new naver.maps.Map('mapArea', {
      center : position,
      zoom:12,
      mapTypeControl : true
   });
   
   var markerOptions = {
         position: position,
         map:map,
         icon:{
            url:'resources/images/itschool.swf',
            size: new naver.maps.Size(33,44),
            origin: new naver.maps.Point(0,0),
            anchor: new naver.maps.Point(11,35)
         }
   };
   var marker = new naver.maps.Marker(markerOptions);
</script>
</content>
<!-- 예제 종료 -->
<body>
<div class="container">
   <div style="text-align:center; margin:0 0 100px 0; background:#555; line-height:80px;">
      <a style="color:#fff; font-weight:bold; font-family:tahoma; font-size:20pt;" href="http://ktsmemo.cafe24.com/s/naver_map_v3/128" target="_blank"></a>
   </div>
</div>
</body>
</html>