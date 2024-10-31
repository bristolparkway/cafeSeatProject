<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<title>Astral by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/cafe/assets/css/main.css" />
		<link rel="stylesheet" href="/cafe/assets/css/menuoptions.css" />
		<noscript><link rel="stylesheet" href="/cafe/assets/css/noscript.css" /></noscript>
	</head>
	<style>
		
	</style>
	<body class="is-preload">

		<!-- Wrapper-->
			<div id="wrapper">

				<!-- Nav -->
				<!-- Nav -->
					<nav id="nav">
						<a href="#" class="icon solid fa-map"><span>Map</span></a>
						<a href="#cafeseat" class="icon solid fa-mug-hot"><span>CafeSeat</span></a>
						<a href="#mypage" class="icon solid fa-heart"><span>MyPage</span></a>
						<a href="#login" class="icon solid fa-user"><span>Login</span></a>
					</nav>

				<!-- Main -->
					<div id="main">

						<!-- Me -->
							<article id="home" class="panel intro">

							</article>

						<!-- options -->
							<article id="cafeseat" class="panel">
								<h2>${dto.name}</h2>
								<p>${dto.description}</p>
								<div id="optionImg">
									<c:if test="${dto.seqCategory != '3'}">
									<img src="/cafe/assets/pic/menuImages/drink/${dto.image}" alt="">
									</c:if>
									<c:if test="${dto.seqCategory == '3'}">
									<img src="/cafe/assets/pic/menuImages/dessert/${dto.image}" alt="">
									</c:if>
								</div>
								<input type="hidden" name="seq" value="${dto.seq}">
								
								<form method="POST" action="/cafe/menulist.do#work">
								<div id="option">
									<div class="optionName">1. 온도(ICE or HOT)</div>
										<div class="radio_temperature">
											<input id="temper_ice" type="radio" class="temperature" name="temperature" value="1">
											<label for="temper_ice">ICE</label>
										</div>
										
										<div class="radio_temperature">
											<input id="temper_hot" type="radio" class="temperature" name="temperature" value="2">
											<label for="temper_hot">HOT</label>
										</div>
										
									<div class="optionName">2. 사이즈(Size)</div>
										<div class="radio_cupsize">
											<input id="size_regular" type="radio" class="size" name="size" value="0">
											<label for="size_regular">기본(R)</label>
										</div>
										<div class="radio_cupsize">
											<input id="size_large" type="radio" class="size" name="size" value="1">
											<label for="size_large">라지(L)</label>
										</div>
										<div class="radio_cupsize">
											<input id="size_max" type="radio" class="size" name="size" value="2">
											<label for="size_max">맥스(M)</label>
										</div>
										
									<div class="optionName">3. 얼음 양(Ice Amount)</div>
										<div class="radio_iceamount">
											<input id="icefew" type="radio" class="iceamount" name="iceamount" value="0">
											<label for="icefew">얼음 적게</label>
										</div>
										<div class="radio_iceamount">
											<input id="icebasic" type="radio" class="iceamount" name="iceamount" value="1">
											<label for="icebasic">기본</label>
										</div>
										<div class="radio_iceamount">
											<input id="icelots" type="radio" class="iceamount" name="iceamount" value="2">
											<label for="icelots">얼음 많이</label>
										</div>
										
									<div class="optionName">4. 샷 추가(Shot)</div>
										<div class="radio_shotadd">
											<input id="noshot" type="radio" class="shotadd" name="shotadd" value="1">
											<label for="noshot">기본</label>
										</div>
										
										<div class="radio_shotadd">
											<input id="shot" type="radio" class="shotadd" name="shotadd" value="2">
											<label for="shot">샷 추가</label>
										</div>
										
								</div>
								<div id="select">

									<input type="number" name="totalCount" id="totalCount" min="1" max="10" placeholder="수량">
									<button type="button" class="options">선택</button>
									<button type="button" class="back" onclick="location.href='/cafe/menu/menulist.do#cafeseat';">취소</button>
								</div>
								</form>												
							</article>
						<article id="mypage" class="'panel">
						</article>

						<!-- Contact -->
							<article id="login" class="panel">

							</article>

					</div>

				<!-- Footer -->
					<div id="footer">
						<ul class="copyright">
							<li>&copy; Untitled.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
						</ul>
					</div>

			</div>

		<!-- Scripts -->
			<script src="/cafe/assets/js/jquery.min.js"></script>
			<script src="/cafe/assets/js/browser.min.js"></script>
			<script src="/cafe/assets/js/breakpoints.min.js"></script>
			<script src="/cafe/assets/js/util.js"></script>
			<script src="/cafe/assets/js/main.js"></script>

			<script>
			
				document.querySelector('.options').addEventListener('click', function() {
				    
					const temperature = document.querySelector('input[name="temperature"]:checked').value;
				    const size = document.querySelector('input[name="size"]:checked').value;
				    const iceamount = document.querySelector('input[name="iceamount"]:checked').value;
				    const shotadd = document.querySelector('input[name="shotadd"]:checked').value;
				    
				    const totalCount = document.getElementById('totalCount').value || 1; // 기본값을 1로 설정
				    
				    if (!temperature) {
				        alert('온도를 선택해 주세요.');
				        return; // 온도를 선택하지 않았으면 종료
				    }

				    if (!size) {
				        alert('사이즈를 선택해 주세요.');
				        return; // 사이즈를 선택하지 않았으면 종료
				    }
				    

				    if (!iceamount) {
				        alert('얼음 양을 선택해 주세요.');
				        return; // 얼음 양을 선택하지 않았으면 종료
				    }
				    

				    if (!shotadd) {
				        alert('샷추가 여부를 선택해 주세요.');
				        return; // 샷 추가를 선택하지 않았으면 종료
				    }
				    
				    url = `/cafe/menu/menulist.do?seq=${dto.seq}&temperature=\${temperature}&size=\${size}&iceamount=\${iceamount}&totalCount=\${totalCount}#cafeseat`;
				    
				    // 이동
				    location.href = url;
	
				});
				
				const temperature = $('input:radio[name="temperature"]:checked').val();
			    const size = $('input:radio[name="size"]:checked').val();
			    const iceamount = $('input:radio[name="iceamount"]:checked').val();
			    const shotadd = $('input:radio[name="shotadd"]:checked').val();
			    
			    const totalCount = document.getElementById('totalCount').value || 1; // 기본값을 1로 설정
			    

			
			</script>

	</body>
</html>