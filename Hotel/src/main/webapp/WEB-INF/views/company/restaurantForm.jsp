<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>

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
												<form action="JoinRestaurant" method="post" enctype="multipart/form-data">
											<table class="table table-bordered" cellspacing="0">

													<tr>
														<td>식당이름</td>
														<td><input type="text" name="rename"></td>
													</tr>
													<tr>
														<td>식당주소</td>
														<td><input type="text" name="readdr"></td>
													</tr>
													<tr>
														<td>식당사진</td>
														<td><input type="file" name="rephoto" id="rephoto"></td>
													</tr>
												<tr>
													<td>식당 소개글</td>
													<td><textarea name="reintro" cols="40" rows="20"></textarea></td>
												</tr>
												<tr>
													<td>지역 고르기</td>
													<td>
														<div>
															<select id="select1" name="re_ctcode">
																<option value="CT001" selected="selected">서울</option>
																<option value="CT002">부산</option>
																<option value="CT003">전주</option>
																<option value="CT004">부산</option>
																<option value="CT005">제주</option>
															</select>
														</div>
													</td>
												</tr>
												<tr>
													<td colspan="2"><input class="btn primary-btn"
																	 type="submit" value="글등록">
													</td>
												</tr>
												<tr>
													<td colspan="2" style="text-align: center;">
														<button class="btn primary-btn" type="button"
															onclick="location.href='companyMain'">관리자 홈으로</button>
													</td>
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
	});
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