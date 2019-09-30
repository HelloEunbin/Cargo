<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>LOCATION - TEAM2 WAREHOUSE</title>
	<meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
	
	<!-- CSS/CDN links-->
	<link href="${contextPath }/css/board.css" rel="stylesheet">
</head>
<body>

<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>

	<section>
		<div class="container-fuild">
		<div class="row">
		
		
		<!--left Menu-->
		<jsp:include page="board_menu.jsp"></jsp:include>
			
		<div class="col-sm-10 mr-auto ml-auto" id="content">
        <div class="container my-5">
      	
      	<div class="row">
            <div class="col-md-7 col-sm-9 mx-auto text-center">
            	<h1 class="text-center mb-0">오시는 길</h1>
            	<span class="text-muted">Location</span>
        	</div>
        </div>
        
        <div class="rounded p-4 mt-5 bg-white raised-box" style="box-shadow: 1px 1px 40px #e8e8e8;">
        <div class="mx-auto">
	        <!-- -----------------------지도---------------------------- -->
	            <!-- <div id="map" style="width:500px;height:400px;"></div>
	            
	            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
	            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=307404c2f277ccff2e8934cf340a8986"></script>
	
	        <script type="text/javascript">
	          var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	          var options = { //지도를 생성할 때 필요한 기본 옵션
	             center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	             level: 3 //지도의 레벨(확대, 축소 정도)
	          };
	 
	          var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	          
	          
	        </script> -->
	        <!-- * 카카오맵 - 지도퍼가기 -->
	        <!-- 1. 지도 노드 -->
			<div id="daumRoughmapContainer1563237107174" class="root_daum_roughmap root_daum_roughmap_landing mx-auto my-5 col-lg-10 col-sm-12 "></div>
	               
	        <!-- 2. 설치 스크립트  * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다. -->
	        <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
	               
	        <!-- 3. 실행 스크립트 -->
	        <script charset="UTF-8">
	           new daum.roughmap.Lander({
	              "timestamp" : "1563237107174",
	              "key" : "ud7a",
	              "mapWidth" : "70%",
	              "mapHeight" : "460"
	           }).render();
	        </script>
	            
	        <div class="row p-4 mt-3">
            	<div class="col-md-4 col-sm-6 mb-5 text-center">
                	<div class="icon-box">
                    	<i class="fas fa-map-marker"  style="color: green;font-size: 1.8em;"></i> 
                	</div>
                    <h4 class="mt-2">주소</h4>
                    <span>부산광역시 부산진구 부전동 112-3번지<br> 삼한골든게이트 7층</span>
                </div>
                <div class="col-md-4 col-sm-6 mb-5 text-center">
                    <div class="icon-box">
                    	<i class="fas fa-phone"style="color: green;font-size: 1.8em;" ></i>
                    </div>
                    <h4 class="mt-2">전화번호</h4>
                    <span>051-803-0909</span>
                </div>
                <div class="col-md-4 col-sm-6 mb-5 text-center">
                     <div class="icon-box">
                     	<i class="fas fa-phone-alt"style="color: green;font-size: 1.8em;"></i>
                     </div>
                     <h4 class="mt-2">팩스</h4>
                     <span>051-803-0979</span>
                </div>   
                <div class="col-md-4 col-sm-6 mb-5 text-center">
                     <div class="icon-box">
                     	<i class="fas fa-subway"style="color: green;font-size: 1.8em;"></i>
                	 </div>
                     <h4 class="mt-2">지하철</h4>
                     <span>1,2호선 서면역 8번 출구 직진 180m<br>미니스탑에서 좌회전 70m<br>(쉐보레자동차 7층, 도보 4분)</span>
                </div>
                <div class="col-md-4 col-sm-6 mb-5 text-center">
                      <div class="icon-box">
                      	<i class="fas fa-bus"style="color: green;font-size: 1.8em;"></i>
                      </div>
                      <h4 class="mt-2">버스</h4>
                      <span>
                      	<b>서면 전포초등학교</b><br><small>10, 29, 43, 52, 80, 111, 5-1, 57, 99, 20, 부산진구11</small><br>
						<b>서면 NC백화점</b><br><small>24, 85, 138-1, 160, 남구10, 부산진구12</small><br>
						<b>부전도서관</b><br><small>20, 133, 169-1</small>
					  </span>
                </div>
                <div class="col-md-4 col-sm-6 mb-5 text-center">
                	<div class="icon-box">
                    	<i class="fas fa-parking"style="color: green;font-size: 1.8em;"></i>
                    </div>
                    <h4 class="mt-2">주차</h4>
                    <span>
                    	본 건물 내 주차는 유료주차이므로<br>별도로 주차권을 발행해드리지 않습니다.<br>
						건물 지하1층에 주차장 이용이 가능하십니다.<br>(주차요금 : 1,000원/30분)
					</span>
                </div>
            </div>
		</div>		
        </div>
        
      	</div>
		</div>
		</div>
		</div>
	</section>
	

        
<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>