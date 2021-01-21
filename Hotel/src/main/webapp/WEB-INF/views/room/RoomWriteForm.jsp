<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<!-- main 시작 -->
<!-- main top 시작-->
<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>룸등록</h2>
					<div class="breadcrumb-option">
						<span>RoomWriteForm</span>
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
									<form action="RoomWrite" method="post"
										enctype="multipart/form-data" id="roomForm">
										<select name="ro_hocode" id="ro_hocode">
										<option value="">호텔선택</option>
										<c:forEach var="list" items="${hotelList }">
											<option value="${list.hocode }">${list.honame }</option>
										</c:forEach>
										</select><br> <br>
										<table class="table table-bordered" cellspacing="0">
											<tr>
												<td>룸이름</td>
												<td><input type="text" placeholder="룸 이름" name="roname" id="roname"></td>
											</tr>
											<tr>
												<td>룸사진</td>
												<td><input type="file" name="rophoto" name="rophoto" id="rophoto"></td>
											</tr>
											<tr>
												<td>룸 상세정보</td>
												<td><input type="text" placeholder="룸 상세정보"
													name="rodetail" id="rodetail"></td>
											</tr>
											<tr>
												<td>룸최소인원</td>
												<td><input type="number" name="rominper" id="rominper">명</td>
											</tr>
											<tr>
												<td>룸최대인원</td>
												<td><input type="number" name="romaxper" id="romaxper">명</td>
											</tr>
											<tr>
												<td>룸가격</td>
												<td><input type="text" placeholder="룸 가격"
													name="roprice" id="roprice"></td>
											</tr>
											<tr>
												<td>방갯수</td>
												<td><input type="number" name="ronum" id="ronum">개</td>
											</tr>
										</table>
										<input type="button" onclick="roomFormSubmit()" value="방등록">
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
<!-- main 끝 -->


<script type="text/javascript">
	$(document).ready(function() {
		$("#rophoto").change(function() {
			var rophoto = $("#rophoto").val();
			console.log(rophoto);

		});
	});
	function roomFormSubmit(){
		var ro_hocode = $("#ro_hocode").val();
		var roname = $("#roname").val();
		var rophoto = $("#rophoto").val();
		var rominper = $("#rominper").val();
		var romaxper = $("#romaxper").val();
		var roprice = $("#roprice").val();
		var ronum = $("#ronum").val();
		if(ro_hocode == "" || roname == "" || rophoto == "" || rominper == "" || romaxper == "" || roprice == "" ||ronum == "" ){
			alert('작성을 완료해주세요');
			return;
			}
		alert('등록되었습니다.');
		roomForm.submit();
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
</html>