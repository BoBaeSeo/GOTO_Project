<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>맛집등록</h2>
					<div class="breadcrumb-option">
						<span>restaurantForm</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="property-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="property-list">
						<c:choose>
							<c:when test="${sessionScope.ALoginId=='ADMIN' }">
								<div class="card shadow">
									<div class="card-body">
										<div class="table-responsive">
												<form action="JoinRestaurant" method="post" enctype="multipart/form-data" id="insertId">
												<table class="table" cellspacing="0">
											<tr>
												<th>식당 지역</th>
												<td><select name="ctname" id="ctname">
                                					<option value="">지역 선택</option>
                                					<option value="서울">서울</option>
                                					<option value="경주">경주</option>
                                					<option value="부산">부산</option>
                                					<option value="여수">여수</option>
                                					<option value="제주도">제주도</option>
                            					</select></td>
												<td style="display: none;" id="ctdivideDiv">
                                				<select name="ctdivide" id="ctdivide" style="display: none;">
                                					<option value="">지역 선택</option>
                                					<option value="동">동</option>
                                					<option value="서">서</option>
                                					<option value="남">남</option>
                                					<option value="북">북</option>
                            					</select>
                                    	</td>
												<td style="display: none;" id="ctboroughDiv">
												<select name="ctborough" id="ctborough">
                                					<option value="">지역 선택</option>
                            					</select></td>
											</tr>
											<tr>
												<th>식당 이름</th>
												<td colspan="3"><input type="text" id="rename" name="rename"
													placeholder="식당 이름"><span id="lanameCheck"></span></td>
											</tr>
											<tr>
												<th>우편번호</th>
												<td colspan="3"><input type="text" name="readdr_postcode"
													id="sample6_postcode" placeholder="우편번호"> <input
													type="button" onclick="sample6_execDaumPostcode()"
													value="우편번호 찾기"></td>
											</tr>
											<tr>
												<th>주소</th>
												<td colspan="3"><input type="text" name="readdr_address"
													id="sample6_address" placeholder="주소"></td>
											</tr>
											<tr>
												<th>상세 주소</th>
												<td colspan="3"><input type="text" name="readdr_detailAddress"
													id="sample6_detailAddress" placeholder="상세주소"></td>
											</tr>
											<tr>
												<th>참고 항목</th>
												<td colspan="3"><input type="text" name="readdr_extraAddress"
													id="sample6_extraAddress" placeholder="참고항목"></td>
											</tr>
											<tr>
												<th>식당 홍보 문구</th>
												<td colspan="3"><textarea name="reintro" placeholder="식당 홍보 문구"></textarea></td>
											</tr>
											<tr>
												<th>사진</th>
												<td colspan="3"><input type="file" name="rephoto" id="rephoto"></td>
											</tr>
											<tr>
												<td colspan="5"><button type="button" onclick="insertForm()" class="site-btn">입력</button></td>
											</tr>
										</table>
											</form>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main container 끝 -->
</div>
</div>
<!-- main 끝 -->

</body>
<script>
	function GetSelectedItem(el) {
		var e = document.getElementById(el);
		var strSel = "The Value is: " + e.options[e.selectedIndex].value
				+ " and text is: " + e.options[e.selectedIndex].text;
		alert(strSel);
	}

	$(document).ready(function() {
		$("#rephoto").change(function() {
			var rephoto = $("#rephoto").val();
			console.log(rephoto);
		});
		$("#ctname").change(function(){
			$("#ctdivideDiv").removeAttr("style");
	    	})
	    $("#ctdivide").change(function(){
	        var ctname = $("#ctname").val();
	        var ctdivide = $("#ctdivide").val();
	        /* 도시 선택하면 세부 지역 select */
			$.ajax({
				type : "post",
				url : "getCtborough",
				data : {
					"ctname" : ctname,
					"ctdivide" : ctdivide
					},
				dataType : "json",
				success : function(result) {
					console.log(result);
					showCtborough(result);
					},
					error : function(){
						alert("연결 실패.");
						}
				})
	    	})
	});

	/* 세부 지역 option 생성 */
	 function showCtborough(result){
			$("#ctboroughDiv").removeAttr("style");
			$("#ctborough").empty();
			$("#ctboroughDiv .list").empty();
			var output = '<li data-value="none" class="option selected">지역 선택</li>';
			var option = "<option value='none'>지역 선택</option>";
			for(var list in result){
				option += "<option value='"+result[list]+"'>"+result[list]+"</option>";
				output += '<li data-value="'+result[list]+'" class="option selected focus">'+result[list]+'</li>'
				}
				$("#ctborough").append(option);
				$("#ctboroughDiv .list").append(output);
			 }

		function insertForm(){
			var ctname = $("#ctname").val();
	        var ctdivide = $("#ctdivide").val();
			var ctborough = $("#ctborough").val();
			if(ctname == "" || ctdivide == "" || ctborough == ""){
				alert('지역을 선택해주세요');
				return;
				}
			var rename = $("#rename").val();
	        var sample6_postcode = $("#sample6_postcode").val();
			var reintro = $("#reintro").val();
			var rephoto = $("#rephoto").val();
			if(rename == "" || sample6_postcode == "" || reintro == ""|| rephoto == "" ){
				alert('작성을 완료해주세요');
				return;
				}
			alert('작성이 완료되었습니다.')
			insertId.submit();
			
			}
</script>

<!-- Js Plugins -->
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/jquery.slicknav.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/js/findLocation.js"></script>

</html>