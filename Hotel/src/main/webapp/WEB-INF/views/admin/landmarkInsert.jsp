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
										class="contact-form" enctype="multipart/form-data" id="insertId">
										<table class="table" cellspacing="0">
											<tr style="display: none;">
												<td><input type="hidden" name="lacode" value="${lacode}"
													readonly="readonly"></td>
											</tr>
											<tr>
												<th>관광 명소 지역</th>
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
												<th>관광지 이름</th>
												<td colspan="3"><input type="text" id="inputLaname" name="laname"
													placeholder="관광지 이름"><span id="lanameCheck"></span></td>
											</tr>
											<tr>
												<th>우편번호</th>
												<td colspan="3"><input type="text" name="laaddr_postcode"
													id="sample6_postcode" placeholder="우편번호"> <input
													type="button" onclick="sample6_execDaumPostcode()"
													value="우편번호 찾기"></td>
											</tr>
											<tr>
												<th>주소</th>
												<td colspan="3"><input type="text" name="laaddr_address"
													id="sample6_address" placeholder="주소"></td>
											</tr>
											<tr>
												<th>상세 주소</th>
												<td colspan="3"><input type="text" name="laaddr_detailAddress"
													id="sample6_detailAddress" placeholder="상세주소"></td>
											</tr>
											<tr>
												<th>참고 항목</th>
												<td colspan="3"><input type="text" name="laaddr_extraAddress"
													id="sample6_extraAddress" placeholder="참고항목"></td>
											</tr>
											<tr>
												<th>관광지 홍보 문구</th>
												<td colspan="3"><textarea name="laintro" id="laintro" placeholder="관광지 홍보 문구"></textarea></td>
											</tr>
											<tr>
												<th>사진</th>
												<td colspan="3"><input type="file" name="laphoto" id="laphoto"></td>
											</tr>
											<tr>
												<td colspan="5"><button type="button" onclick="insertForm()" class="site-btn">입력</button></td>
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
<script src="resources/js/findLocation.js"></script>
</html>


<script type="text/javascript">
	$(document).ready(
			function() {

				$("#inputLaname").keyup(
						function() {
							var inputLaname = $("#inputLaname").val();
							/* 관광지 이름 중복 확인 */
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
					
				$("#ctname").change(function(){
					$("#ctdivideDiv").removeAttr("style");
			    	})
			    $("#ctdivide").change(function(){
			        var ctname = $("#ctname").val();
			        var ctdivide = $("#ctdivide").val();
			        /*  도시 선택하면 세부 지역 불러오기 */
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
	/* 도시 세부 지역 option 생성 */
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

	 /* 최종적으로 등록하는 함수 */
		function insertForm(){
			var ctname = $("#ctname").val();
	        var ctdivide = $("#ctdivide").val();
			var ctborough = $("#ctborough").val();
			/* 지역 선택 안 할 경우 retrun */
			if(ctname == "" || ctdivide == "" || ctborough == ""){
				alert('지역을 선택해주세요');
				return;
				}
			var inputLaname = $("#inputLaname").val();
	        var sample6_postcode = $("#sample6_postcode").val();
			var laintro = $("#laintro").val();
			var laphoto = $("#laphoto").val();
			if(inputLaname == "" || sample6_postcode == "" || laintro == ""|| laphoto == "" ){
				alert('작성을 완료해주세요');
				return;
				}
			alert('작성이 완료되었습니다.')
			insertId.submit();
			
			}
</script>

