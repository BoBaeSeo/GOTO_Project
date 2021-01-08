<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<style>
	.like-btn{
    background: #2cbdb8;
    cursor: pointer;
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
                    <div class="comment-option" id="reviewArea" style="height:500px; overflow: auto;">
				<c:forEach var="vlist" items="${reviewList}">
                        <div class="single-comment-item" style="border-bottom: 1px solid gray; padding: 15px; margin: 0">
                            <div class="sc-text" style="width: 330px" >
                                <span>작성날짜: ${vlist.vdrawup }</span> <span style="float: right;" id="likeCnt${vlist.vcode }"></span>
                                <h5>작성자: ${vlist.vwriter }</h5>
                                <p id="modiContent${vlist.vcode }">내용: ${vlist.vcontent }</p>
                                <c:if test="${sessionScope.MLoginId != null }">
                                	<c:choose>
                                		<c:when test="${sessionScope.MLoginId != vlist.vwriter }">
                                			<a id="like${vlist.vcode }" class="comment-btn" onclick="likeProcess('${vlist.vcode}')">Like</a>
                                		</c:when>
                                		<c:otherwise><a id="modiBtn${vlist.vcode }" class="comment-btn" onclick="modifyReview('${vlist.vcode}', '${vlist.vcontent }')">수정</a> 
                                		<a class="comment-btn" onclick="deleteReview('${vlist.vcode}')">삭제</a></c:otherwise>
                                	</c:choose>
                                </c:if> 
                                <div style="float: right" id="modiScore${vlist.vcode }">
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
		</div>
		<!-- ReviewList End -->
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
											src="img/properties/${list.roFileName }.jpg" alt=""></a>
									</div>
								</div>
								<div class="col-md-8">
									<div class="property-text">
										<div class="s-text"></div>
										<h5 class="r-title">
											<a href="RoomDetail?rocode=${list.rocode }"
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
		<div class="map" id="map">
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YourKey&libraries=services"></script>
        <script type="text/javascript">
        	var container = document.getElementById('map'); 
			var mapOptions = { 
				center: new kakao.maps.LatLng(33.450701, 126.570667), 
				level: 3 
			};
			var map = new kakao.maps.Map(container, mapOptions);
			var geocoder = new kakao.maps.services.Geocoder();
			geocoder.addressSearch('${hotelDTO.hoaddr}', function(result, status){
				if(status === kakao.maps.services.Status.OK){
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords
						});
					var iwContent = '<div style="text-align:center;padding:5px;">${hotelDTO.honame}<br><a href="https://map.kakao.com/link/map/${hotelDTO.honame},'+result[0].y+','+result[0].x+'" style="color:blue" target="_blank">큰지도보기</a>';
					iwContent += ' <a href="https://map.kakao.com/link/to/${hotelDTO.honame},'+result[0].y+','+result[0].x+'" style="color:blue" target="_blank">길찾기</a></div>';
					var infowindow = new kakao.maps.InfoWindow({
						content: iwContent
						});
					infowindow.open(map, marker);
					map.setCenter(coords);
					}
				})
        </script>
    </div>
    <!-- Map End -->
    
