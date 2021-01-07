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
               <div class="best-agents">
                  <h4>Help</h4>
                  <a href="c_questionList" class="ba-item">
                     <div class="ba-text">
                        <h5>1대1 문의 목록</h5>
                        <span>Q&A</span>
                     </div>
                  </a> <a href="#" class="ba-item">
                     <div class="ba-text">
                        <h5>1대1 문의 작성</h5>
                        <span>#</span>
                     </div>
                  </a> <a href="#" class="ba-item">
                     <div class="ba-text">
                        <h5>자주 묻는 질문</h5>
                        <span>#</span>
                     </div>
                  </a>
               </div>
            </div>
         </div>
                
                <!-- bookingList Start -->
                <div class="col-lg-9">
                    <h4 class="property-title">숙소 예약내역</h4>
                    <div class="property-list">
                    <c:if test="${bookingList[0].bcode == null }">
                    <div class="breadcrumb-text">
					<h5 style="padding: 150px">예약된 내역이 없습니다.</h5>
					</div>
                    </c:if>
                    <c:forEach var="list" items="${bookingList }">
                        <div class="single-property-item" id="deldiv${list.bcode }">
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
                                        <button type="button" style="display: none;" id="review${list.bcode }" class="site-btn review" onclick="writeReview('${list.b_hocode}')">리뷰 등록</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <div class="property-pagination">
                    <c:forEach begin="${pageDTO.startpage }" end="${pageDTO.endpage }" step="1" var="pageNum">
                    	<c:choose>
                    		<c:when test="${pageNum == pageDTO.page }">
		                        <a href="#" class="active">${pageNum }</a>
                    		</c:when>
                    		<c:otherwise>
		                        <a href="c_HotelList?page=${pageNum }">${pageNum }</a>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    </div>
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
		if(nowDate > checkin){
			$("#complete" + bcode).removeAttr('style')
			$("#review" + bcode).removeAttr('style')
		} else {
			$("#cancel" + bcode).removeAttr('style')
		}
		</c:forEach>
	}

	function cancelBooking(bcode){
		var loginId = '${sessionScope.MLoginId}';
		var mpw = '${bookingList[0].mpassword}';
		var inputPw = prompt('비밀번호를 입력하세요');
		console.log(mpw)
		console.log(inputPw)
		if(mpw == inputPw){
			$.ajax({
				type: 'post',
				url: 'deleteBooking',
				data: {
					'bcode' : bcode
				},
				dataType: 'text',
				success: function(data){
					if(data == 'OK'){
						$("#deldiv"+bcode).remove();
						alert('예매가 취소되었습니다.')
					}
				},
				error: function(){
					console.log('예매 취소 연결실패')
				}
			})

		} else {
			alert('비밀번호가 일치하지 않습니다.')
		}
		
	}

	function writeReview(hocode){
		window.name = "bookingList";
		var openWin = window.open("resources/writeReview.jsp?hocode="+hocode+"&loginId=${sessionScope.MLoginId}", "reviewPop", "width=700, height=500, left=100, top=50");
	}
</script>
<%@ include file="../includes/footer.jsp"%>
