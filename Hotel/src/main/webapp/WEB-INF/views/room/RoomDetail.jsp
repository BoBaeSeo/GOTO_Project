<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<style>
.pd-hero-text{
	padding: 20px 0 20px;
}
</style>
<!-- Property Details Hero Section Begin -->
<section class="pd-hero-section set-bg"
	data-setbg="resources/img/properties/product-content-bg.jpg"
	style="background-image: url(&quot;img/properties/product-content-bg.jpg&quot;); height: 300px; margin: auto; padding: 80px">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 offset-lg-2">
				<div class="pd-hero-text">
						<p class="room-location"><i class="icon_pin"></i> ${hotelDTO.hoaddr }</p>
					<div class="room-price">
						<h2>${hotelDTO.honame }</h2>
						<p style="font-size: 25px;">${roomDTO.roname }</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Property Details Hero Section Begin -->

<!-- Property Details Section Begin -->
<section class="property-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="property-sidebar">
					<h4>Reservation</h4>

					<form class="sidebar-search">
						<div class="first-row">
							<div id="ctnameDiv">

								<p>체크인</p>
                            	<input type="date" id="checkin" class="div-Date" name="bcheckin">
                            	<p>체크아웃</p>
                            	<input type="date" id="checkout" class="div-Date" name="bcheckout">
							</div>
						</div>
						<div id="bpriceDiv">
							<br> <br>
							<c:if test="${sessionScope.MLoginId != null }">
								<button type="button" onclick="BookingBtn()" class="search-btn">예약</button>
								<br>
								<br>
								<button type="reset" class="search-btn">다시작성</button>
								<br>
								<br>
							</c:if>
							<button type="button" onclick="RestaurantBtn()"
								class="search-btn">맛집list</button>
							<br> <br> <br>
							<button type="button" onclick="LandMarkBtn()" class="search-btn">관광지list</button>

						</div>
					</form>
				</div>
			</div>

			<div class="col-lg-9">
				<div class="pd-details-text">
					<div class="property-more-pic">
						<div class="product-pic-zoom">
							<img name="rofilename" class="product-big-img"
								src="resources/img/roomFile/${roomDTO.rofilename }" alt="" width="100px" height="300px">
						</div>
					</div>
					<div class="pd-details-text">
						<div class="pd-details-tab">
							<div class="tab-item">
								<ul class="nav" role="tablist">
									<li><a class="active" data-toggle="tab" href="#tab-1"
										role="tab">룸정보</a></li>
								</ul>
							</div>
							<div class="tab-item-content">
								<div class="tab-content">
									<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
										<div class="property-more-table">
											<table class="table">
												<tbody>
													<tr>
														<td class="pt-name">룸이름</td>
														<td class="p-value">${roomDTO.roname }</td>
													</tr>
													<tr>
														<td class="pt-name">최소인원 수</td>
														<td class="p-value">${roomDTO.rominper }명</td>
													</tr>
													<tr>
														<td class="pt-name">최대인원 수</td>
														<td class="p-value">${roomDTO.romaxper }명</td>
													</tr>
													<tr>
														<td class="pt-name">룸 가격</td>
														<td class="p-value">${roomDTO.roprice }원</td>
													</tr>
													<tr>
														<td class="pt-name">룸정보</td>
														<td class="p-value">${roomDTO.rodetail }</td>
													</tr>
													<tr>
													</tr>

												</tbody>
											</table>
										</div>
									</div>


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Property Details Section End -->
<script>
	function BookingBtn() {

		var rocode = "${roomDTO.rocode }";
		var checkin = $("#checkin").val();
		var checkout = $("#checkout").val();
		if(checkin == ""){
			alert('체크인 날짜를 입력해주세요');
			return;
			}
		if(checkin == ""){
			alert('체크아웃 날짜를 입력해주세요');
			return;
			}
		location.href = "bookingCheckForm?b_rocode=" + rocode + "&bcheckin="
				+ checkin + "&bcheckout=" + checkout;

	}
	function RestaurantBtn() {
		location.href = "landmarkList";

	}

	function LandMarkBtn() {

		location.href = "restaurantList";

	}
</script>

<%@ include file="../includes/footer.jsp"%>