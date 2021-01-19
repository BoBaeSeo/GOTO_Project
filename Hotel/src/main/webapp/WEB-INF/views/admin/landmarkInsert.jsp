<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../includes/a_sidebar.jsp"%>

<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>랜드마크 등록 페이지</h2>
					<div class="breadcrumb-option">
						<span>관광 명소 등록</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main top 끝 -->

	<!-- main container 시작 -->
	<section class="property-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="property-list">
						<div class="card shadow">
							<div class="card-body">
								<div class="table-responsive">
									<form action="landmarkInsert" method="post"
										class="contact-form" enctype="multipart/form-data">
										<table class="table table-bordered" cellspacing="0">
											<tr>
												<th>관광지 코드</th>
												<td><input type="text" name="lacode" value="${lacode}"
													readonly="readonly"></td>
											</tr>
											<tr>
												<th>관광 명소 지역</th>
												<td><select name="la_ctcode">
														<option value="#">관광 명소 지역 선택</option>
														<option value="CT001">서울 CT001</option>
														<option value="CT002">부산 CT002</option>
														<option value="CT003">제주 CT003</option>
														<option value="CT004">여수 CT004</option>
														<option value="CT005">경주 CT005</option>
												</select></td>
											</tr>
											<tr>
												<th>관광지 이름</th>
												<td><input type="text" id="inputLaname" name="laname"
													placeholder="관광지 이름"><span id="lanameCheck"></span></td>
											</tr>
											<tr>
												<th>우편번호</th>
												<td><input type="text" name="laaddr_postcode"
													id="sample6_postcode" placeholder="우편번호"> <input
													type="button" onclick="sample6_execDaumPostcode()"
													value="우편번호 찾기"></td>
											</tr>
											<tr>
												<th>주소</th>
												<td><input type="text" name="laaddr_address"
													id="sample6_address" placeholder="주소"></td>
											</tr>
											<tr>
												<th>상세 주소</th>
												<td><input type="text" name="laaddr_detailAddress"
													id="sample6_detailAddress" placeholder="상세주소"></td>
											</tr>
											<tr>
												<th>참고 항목</th>
												<td><input type="text" name="laaddr_extraAddress"
													id="sample6_extraAddress" placeholder="참고항목"></td>
											</tr>
											<tr>
												<th>관광지 홍보 문구</th>
												<td><textarea name="laintro" placeholder="관광지 홍보 문구"></textarea></td>
											</tr>
											<tr>
												<th>사진</th>
												<td><input type="file" name="laphoto"></td>
											</tr>
											<tr>
												<td colspan="2"><button type="submit" class="site-btn">입력</button></td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main container 끝 -->
</div>

</body>

<!-- Js Plugins -->
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/jquery.slicknav.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/main.js"></script>

</html>


<script type="text/javascript">
	$(document).ready(
			function() {

				$("#inputLaname").keyup(
						function() {
							var inputLaname = $("#inputLaname").val();
							$.ajax({
								type : "post",
								url : "lanameCheck",
								data : {
									"inputLaname" : inputLaname
								},
								dataType : "text",
								success : function(result) {
									console.log("result: " + result);
									if (result == "OK") {
										$("#lanameCheck").css("color", "green")
												.text("등록할 수 있는 관광지 이름입니다.");
									} else {
										$("#lanameCheck").css("color", "red")
												.text("중복된 이름입니다.");
									}

								},
								error : function() {
									alert("lanameCheck 연결 실패");
								}

							});

						});

				$("#inputLacode").keyup(
						function() {
							var inputLacode = $("#inputLacode").val();
							$.ajax({
								type : "post",
								url : "lacodeCheck",
								data : {
									"inputLacode" : inputLacode
								},
								dataType : "text",
								success : function(result) {
									console.log("result: " + result);
									if (result == "OK") {
										$("#lacodeCheck").css("color", "green")
												.text("등록할 수 있는 코드입니다.");
									} else {
										$("#lacodeCheck").css("color", "red")
												.text("중복된 코드입니다.");
									}

								},
								error : function() {
									alert("lacodeCheck 연결 실패");
								}

							});

						});
			});
</script>

<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>