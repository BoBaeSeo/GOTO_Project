<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp" %>
    
<div class="main">
			<section class="breadcrumb-section">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumb-text">
							<h2>레스토랑 수정 페이지</h2>
							<div class="breadcrumb-option">
								<span>${rList.recode} 유명 맛집 관리</span>
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
												<form action="restaurantModify" method="post" class="contact-form" enctype="multipart/form-data">
													<table class="table table-bordered" cellspacing="0">
														<thead>
															<tr>
																<th>유명 맛집 코드</th>
																<th>도시 코드</th>
																<th>유명 맛집 이름</th>
																<th>주소</th>
																<th>수정과 삭제</th>
															</tr>
														</thead>
														<tbody>
																<tr>
																	<td><input type="text" name="recode" readonly="readonly" value="${rList.recode}"></td>
																	<td><input type="text" name="re_ctcode" readonly="readonly" value="${rList.re_ctcode}"></td>
																	<td><input type="text" name="rename" value="${rList.rename}"></td>
																	<td><input type="text" name="readdr" value="${rList.readdr}"></td>
																	<td><button type="submit" class="site-btn">수정</button>
                                									    <button class="site-btn" onclick="location.href='restaurantDelete?recode=${rList.recode}'">삭제</button></td>
																</tr>
														</tbody>
														<tfoot>
														<tr>
														<td colspan="5"><textarea name="reintro">${rList.reintro}</textarea></td>
														</tr>
														<tr>
														<td colspan="5"><input type="file" name="rephoto">${rList.refilename}</td>
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