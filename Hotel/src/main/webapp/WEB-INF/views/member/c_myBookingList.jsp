<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<style>
	.col-lg-4{
		float: left;
	}
	.f-text{
		font-size: 13px;
    	color: #ffffff;
    	font-weight: 500;
    	text-transform: uppercase;
    	letter-spacing: 1px;
    	background: #E1481F;
    	display: inline-block;
    	padding: 3px 20px;
    	float: right;
	}
	.s-text{
		font-size: 13px;
		float: left;
	}
	h5, .room-price{
		clear: both;
		padding: 10px;
	}
	p{
		width: 250px;
		float: left;
		margin: 5px;
	}
	.review{
		background: #ffffff;
		color: #2cbdb8;
		float: right;
	}
	.t_title{
		font-weight: bold;
		font-size: 17px;
	}
</style>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>My Page</h2>
					<div class="breadcrumb-option">
						<a href="#"><i class="fa fa-home"></i> Home</a> <span>My
							BookingList</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

    <section class="property-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="property-sidebar">
                        <h4>예약하기</h4>
                        <form action="c_HotelList" class="sidebar-search" method="post">
                            <div class="first-row">
                            <select name="ctname">
                                <option value="null">지역</option>
                                <option value="서울">서울</option>
                                <option value="부산">부산</option>
                                <option value="제주도">제주도</option>
                            </select>
                            <input type="date" value="" name="bcheckin">
                            <input type="date" value="" name="bcheckout">
                            <select name="bperson">
                                <option value="">인원</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>
                       	 	</div>
                        	<div class="second-row">
                            <select name="bprice">
                                <option value="">가격</option>
                                <option value="50000">50000이하</option>
                                <option value="100000">100000이하</option>
                                <option value="150000">150000이하</option>
                            </select>
                            <button type="submit" class="search-btn">Search</button>
                            </div>
                        </form>
                    </div>
                </div>
                
                <!-- bookingList Start -->
                <div class="col-lg-9">
                    <h4 class="property-title">숙소 예약내역</h4>
                    <div class="property-list">
                    <c:forEach var="list" items="${bookingList }">
                        <div class="single-property-item">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="property-pic">
                                        <a href="c_RoomList?hocode=${list.b_hocode }" style="text-decoration: none;"><img src="img/properties/${list.hophoto }.jpg" alt=""></a>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="property-text">
                                        <div class="s-text" style="display: none;" id="complete${list.bcode }">이용완료</div>
                                    	<div class="f-text" style="display: none;" id="cancel${list.bcode }" onclick="cancelBooking('${list.bcode }')">예약취소</div>
                                        <h5 class="r-title"><a href="c_RoomList?hocode=${list.b_hocode }" style="text-decoration: none; color: black;">${list.honame }</a>
                                        <span class="t_title">&nbsp; -&nbsp; ${list.roname }</span></h5>
                                        <div class="properties-location"><i class="icon_pin"></i>${list.hoaddr }</div>
                                        <p id="checkinDate${list.bcode }"><span class="t_title">체크인 :</span> ${list.bcheckin }</p> <p><span class="t_title"> 예약자 :</span> ${list.mname }</p>
                                        <p id="checkoutDate${list.bcode }"><span class="t_title">체크아웃 :</span> ${list.bcheckout }</p> <p><span class="t_title">전화번호 :</span> ${list.mphone }</p>
                                        <div class="room-price">
                                            <span>결제 가격: </span>
                                            <h5>${list.bprice } </h5>
                                        </div>
                                        <button type="button" class="site-btn review" onclick="writeReview('${list.b_hocode}')">리뷰 등록</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <c:forEach begin="${pageDTO.startpage }" end="${pageDTO.endpage }" step="1" var="pageNum">
                    <div class="property-pagination">
                    	<c:choose>
                    		<c:when test="${pageNum == pageDTO.page }">
		                        <a href="#" class="active">${pageNum }</a>
                    		</c:when>
                    		<c:otherwise>
		                        <a href="c_HotelList?page=${pageNum }">${pageNum }</a>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
<!-- bookingList End -->
<script>
	$(document).ready(function(){
		$("#home").removeClass('active');
		$("#hotel").removeClass('active');
		$("#help").addClass('active');
		checkDate();
	})
	function checkDate(){
		<c:forEach var="list" items="${bookingList}">
		var bcode = "${list.bcode}";
		var checkin = new Date("${list.bcheckin}");
		var checkout = new Date("${list.bcheckout}");
		var nowDate = new Date();
		console.log(nowDate > checkin)
		if(nowDate > checkin){
			$("#complete" + bcode).removeAttr('style')
		} else {
			$("#cancel" + bcode).removeAttr('style')
		}
		</c:forEach>
	}

	function cancelBooking(bcode){
		
	}

	function writeReview(hocode){
		window.name = "bookingList";
		var openWin = window.open("resources/writeReview.jsp?hocode="+hocode, "reviewPop", "width=700, height=500, left=100, top=50");
	}
</script>
<%@ include file="../includes/footer.jsp"%>
