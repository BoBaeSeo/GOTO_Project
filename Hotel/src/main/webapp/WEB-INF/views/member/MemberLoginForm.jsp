<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	//SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('6de89a1775e81d3bf2eebade3deea3b8');

	// SDK 초기화 여부를 판단합니다.
	console.log(Kakao.isInitialized());
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 안되는부분~~~~~~~~
 로그인창이 db랑비교해서 맞으면 성공 틀리면 실패...안됨 -->


<!-- Property Details Hero Section Begin -->

<!-- Property Details Section Begin -->
<section class="property-details-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-9">
				<div class="pd-details-text">
					<div class="property-contactus">
						<h4 style="text-align: center;">회원 로그인</h4>
						<br>

						<div class="row">
							<div class="col-lg-6 offset-lg-1" style="margin-left: 250px;">

								<form action="MemberLogin" class="agent-contact-form"
									id="memberLogin" method="post">
									<input type="text" name="mid" id="mid" placeholder="아이디">
									<input type="text" name="mpassword" id="mpassword"
										placeholder="비밀번호">

									<button type="button" onclick="MLoginBtn()" class="site-btn">로그인</button>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</section>
<form action="kakaoLogin">
	<a id="kakao-login-btn"></a>
</form>
<script type="text/javascript">
	function MLoginBtn() {
		var mid = $("#mid").val();
		var mpassword = $("#mpassword").val();
		var MLoginId = '${sessionScope.MLoginId}';
		console.log(mid + ":::" + mpassword + ":::" + MLoginId);

		if (mid == '') {
			alert("아이디를 입력해야 합니다.");
			$("#mid").focus();
			return;
		}
		if (mpassword == '') {
			alert("비밀번호를 입력해야 합니다.");
			$("#mpassword").focus();
			return;
		}
		memberLogin.submit();
		
	};

	$(document).ready(function(){
		var loginResult = "${loginResult}";
		if(loginResult == "NO"){
			alert('아이디 비밀번호가 일치하지 않습니다.')
			}
		})
</script>




<script type="text/javascript">
	Kakao.Auth.createLoginButton({
				container : '#kakao-login-btn',
				success : function(authObj) {
					Kakao.API.request({
								url : '/v2/user/me',
								success : function(res) {
									alert(JSON.stringify(res))
								},
								fail : function(error) {
									alert('login success, but failed to request user information: '
											+ JSON.stringify(error))
								},
							})
				},
				fail : function(err) {
					alert('failed to login: ' + JSON.stringify(err))
				},
			})
</script>


<%@ include file="../includes/footer.jsp"%>