<script>
	$(document).ready(function(){
		$("#home").removeClass('active');
		$("#help").removeClass('active');
		$("#hotel").addClass('active');
		checkLike();
	})
		
	function checkLike(){
		<c:forEach var="vlist" items="${reviewList}">
		var count = 0;
		<c:forEach var="likeList" items="${likeList}">
			var vcode = "${vlist.vcode}";
			var hi_vcode = "${likeList.hi_vcode}";
			var loginId = "${sessionScope.MLoginId}";
			var hiid = "${likeList.hiid}";
			if(vcode == hi_vcode && loginId == hiid){
				$("#like"+vcode).html('unlike').css({'color': '#ffffff','border': '1px solid #2cbdb8'}).addClass('like-btn');
			}
			if(vcode == hi_vcode){
			count++;
			}
		</c:forEach>
		$("#likeCnt${vlist.vcode}").text("like " + count);
		</c:forEach>
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
				printReview(data);
			},
			error: function(){
				console.log("review delete 연결실패")
			}
		})
	}
	
	function printReview(data){
		var output = '';
		var reviewCnt = data.reviewCnt;
		var hoscore = data.hoscore;
		var loginId = '${sessionScope.MLoginId}';
		for (var i in data.reviewList){
			var vcode = data.reviewList[i].vcode;
			var vwriter = data.reviewList[i].vwriter;
			var vcontent = data.reviewList[i].vcontent;
			var vscore = data.reviewList[i].vscore;
			var vdate = new Date(data.reviewList[i].vdrawup);
			var vdrawup = vdate.getFullYear() + '-' +vdate.getMonth()+1 + '-' + vdate.getDate();
			output += '<div class="single-comment-item" style="border-bottom: 1px solid gray; padding: 15px; margin: 0">';
			output += '<div class="sc-text" style="width: 330px"><span>작성날짜: '+vdrawup+'</span><h5>작성자: '+vwriter+'</h5>';
			output += '<p id="modiContent'+vcode+'">내용: '+vcontent+'</p><c:if test="${sessionScope.MLoginId != null }">';
			if(loginId == vwriter){
				output += '<a id="modiBtn'+vcode+'" class="comment-btn" onclick="modifyReview('+"'"+vcode+"'"+','+"'"+vcontent+"'"+')">수정</a>'
				output += '<a class="comment-btn" onclick="deleteReview('+"'"+vcode+"'"+')">삭제</a> '
			} else {
				output += '<a id="like${vlist.vcode }" class="comment-btn" onclick="likeProcess('+"'"+vcode+"'"+')">Like</a>';
			}
			output += '</c:if><div style="float: right" id="modiScore'+vcode+'"><div class="nice-select" tabindex="0"><span class="current">';
			output += vscore+'</span><ul class="list"><li data-value="'+vscore+'" class="option selected">'+vscore+'</li></ul></div></div></div></div>';
		}
		$("#reviewArea").html(output);
		$("#reviewTitle").text(reviewCnt + " Review (" + hoscore + ")");
	}

	function modifyReview(vcode, vcontent){
		if($("#modiBtn"+vcode).html() == '수정'){
			$("#modiContent"+vcode).html('<textarea placeholder="Content" id="vcontent'+vcode+'" required="required">'+vcontent+'</textarea>');
			$("#modiScore"+vcode).empty();
			var option = '<select id="vscore'+vcode+'" style="display:none;"><option value="">별점</option><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select>';
			option += '<div class="nice-select" tabindex="0"><span class="current">별점</span><ul class="list"><li data-value="" class="option selected">별점</li><li data-value="1" class="option">1</li>';
			option += '<li data-value="2" class="option">2</li><li data-value="3" class="option">3</li><li data-value="4" class="option">4</li><li data-value="5" class="option">5</li></ul></div>';
			$("#modiScore"+vcode).append(option);
			$("#modiBtn"+vcode).html('수정하기')
		} else {
			var hocode = '${hotelDTO.hocode}';
			var newVcontent = $("#vcontent"+vcode).val();
			var newVscore = $("#vscore"+vcode+" option:selected").val();
			if(newVcontent == ''){
				alert('리뷰 내용을 작성해주세요');
				$("#vcontent").focus();
				return;
			}
			if(newVscore == ''){
				alert('별점을 등록해주세요');
				return;
			}
			$.ajax({
				type: "post",
				url: "modifyReview",
				data: {
					"hocode" : hocode,
					"vcode" : vcode,
					"vcontent" : newVcontent,
					"vscore" : newVscore
				},
				dataType: "json",
				success: function(data){
					printReview(data);
				},
				error: function(){
					console.log('reviewModify 연결실패');
				}
			})
		}
	}

	function likeProcess(vcode){
		var loginId = '${sessionScope.MLoginId}';
		var hocode = '${hotelDTO.hocode}';
		if($("#like"+vcode).html() == 'Like'){
			$.ajax({
				type: "post",
				url: "likeProcess",
				data: {
					"hocode": hocode,
					"vcode": vcode,
					"loginId": loginId
				},
				dataType: "text",
				success: function(data){
					if(data == 'OK'){
						$("#like"+vcode).html('unlike').css({'color': '#ffffff','border': '1px solid #2cbdb8'}).addClass('like-btn');
						var likeCnt = $("#likeCnt"+vcode).text();
						var likeDevide = likeCnt.split(' ');
						$("#likeCnt"+vcode).text('like ' + (Number(likeDevide[1])+1));
					} else {
						console.log('like insert 실패')
					}
				},
				error: function(){
					console.log('like 연결실패')
				}
			})
		} else {
			$.ajax({
				type: "post",
				url: "unlikeProcess",
				data: {
					"hocode": hocode,
					"vcode": vcode,
					"loginId": loginId
				},
				dataType: "text",
				success: function(data){
					if(data == 'OK'){
						$("#like"+vcode).html('Like').removeClass('like-btn').removeAttr("style");
						var likeCnt = $("#likeCnt"+vcode).text();
						var likeDevide = likeCnt.split(' ');
						$("#likeCnt"+vcode).text('like ' + (Number(likeDevide[1])-1));
					} else {
						console.log('like delete 실패')
					}
				},
				error: function(){
					console.log('unlike 연결실패')
				}
			})
		}
	}

	</script>
<%@ include file="../includes/footer.jsp"%>
