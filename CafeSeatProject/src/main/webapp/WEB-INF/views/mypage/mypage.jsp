<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Astral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="../assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="../assets/css/noscript.css" />
</noscript>
</head>
<style>
@import url("/CafeSeatProject/src/main/webapp/assets/css/paperlogy_font.css");
#mypage h1 {
	border: 5px solid #AF8F6F;
	background-color: #AF8F6F;
	padding: 25px;
	margin-bottom: 40px;
	margin-left: 80px;
	margin-right: 80px;
	margin-top: 0;
	text-align: center;
	color: #F8F4E1;
	border-radius: 20px;
	font-family: 'Paperlogy-6SemiBold';
}

#mypage div {
	padding: 0;
	justify-content: center;
	text-align: center;
	font-family: 'Paperlogy-5Medium';
}

#mypage div input {
	margin: 0 50px 50px 50px;
	border: 3px solid #AF8F6F;
	background-color: #AF8F6F;
	color: #F8F4E1;
}

#mypage div input:hover {
	border: 3px solid #AF8F6F;
	background-color: #F8F4E1;
	color: #AF8F6F;
}

#fevorite-box {
	border: 3px solid #543310;
	padding: 40px;
	border-radius: 20px;
	margin-left: 80px;
	margin-right: 80px;
	width: auto;
	height: 620px;
	background-color: #74512D;
}

#mypage div .fevorite-info {
	border: 5px solid #74512D;
	margin: 30px;
	border-radius: 20px;
	background-color: white;
	font-family: 'Paperlogy-5Medium';
}

#mypage div .fevorite-info:hover {
	border: 5px solid##74512D;
	margin: 30px;
	border-radius: 20px;
	background-color: #F8F4E1;
}

#mypage .fevorite-info span:nth-child(1) {
	display: block;
	text-align: left;
	padding-left: 30px;
	margin-top: 40px;
	font-size: larger;
	color: #543310;
}

#mypage .fevorite-info span:nth-child(2) {
	display: block;
	text-align: right;
	padding-right: 30px;
	margin-bottom: 20px;
	color: #AF8F6F;
}
</style>
<body class="is-preload">

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Nav -->
		<nav id="nav">
			<a href="/cafe/cafe/cafemap.do#" class="icon solid fa-map"><span>Map</span></a> 
			<a href="/cafe/seat/selectseat.do#cafeseat" class="icon solid fa-mug-hot"><span>CafeSeat</span></a>
			<a href="#mypage" class="icon solid fa-heart"><span>MyPage</span></a>
			<a href="/cafe/user/login.do#login" class="icon solid fa-user"><span>Login</span></a>
		</nav>
		
		<!-- Main -->
		<div id="main">

			<!-- map -->
			<article id="map" class="panel intro"></article>


			<!-- cafeseat -->
			<article id="cafeseat" class="panel"></article>


			<!-- mypage -->
			<article id="mypage" class="panel">
				<h1>MYPAGE</h1>
				<div>
					<input type="button" class="btn btn-outline-primary btn-lg"
						value="예약내역"></input> <input type="button"
						class="btn btn-outline-primary btn-lg" id="btn-fevorite"
						value="즐겨찾기"></input> <input type="button"
						class="btn btn-outline-primary btn-lg" value="쿠폰함"></input> <input
						type="button" class="btn btn-outline-primary btn-lg" value="내정보"></input>
				</div>
				<div id="content"></div>
			</article>


			<!-- login -->
			<article id="login" class="panel"></article>
		</div>


		<!-- Footer -->
		<div id="footer">
			<ul class="copyright">
				<li>&copy; Untitled.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>

	</div>

	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/browser.min.js"></script>
	<script src="../assets/js/breakpoints.min.js"></script>
	<script src="..//assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
	<script>
		$("#btn-fevorite").off('click').on('click', function() { 
		// $('#fevorite-box').remove();
		$('#content').empty();
		$('#content').append(`
			<div id="fevorite-box">
				<div class="fevorite-info">
					<span>투썸플레이스 역삼성홍타워점</span>
					<span>좌석수: 20석</span>
				</div>
				<div class="fevorite-info">
					<span>투썸플레이스 강남대륭타워점</span>
					<span>좌석수: 20석</span>
				</div>
				<div class="fevorite-info">
						<span>스타벅스 강남R점</span>
						<span>좌석수: 20석</span>
				</div>
			</div>
			`);
					
		});
			
	</script>

</body>
</html>