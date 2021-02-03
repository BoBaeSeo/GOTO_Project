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
					<h2>find Login</h2>
					<div class="breadcrumb-option">아이디 찾기</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="property-section spad">
	<div class="container">
		<div class="row">

			<div class="col-lg-9">
				<h4 class="property-title">아이디 찾기</h4>
				<div class="property-list">
					<div class="col-lg-6">
						<div class="contact-text">
							<form action="#" class="contact-form">
								찾는 이름<input type="text" id="findName"><br> 찾는 전화번호<input
									type="text" id="findNumber">
								<button onclick="findLogin()" class="site-btn">찾기</button>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>


<script type="text/javascript">
	function findLogin() {
		var findname = $("#findName").val();
		var findnumber = $("#findNumber").val();

		console.log("이름 : " + findname);
		console.log("비밀번호 : " + findnumber);
		/* 아이디 찾기 */
		$.ajax({
			type : "post",
			url : "findLogin",
			data : {
				"findname" : findname,
				"findnumber" : findnumber
			},
			async : false,
			dataType : "text",
			success : function(result) {
				alert(result);
				location.href = "MemberLoginForm.jsp";
			},
			error : function() {
				alert(" 연결 실패 ");
			}
		});
	}
</script>

<%@ include file="../includes/footer.jsp"%>