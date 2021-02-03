<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>

<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>랜드마크 수정 페이지</h2>
					<div class="breadcrumb-option">
						<span>${lList.lacode} 관광 명소 관리</span>
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
									<form action="landmarkModify" method="post"
										class="contact-form" enctype="multipart/form-data"
										id="modifyForm">
										<table class="table table-bordered" cellspacing="0">
											<thead>
												<tr>
													<th>랜드마크 코드</th>
													<th>도시 코드</th>
													<th>랜드마크 이름</th>
													<th>주소</th>
													<th>수정과 삭제</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input type="text" name="lacode"
														readonly="readonly" value="${lList.lacode}"></td>
													<td><input type="text" name="la_ctcode"
														readonly="readonly" value="${lList.la_ctcode}"></td>
													<td><input type="text" name="laname"
														value="${lList.laname}"></td>
													<td><input type="text" name="laaddr"
														value="${lList.laaddr}"></td>
													<td><button type="button" style="margin: 5px 0;"
															onclick="modifyBtn()" class="site-btn">수정</button>
														<button class="site-btn"  style="margin: 5px 0;"
															onclick="deleteBtn('${lList.lacode}')">삭제</button></td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="5"><textarea cols="100" rows="10" name="laintro">${lList.laintro}</textarea></td>
												</tr>
												<tr>
													<td colspan="5"><input type="file" name="laphoto">${lList.lafilename}</td>
												</tr>
											</tfoot>
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
<script>
	function modifyBtn() {
		alert('수정되었습니다.');
		modifyForm.submit();
	}
	function deleteBtn(lacode) {
		alert('삭제되었습니다.');
		location.href = 'landmarkDelete?lacode=' + lacode;
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