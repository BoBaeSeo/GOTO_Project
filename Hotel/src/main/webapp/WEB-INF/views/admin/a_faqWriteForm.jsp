<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>


<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>자주 묻는 질문 작성폼</h2>
					<div class="breadcrumb-option">
						<span>a_faqWriteForm</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main top 끝 -->

	<!-- Contact Section Begin -->
	<section class="property-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="card shadow">
						<div class="card-body">
								<form action="faqWriteForm" class="contact-form" method="post" id="insertForm">

									<!-- 고객센터 코드 선택 -->
									<div class="row">
										<div class="col-lg-6">
											<div class="section-title">
												<select name="faq_qccode">
													<option value="카테고리 선택">카테고리 선택</option>
													<option value="QC001">예약관련</option>
													<option value="QC002">취소관련</option>
													<option value="QC003">할인관련</option>
												</select>
											</div>
										</div>
									</div>
									<hr>

									<!-- 질문제목 -->
									<div class="ba-text">
										<label class="breadcrumb-text" for="faqtitle">문의 제목</label> <input
											type="text" id="faqtitle" name="faqtitle">
									</div>

									<!-- 질문내용 답변 -->
									<div class="ba-text">
										<label class="breadcrumb-text" for="faqcontent">문의 답변</label>
										<textarea rows="8" class="card-body form-control"
											id="faqcontent" name="faqcontent"></textarea>
									</div>

									<!-- 등록 버튼 -->
									<hr>
									<div class="col-lg-12">
										<div class="loadmore">
											<button type="button" onclick="insertFormBtn()" class="btn site-btn">등록하기</button>
										</div>
									</div>
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- Contact Section End -->
	</body>
	<script>
		function insertFormBtn(){
			alert('등록되었습니다.');
			insertForm.submit();
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