<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>

<style>
#modify-2, #reset, #password-text {
	display: none;
}

.accordion_one .panel-group {
	margin-bottom: 0;
	border: 1px solid #f1f1f1;
	margin-left: 1px
}

.accordion_one .panel {
	background-color: transparent;
	box-shadow: none;
	border-bottom: 0px solid transparent;
	border-radius: 0;
	margin: 0
}

.accordion_one .panel-default {
	border: 0
}

.accordion_one .panel-default>.panel-heading {
	border-radius: 0px
}

.panel-title {
	margin-top: 0;
	margin-bottom: 0;
	font-size: 16px;
	color: inherit
}

h4 {
	font-size: 18px;
	line-height: 24px
}

.accordion_one .panel .panel-heading a.collapsed {
	color: #999999;
	display: block;
	padding: 12px 30px;
	border-top: 0px
}

.accordion_one .panel .panel-heading a {
	display: block;
	padding: 12px 30px;
	background: #fff;
	color: #313131;
	border-bottom: 1px solid #f1f1f1
}

.accordion-wrap .panel .panel-heading a {
	font-size: 14px
}

.accordion_one .panel-group .panel-heading+.panel-collapse>.panel-body {
	border-top: 0;
	padding-top: 0;
	padding: 25px 30px 30px 35px;
	background: #fff;
	color: #999999
}

.img-accordion {
	width: 81px;
	float: left;
	margin-right: 15px;
	display: block
}

.accordion_one .panel .panel-heading a:after {
	content: "\2212"
}

.accordion_one .panel .panel-heading a:after, .accordion_one .panel .panel-heading a.collapsed:after
	{
	font-family: 'FontAwesome';
	font-size: 15px;
	width: 36px;
	height: 48px;
	line-height: 48px;
	text-align: center;
	background: #F1F1F1;
	float: left;
	margin-left: -31px;
	margin-top: -12px;
	margin-right: 15px
}

a:link {
	text-decoration: none
}

.btn-none {
    background-color: transparent;
    border: 0;
    text-align: left;
    padding-left: 0;
    width: 100%;
}
</style>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>MyPage</h2>
					<div class="breadcrumb-option">
						<a href="index"><i class="fa fa-home"></i> Home</a>
						<span>내 정보</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section Begin -->

<!-- Property Section Begin -->
<section class="property-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="property-sidebar">
					<div class="best-agents">
						<h4>MyPage</h4>
						<a href="c_mypage?mid=${sessionScope.MLoginId }" class="ba-item">
							<div class="ba-text">
								<h5>내 정보</h5>
								<span>#</span>
							</div>
						</a> <a href="c_myBookingList" class="ba-item">
							<div class="ba-text">
								<h5>내 예약 목록</h5>
								<span>#</span>
							</div>
						</a> <a href="heartList" class="ba-item">
							<div class="ba-text">
								<h5>찜 목록</h5>
								<span>#</span>
							</div>
						</a> <a href="reviewPage" class="ba-item">
							<div class="ba-text">
								<h5>나의 후기</h5>
								<span>#</span>
							</div>
						</a>
						<button
							onclick="delMember('${memberDTO.mcode }','${memberDTO.mid }')"
							class="ba-item btn-none">
							<div class="ba-text">
								<h5>회원 탈퇴</h5>
								<span>#</span>
							</div>
						</button>
					</div>
				</div>
			</div>
			<!-- 사이드 메뉴 끝 -->

			<div class="col-lg-9">
				<h4 class="property-title">내 정보</h4>
				<div class="property-list">
					<div class="single-property-item">
						<div class="row">
							<div class="col-lg-10 accordion_one">
								<div class="panel-group" id="accordion_oneRight">

									<form action="memberModify" method="post" id="myInfo">
										<table class="table-width">
											<tr>
												<td>이름</td>
												<td><input type="text" class="input-table"
													value="${memberDTO.mname }" id="mname" name="mname"
													readonly="readonly"></td>
											</tr>
											<tr>
												<td>아이디</td>
												<td><input type="text" class="input-table"
													value="${memberDTO.mid }" id="mid" name="mid"
													readonly="readonly"></td>
											</tr>
											<tr>
												<td>전화번호</td>
												<td><input type="text" class="input-table"
													value="${memberDTO.mphone }" id="mphone" name="mphone"
													readonly="readonly"></td>
											</tr>
											<tr>
												<td>생일</td>
												<td><input type="date" class="input-table"
													value="${memberDTO.mbirth }" id="mbirth" name="mbirth"
													readonly="readonly"></td>
											</tr>
											<tr>
												<td>이메일</td>
												<td><input type="text" class="input-table"
													value="${memberDTO.memail }" id="memail" name="memail"
													readonly="readonly"></td>
											</tr>
											<tr id="password-text">
												<td><span style="color: #ff0000;">*</span> 회원 비밀번호</td>
												<td><input type="password" class="input-table"
													id="check_password"></td>
											</tr>
											<tr>
												<td colspan="2"><input type="button"
													class="input-table-btn" id="modify-1" value="수정하기"
													onclick="remove_readonly()"> <input type="button"
													class="input-table-btn" id="modify-2" value="수정하기"
													onclick="myInfo_modify()"> <input type="reset"
													class="input-table-btn" id="reset" value="취소"></td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
</section>
<!-- Property Section End -->




<%@ include file="../includes/footer.jsp"%>


<script type="text/javascript">
	function remove_readonly() {
		$('#modify-2').show()
		$('#reset').show()
		$('#password-text').show()
		$('#modify-1').hide()

		$("#mname").removeAttr("readolny")
		$("#mid").removeAttr("readonly")
		$("#mphone").removeAttr("readonly")
		$("#mbirth").removeAttr("readonly")
		$("#memail").removeAttr("readonly")
	}

	function myInfo_modify() {
		var check = $("#check_password").val()
		var member = ${memberDTO.mpassword}
		console.log(check);
		console.log(member);
		if (check == member) {
			myInfo.submit()
		} else {
			alert('비밀번호가 일치하지 않습니다.')
			return;
		}
	}

	$("#reset").click(function() {
		$('#modify-1').show()
		$('#modify-2').hide()
		$('#reset').hide()
		$('#password-text').hide()

		$("#mname").addAttr("readolny")
		$("#mid").addAttr("readonly")
		$("#mphone").addAttr("readonly")
		$("#mbirth").addAttr("readonly")
		$("#memail").addAttr("readonly")
	});

	function delMember(mcode, mid) {
		$.ajax({
			type : 'post',
			url : 'memberDelete',
			data : {
				'mcode' : mcode,
				'mid' : mid
			},
			dataType : 'text',
			success : function(result) {
				console.log(result);
				if (result == 'OK') {
					alert('탈퇴되었습니다.')
					location.href = "/"
				}
			},
			error : function() {
				console.log('member 삭제 연결 실패')
			}
		})
	}
</script>