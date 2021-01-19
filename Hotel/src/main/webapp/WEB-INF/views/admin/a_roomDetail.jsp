<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<style>
#sub, #rophoto{
display: none;
}
</style>

<!-- main 시작 -->
<!-- main top 시작-->
<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>관리페이지</h2>
					<div class="breadcrumb-option">
						<span>RoomDetail</span>
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
									<form action="RoomModify" method="post"
										enctype="multipart/form-data">
										<table class="table table-bordered" cellspacing="0">
											<tr>
												<td>호텔코드</td>
												<td><input type="text" value="${roomDTO.ro_hocode }" name="ro_hocode" id="ro_hocode"
													readonly="readonly"></td>
											</tr>
											<tr>
												<td>룸코드</td>
												<td><input type="text" value="${roomDTO.rocode }" name="rocode" id="rocode"
													readonly="readonly"></td>
											</tr>
											<tr>
												<td>룸이름</td>
												<td><input type="text" placeholder="룸 이름" name="roname"
													id="roname" value="${roomDTO.roname }" readonly="readonly"></td>
											</tr>
											<tr>
												<td>룸사진</td>
												<td><input type="file" name="rophoto" id="rophoto">
													<img src="resources\roomFile\${roomDTO.rofilename }"
													alt="등록된 이미지 없음" id="roimg"></td>
											</tr>
											<tr>
												<td>룸 상세정보</td>
												<td><input type="text" placeholder="룸 상세정보"
													name="rodetail" id="rodetail" value="${roomDTO.rodetail }"
													readonly="readonly"></td>
											</tr>
											<tr>
												<td>룸최소인원</td>
												<td><input type="number" name="rominper" id="rominper"
													value="${roomDTO.rominper }" readonly="readonly">명</td>
											</tr>
											<tr>
												<td>룸최대인원</td>
												<td><input type="number" name="romaxper" id="romaxper"
													value="${roomDTO.romaxper }" readonly="readonly">명</td>
											</tr>
											<tr>
												<td>룸가격</td>
												<td><input type="text" placeholder="룸 가격"
													name="roprice" id="roprice" value="${roomDTO.roprice }"
													readonly="readonly"></td>
											</tr>
											<tr>
												<td>방갯수</td>
												<td><input type="number" name="ronum" id="ronum"
													value="${roomDTO.ronum }" readonly="readonly">개</td>
											</tr>
										</table>
										<input type="button" value="방정보 수정" id="btn"
											onclick="remove_readonly_a()"> <input type="submit"
											value="방정보 수정" id="sub">
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
<script type="text/javascript">
	$("#btn").click(function(){
		$('#sub').show()
		$('#btn').hide()
		$('#rophoto').show()
		$('#roimg').hide()
		
		$('#roname').removeAttr("readonly")
		$('#rodetail').removeAttr("readonly")
		$('#rominper').removeAttr("readonly")
		$('#romaxper').removeAttr("readonly")
		$('#roprice').removeAttr("readonly")
		$('#ronum').removeAttr("readonly")

	})
	
	
</script>
</html>