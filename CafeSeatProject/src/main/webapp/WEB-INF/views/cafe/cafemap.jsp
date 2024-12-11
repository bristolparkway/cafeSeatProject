<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>CafeSeat</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="../assets/css/main.css" />
	<link rel="stylesheet" href="../assets/css/map.css" />
	<noscript><link rel="stylesheet" href="../assets/css/noscript.css" /></noscript>
	<script src="https://kit.fontawesome.com/1ddf83a78d.js" crossorigin="anonymous"></script>
</head>
<style>
	@import url("/cafe/assets/css/paperlogy_font.css");
	
	body {
		font-family: 'Paperlogy-8ExtraBold';
	}
</style>
<body class="is-preload">

<%@ include file="/WEB-INF/views/inc/header.jsp" %>

	<!-- Wrapper-->
	<div id="wrapper">
	
		<!-- Nav -->
		<%@ include file="/WEB-INF/views/inc/nav.jsp" %>

		<!-- Main -->
		<div id="main">

			<!-- Me -->
			<article id="home" class="panel intro">
				<div class="map_wrap">
					<div id="map"></div>

					<div id="menu_wrap" class="bg_white">
						<div class="option">
							<div>

								<form onsubmit="searchPlaces(); return false;">
									<div id="search-box">
										<input type="text" value="역삼역" id="keyword" size="15">
										<button type="submit" id="search-btn">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</form>

							</div>
						</div>
						<hr>
						<ul id="placesList">
							<c:forEach items="${list}" var="dto">
								<li class=item><span class="markerbg marker_${dto.cseq}"></span>
									<div class="info">

										<div class="info-title">
											<h5>${dto.name}</h5>
											<form method="POST" action="/cafe/cafe/cafemap.do">
												<input type="hidden" id="cseq" name="cseq"
													value="${dto.cseq}"> <input type="submit"
													class="btntitle" value="예약">
											</form>
										</div>


										<%--
										기존에 카페 선택 페이지에서 좌석 선택 페이지로 갈 때 
										GET방식으로 카페 번호를 query string에 입력해서 보내 줬는데,
										이걸 세션으로 넘겨주는 방식으로 수정. 이에 맞게 예약 버튼을 누르면
										본인 페이지로 한 번 더 카페 정보를 가지고 서블릿으로 이동하고
										서블릿은 해당 정보를 세션에 입력하고 알맞은 카페로 이동 시켜줌
 										<div class="info-title">
											<h5>${dto.name}</h5>
											<input type="submit" id="btntitle${dto.cseq}"
												class="btntitle" value="예약" data-value="${dto.cseq}">
										</div> 
										
--%>
										<span>${dto.address}</span> <span class="jibun gray">${dto.lotAddress}</span>
										<span class="tel">${dto.tel}</span>
									</div></li>

							</c:forEach>
						</ul>
						<div id="pagination"></div>
					</div>
				</div>


			</article>

			<!-- CafeSeat -->
			<article id="cafeseat" class="panel"></article>

			<!-- Mypage -->
			<article id="mypage" class="panel"></article>


			<!-- Login -->
			<article id="login" class="panel"></article>
		</div>


		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

	</div>

	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/browser.min.js"></script>
	<script src="../assets/js/breakpoints.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
	<script type="text/javascript"
		src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=ef00a9579c4de664a8dcf691494c9b70&libraries=services"></script>
	<!-- <script src="../assets/js/cafe/map.js"></script> -->

	<script>

	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(37.499312, 127.033228), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	/* // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 }); */
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "../images/location-pointer.png"; 
	// 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(36, 36); 
 	// 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	
 	
 	
	//지도에 마커표시--------------------------------------
	<c:forEach items="${list}" var="dto" varStatus="status">
				//${status.count} 숫자 세주는 코드!
		const m${status.count} = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(${dto.lat},${dto.lng}),
			image : markerImage // 마커 이미지 
				});
		m${status.count}.setMap(map);
	</c:forEach>
	
	
	
	//예약버튼 보기btntitle
	
/* 	
	for (let i = 0; i <= 108; i++) {
	
		$(document).on('click', '#btntitle' + i, function() {
			//alert($('#btntitle' + i).data('value'));
			location.href="/cafe/seat/selectseat.do?cafe="+$('#btntitle' + i).data('value')+"#cafeseat";
		});
	} 
*/
	
	
	</script>

</body>
</html>