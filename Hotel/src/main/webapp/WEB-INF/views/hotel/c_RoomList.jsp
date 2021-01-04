<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<!-- Property Details Hero Section Begin -->
<section class="pd-hero-section set-bg"
	data-setbg="resources/img/properties/product-content-bg.jpg"
	style="background-image: url(&quot;img/properties/product-content-bg.jpg&quot;); height: 300px; margin: auto; padding: 80px">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 offset-lg-2">
				<div class="pd-hero-text">
					<p class="room-location">
						<i class="icon_pin"></i> ${hotelDTO.hoaddr }
					</p>
					<h2>${hotelDTO.honame }</h2>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Property Details Hero Section End -->

<!-- Property Details Section Begin -->
<section class="property-details-section property-section spad">
	<div class="container">
		<div class="row">
			<div class="col-5">
				<div class="pd-details-text">
					<div class="pd-details-tab">
						<div class="tab-item">
							<ul class="nav" role="tablist">
								<li><a class="active" data-toggle="tab" href="#tab-1" role="tab">호텔정보</a></li>
								<li><a data-toggle="tab" href="#tab-2" role="tab">세부사항</a></li>
							</ul>
						</div>
						<div class="tab-item-content">
							<div class="tab-content">
								<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
									<div class="property-more-table">
										<table class="table">
											<tbody>
												<tr>
													<td class="pt-name">무료와이파이</td>
													<td class="p-value">${h_info.inwifi }</td>
												</tr>
												<tr>
													<td class="pt-name">조식</td>
													<td class="p-value">${h_info.inbreak }</td>
												</tr>
												<tr>
													<td class="pt-name">주차</td>
													<td class="p-value">${h_info.inparking }</td>
												</tr>
												<tr>
													<td class="pt-name">이른 체크인</td>
													<td class="p-value">${h_info.incin_early }</td>
												</tr>
												<tr>
													<td class="pt-name">늦은 체크아웃</td>
													<td class="p-value">${h_info.incout_late }</td>
												</tr>
												<tr>
													<td class="pt-name">체크인 시간</td>
													<td class="p-value">${h_info.incin }</td>
												</tr>
												<tr>
													<td class="pt-name">체크아웃 시간</td>
													<td class="p-value">${h_info.incout }</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-2" role="tabpanel">
									<div class="pd-table-desc">
										<p>${h_info.indetail }</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			<!-- ReviewList Start -->
			<div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <h4 id="reviewTitle">${reviewCnt } Review (${hotelDTO.hoscore })</h4>
                    <div class="comment-option" id="reviewArea" style="height:400px; overflow: auto;">
				<c:forEach var="vlist" items="${reviewList}">
                        <div class="single-comment-item" style="border-bottom: 1px solid gray; padding: 15px; margin: 0">
                            <div class="sc-text" style="width: 330px">
                                <span>작성날짜: ${vlist.vdrawup }</span>
                                <h5>작성자: ${vlist.vwriter }</h5>
                                <p>내용: ${vlist.vcontent }</p>
                                <a href="#" class="comment-btn">Like</a> 
                                <a href="#" class="comment-btn">수정</a> <a class="comment-btn" onclick="deleteReview(${vlist.vcode})">삭제</a> 
                                <div style="float: right">
                                <select>
                                	<option selected>${vlist.vscore }</option>
                                </select>
                            	</div>
                            </div>
                        </div>
           		</c:forEach>
                    </div>
                </div>
           		</div>
			<!-- ReviewList End -->
			<div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="leave-comment">
                        <h4>Review 등록하기</h4>
                        <form action="#">
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" id="vwriter" value="${sessionScope.MloginId }">
                                </div>
                            </div>
                            <textarea placeholder="Content" id="vcontent" required="required"></textarea>
                            <select id="vscore">
                                <option value="">별점</option>
                                <option>1</option><option>2</option><option>3</option>
                                <option>4</option><option>5</option>
                            </select> &nbsp;
                            <button type="button" class="site-btn" onclick="writeReview()">등록하기</button>
                            </form>
                    </div>
                </div>
            </div>
		</div>
			<!-- RoomList Start -->
			<div class="col-7" style="height: 1000px; overflow: auto">
				<h4 class="property-title">RoomList</h4>
				<div class="property-list">
					<c:forEach var="list" items="${roomList }">
						<div class="single-property-item" style="background: #f2f4f5;">
							<div class="row">
								<div class="col-md-4">
									<div class="property-pic">
										<a href="c_RoomList?hocode=${list.rocode }" style="text-decoration: none;"><img
											src="img/properties/${list.rophoto }.jpg" alt=""></a>
									</div>
								</div>
								<div class="col-md-8">
									<div class="property-text">
										<div class="s-text"></div>
										<h5 class="r-title">
											<a href="c_RoomList?hocode=${list.rocode }"
												style="text-decoration: none; color: black;">${list.roname }</a>
										</h5>
										<div class="properties-location">
										<p>${list.rodetail }</p>
										<p>기본인원: ${list.rominper } 명  최대인원: ${list.romaxper } 명</p>
										<div class="room-price">
											<span>가격: </span>
											<h5>${list.roprice }</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					<!-- RoomList End -->
				</div>
			</div>
		</div>
	</div>
