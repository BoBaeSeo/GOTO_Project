<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<!-- main 시작 -->
<!-- main top 시작-->
<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>관광지 리스트</h2>
					<div class="breadcrumb-option">
						<span>LandmarkList</span>
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
											<c:choose>
												<c:when test="${sessionScope.ALoginId=='ADMIN' }">
													<c:forEach var="lList" items="${landmarkList}">
														<tr>
															<td>${lList.lacode}</td>
															<td>${lList.la_ctcode}</td>
															<td>${lList.laname}</td>
															<td>${lList.laaddr}</td>
															<td><button class="site-btn"
																	onclick="deleteBtn('${lList.lacode}')">삭제</button>
																<button class="site-btn"
																	onclick="location.href='landmarkModifyForm?lacode=${lList.lacode}'">수정</button></td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
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
</div>
<!-- main 끝 -->

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

				var modalLacode = '${modallacode}';
				var msg = '${msg}';
				checkModal(modalBno);

				function checkModal(modalLacode) {
					if (modalRecode === '') {
						return;
					}
					if (parseInt(modalLacode) > 0) {
						/* if(deleteCheck == 'del'){
							$(".modal-body").text("게시글 " +parseInt(modalBno) +" 번이 삭제되었습니다." )
						}else{
							$(".modal-body").text("게시글 " +parseInt(modalBno) +" 번이 등록되었습니다." )
						} */
						$(".modal-body").text(
								"게시글 " + parseInt(modalRecode) + " 개가 " + msg
										+ " 되었습니다.")
					}

					$("#laModifyModal").modal("show");
				}
			});
	function deleteBtn(lacode){
		alert('삭제되었습니다.');
		location.href='landmarkDelete?lacode='+lacode;
		}
</script>