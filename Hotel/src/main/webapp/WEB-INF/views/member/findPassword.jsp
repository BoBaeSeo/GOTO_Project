<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<!-- 상단 지도 부분 -->
<section class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>find Password</h2>
					<div class="breadcrumb-option">비밀번호 찾기</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="property-section spad">
	<div class="container">
		<div class="row">

			<div class="col-lg-9">
				<h4 class="property-title">비밀번호 찾기</h4>
				<div class="property-list">
					<div class="col-lg-6">
						<div class="contact-text">
							<form action="#" class="contact-form">
								찾는 이름<input type="text" id="findName"><br> 찾는 아이디<input
									type="text" id="findId"><br> 찾는 전화번호<input
									type="text" id="findNumber">
								<button onclick="findPassword()" class="site-btn">찾기</button>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>


<script type="text/javascript">
	function findPassword() {
		var findname = $("#findName").val();
		var findnumber = $("#findNumber").val();
		var findid = $("#findId").val();

		console.log("이름 : " + findname);
		console.log("비밀번호 : " + findnumber);
		console.log("아이디 : " + findid);

		/* 패스워드 찾기 */
		$.ajax({
			type : "post",
			url : "findPassword",
			data : {
				"mname" : findname,
				"mphone" : findnumber,
				"mid" : findid
			},
			dataType : "text",
			async : false,
			success : function(result) {
				alert(result);
			},
			error : function() {
				alert(" 연결 실패 ");
			}
		});
	}
</script>

<%@ include file="../includes/footer.jsp"%>