</section>
		<!-- Property Section End -->
		<!-- Map Start -->
		<div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2942.5524090066037!2d-71.10245469994108!3d42.47980730490846!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89e3748250c43a43%3A0xe1b9879a5e9b6657!2sWinter%20Street%20Public%20Parking%20Lot!5e0!3m2!1sen!2sbd!4v1577299251173!5m2!1sen!2sbd" height="500" style="border:0;" allowfullscreen=""></iframe>
        <div class="icon-list">
            <div class="icon icon-1">
                1
            </div>
            <div class="icon icon-2">
                2
            </div>
            <div class="icon icon-3">
                3
            </div>
            <div class="icon icon-4">
                4
            </div>
            <div class="icon icon-5">
                5
            </div>
        </div>
    </div>
    <!-- Map End -->
    
<script>
	function writeReview(){
		var hocode = '${hotelDTO.hocode}';
		var vwriter = $("#vwriter").val();
		var vcontent = $("#vcontent").val();
		var vscore = $("#vscore").val();
		if(vcontent == ''){
			alert('리뷰 내용을 작성해주세요');
			$("#vcontent").focus();
			return;
		}
		if(vscore == ''){
			alert('별점을 등록해주세요');
			return;
		}
		$.ajax({
			type: "post",
			url: "writeReview",
			data: {
				"hocode": hocode,
				"vwriter": vwriter,
				"vcontent": vcontent,
				"vscore": vscore
			},
			dataType: "json",
			success: function(result){
				console.log(result);
				appendReview(result);
			},
			error: function(){
				console.log("review insert 연결실패")
			}
		})
	}

	function appendReview(result){
		var wDate = new Date(result.newReview.vdrawup);
		var vdrawup = wDate.getFullYear() + '-' +wDate.getMonth()+1 + '-' + wDate.getDate();
		var output = '<div class="single-comment-item" style="border-bottom: 1px solid gray; padding: 15px; margin: 0">';
		output += '<div class="sc-text" style="width: 330px"><span>작성날짜: '+ vdrawup +'</span>';
		output += '<h5>작성자: '+result.newReview.vwriter+'</h5><p>내용: '+result.newReview.vcontent +'</p><a href="#" class="comment-btn">';
		output += 'Like</a><div style="float: right"><select><option selected>'+result.newReview.vscore+'</option></select></div></div></div>';
		$("#vcontent").val('');
		$("#vscore").val('');
		$("#reviewTitle").text(result.reviewCnt + " Review (" + result.hoscore + ")")
		$("#reviewArea").append(output);
	}

	function deleteReview(vcode){
		var hocode = '${hotelDTO.hocode}';
		$.ajax({
			type: "post",
			url: "deleteReview",
			data: {
				"vcode" : vcode,
				"hocode" : hocode
			},
			dataType: "json",
			success: function(data){
				console.log(data);
				printReview(data);
			},
			error: function(){
				console.log("review delete 연결실패")
			}
		})
	}
</script>
<%@ include file="../includes/footer.jsp"%>
