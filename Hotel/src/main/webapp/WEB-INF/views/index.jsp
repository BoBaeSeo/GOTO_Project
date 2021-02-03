<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.main-menu #home {
	color: #2CBDB8;
}
</style>
</head>
<body>
	<%@ include file="includes/header.jsp"%>
	<!-- Hero Section Begin -->
	<section class="hero-section">
		<div class="hero-items owl-carousel">
			<div class="single-hero-item set-bg"
				data-setbg="resources/img/seoul1.jpg">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 offset-lg-2">
							<div class="hero-text">
								<p class="room-location">
									<i class="icon_pin"></i> 9721 Glen Creek Ave. Ballston Spa, NY
								</p>
								<h2>Villa 9721 Glen Creek</h2>
								<div class="room-price">
									<span>Start Form:</span>
									<p>$3.000.000</p>
								</div>
								<ul class="room-features">
									<li><i class="fa fa-arrows"></i>
										<p>5201 sqft</p></li>
									<li><i class="fa fa-bed"></i>
										<p>8 Bed Room</p></li>
									<li><i class="fa fa-bath"></i>
										<p>7 Baths Bed</p></li>
									<li><i class="fa fa-car"></i>
										<p>1 Garage</p></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="single-hero-item set-bg"
				data-setbg="resources/img/yosu.jpg">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 offset-lg-2">
							<div class="hero-text">
								<p class="room-location">
									<i class="icon_pin"></i> 9721 Glen Creek Ave. Ballston Spa, NY
								</p>
								<h2>Villa 9721 Glen Creek</h2>
								<div class="room-price">
									<span>Start Form:</span>
									<p>$3.000.000</p>
								</div>
								<ul class="room-features">
									<li><i class="fa fa-arrows"></i>
										<p>5201 sqft</p></li>
									<li><i class="fa fa-bed"></i>
										<p>8 Bed Room</p></li>
									<li><i class="fa fa-bath"></i>
										<p>7 Baths Bed</p></li>
									<li><i class="fa fa-car"></i>
										<p>1 Garage</p></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="single-hero-item set-bg"
				data-setbg="resources/img/kungju.jpg">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 offset-lg-2">
							<div class="hero-text">
								<p class="room-location">
									<i class="icon_pin"></i> 9721 Glen Creek Ave. Ballston Spa, NY
								</p>
								<h2>Villa 9721 Glen Creek</h2>
								<div class="room-price">
									<span>Start Form:</span>
									<p>$3.000.000</p>
								</div>
								<ul class="room-features">
									<li><i class="fa fa-arrows"></i>
										<p>5201 sqft</p></li>
									<li><i class="fa fa-bed"></i>
										<p>8 Bed Room</p></li>
									<li><i class="fa fa-bath"></i>
										<p>7 Baths Bed</p></li>
									<li><i class="fa fa-car"></i>
										<p>1 Garage</p></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="thumbnail-pic">
			<div class="thumbs owl-carousel">
				<div class="item">
					<img src="resources/img/seoul.jpg" alt="">
				</div>
				<div class="item">
					<img src="resources/img/yosu.jpg" alt="">
				</div>
				<div class="item">
					<img src="resources/img/kungju.jpg" alt="">
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Search Form Section Begin -->
	<div class="search-form">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="search-form-text">
						<div class="search-text">
							<i class="fa fa-search"></i> 예약하기
						</div>
					</div>
					<form action="c_HotelList" method="post" class="filter-form"
						id="c_hotelListcon">
						<div class="first-row">
							<select name="ctname">
								<option value="">지역</option>
								<option value="서울">서울</option>
								<option value="경주">경주</option>
								<option value="부산">부산</option>
								<option value="여수">여수</option>
								<option value="제주">제주</option>
							</select> <input type="date" class="div-Date" id="checkin" name="bcheckin"
								max="9999-12-31" min="오늘"> <input type="date"
								class="div-Date" id="checkout" name="bcheckout" max="9999-12-31"
								min="체크인">
						</div>
						<div class="second-row">
							<select name="bperson">
								<option value="">인원</option>
								<option value="1">1인</option>
								<option value="2">2인</option>
								<option value="3">3인</option>
								<option value="4">4인</option>
								<option value="5">5인</option>
								<option value="6">6인 이상</option>
							</select> <select name="bprice">
								<option value="">가격</option>
								<option value="50000">50,000원 이하</option>
								<option value="100000">100,000원 이하</option>
								<option value="150000">150,000원 이하</option>
							</select>
							<div class="price-range-wrap">
								<div class="price-text"></div>
							</div>
							<div class="room-size-range">
								<div class="price-text"></div>
							</div>
							<button type="button" class="search-btn" onclick="c_hotellist()">Search</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Search Form Section End -->

	<!-- How It Works Section Begin -->
	<section class="howit-works spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<span>Find Your Dream House</span>
						<h2>How It Work</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="single-howit-works">
						<img src="resources/img/howit-works/rastaurant.JPG" alt="">
						<h4>
							<a href="restaurantList">Restaurant</a>
						</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore.</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="single-howit-works">
						<img src="resources/img/howit-works/landmark.JPG" alt="">
						<h4>
							<a href="landmarkList">Landmark</a>
						</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- How It Works Section End -->
	<%@ include file="includes/footer.jsp"%>
	<script>
		function c_hotellist() {
			var bcheckin = $("#checkin").val();
			var bcheckout = $("#checkout").val();

			console.log(bcheckin);
			console.log(bcheckout);

			if (bcheckin != "" && bcheckout != "") {
				c_hotelListcon.submit();
			} else {
				alert("다시 입력");
				history.back;
			}

		}
		$(document).ready(function() {
			var bookingesult = "${bookingesult}";
			if (bookingesult == "OK") {
				alert('예약이 완료되었습니다.')
			}

			var msg = "${msg}";
			console.log(msg);
			if (msg != "") {
				alert(msg);
			}
			var loginResult = "${loginResult}";
			if (loginResult == "OK") {
				alert('로그인 되었습니다.')
			}
		});
	</script>
</body>
</html>