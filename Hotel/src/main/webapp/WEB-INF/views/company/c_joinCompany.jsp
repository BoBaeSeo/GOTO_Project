<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>

<!-- 주소 -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../resources/js/addr.js"></script>

    <!-- Contact Section Begin -->
    <section class="contact-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6" style="margin-left: auto; margin-right: auto;">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <div class="contact-text">
                                <div class="section-title">
                                    <span>company</span>
                                    <h2>Sign Up</h2>
                                </div>
                                <form action="companyJoin" class="contact-form" method="post">
                                	<!-- 아이디 -->
                                	<div class="ba-text">
                                        <label class="breadcrumb-text" for="cmid">아이디<span id="cmidCheck"></span></label>
                                        <input type="text" placeholder="아이디 입력" id="cmid" name="cmid" >
                                    </div>
                                    
                                    <!-- 비밀번호 -->
                                    <div class="row">
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text" for="cmpassword">비밀번호<span id="cmpasswordCheck"></span></label>
                                    		<input type="password" placeholder="비밀번호 입력" id="cmpassword" name="cmpassword" >
                               			</div>
                               			<!-- 비밀번호 재입력 -->
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text" for="checkPw">비밀번호 재입력<span id="cmpasswordConFirm"></span></label>
                                        	<input type="password" placeholder="비밀번호 확인" id="checkPw">
                                		</div>
                            		</div>
                                    
                                    <!-- 이름 -->
                                	<div class="ba-text">
                                        <label class="breadcrumb-text" for="cmname">이름</label>
                                        <input type="text" placeholder="이름 입력" id="cmname" name="cmname">
                                    </div>
                                    
                                    <!-- 전화번호 -->
                                	<div class="ba-text">
                                        <label class="breadcrumb-text" for="cmphone">전화번호</label>
                                        <input type="text" placeholder="전화번호 입력" id="cmphone" name="cmphone">
                                    </div>
                                    
                                    <!-- 이메일 -->
                                    <div class="row">
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text" for="cmemail">이메일</label>
                                    		<input type="text" placeholder="이메일 입력" id="cmemail" name="cmmailid">
                               			</div>
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text">직접입력</label>
                                    		<input type="text" placeholder="직접입력" id="cmemailDomain" name="cmdomain">
                                		</div>
                                		<div class="col-lg-3">
                                			<label class="breadcrumb-text">선택</label>
                                			<select id="cmemailSel" class="nice-select">
                                    			<option value="직접입력">직접입력</option>
                                    			<option value="naver.com">naver.com</option>
                                    			<option value="gmail.com">gmail.com</option>
                                    			<option value="daum.net">daum.net</option>
                                    		</select>
                                		</div>
                            		</div>
                                    
                                    <hr>
                                    <!-- 주소 -->
                                    <div class="row">
                                    	<div class="col-lg-6">
                                        	<label class="breadcrumb-text">주소</label>
                                        	<input type="text" id="sample6_postcode" name="cmpost" placeholder="우편번호">
                                        </div>
                                        <div class="col-lg-6">
                                        	<label class="breadcrumb-text">우편번호</label>
											<input class="btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										</div>
										<div class="col-lg-10">
											<input type="text" id="sample6_address" name="cmaddr" placeholder="주소">
										</div>
										<div class="col-lg-6">
											<input type="text" id="sample6_detailAddress" name="cmdetail" placeholder="상세주소">
										</div>
										<div class="col-lg-6">
											<input type="text" id="sample6_extraAddress" name="cmexaddr" placeholder="참고항목">
										</div>
                                    </div>
                                    
                                    <!-- 회원가입 버튼 -->
                                    <hr>
                                    <div class="col-lg-12">
                    					<div class="loadmore">
                        					<button type="submit" class="btn site-btn">가입완료</button>
                    					</div>
                					</div>
                                	</form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
    </section>
    <!-- Contact Section End -->


<script type="text/javascript">

$(document).ready(function(){

	/* 이메일(도메인) 선택을 누르면 입려창에 들어가지게하는 */
	$("#cmemailSel").change(function(){
		var cmemailSel = $("#cmemailSel").val();
		$("#cmemailDomain").val(cmemailSel);
	});


	/* 비밀번호 확인 */
	$("#checkPw").keyup(function(){
		var checkPw = $("#checkPw").val();
		var cmpassword = $("#cmpassword").val();

		if(cmpassword=='') {
			alert("비밀번호가 입력되지 않았습니다.");
			$("#checkPw").val("");
			$("#cmpassword").focus();
			return;
		}
		
		if(checkPw == cmpassword) {
			/* 일치 */
			$("#cmpasswordConFirm").css("color","green").text(" 비밀번호 일치함");
		}else{
			/* 불일치 */
			$("#cmpasswordConFirm").css("color","red").text(" 비밀번호 불일치함");
		}
	});


	/* 아이디 사용가능 여부 확인 */
	$("#cmid").keyup(function(){
		var cmid = $("#cmid").val();
		console.log("cmid::"+cmid);
		$.ajax({
			type : "post",
			url : "cmidCheck",
			data : {
					"cmid":cmid
			},
			dataType : "text",
			success : function(result){
				console.log("result : " + result);
				if(result=="OK"){
					$("#cmidCheck").css("color","green").text(" 사용가능함");
				} else {
					$("#cmidCheck").css("color","red").text(" 사용불가능함");
				}
			},
			error : function(){
				alert("cmidCheck 연결실패.");
			}
		});
	});
	
});

</script>

<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>






<%@ include file="../includes/footer.jsp"%>