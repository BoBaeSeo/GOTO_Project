<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>


<!-- 주소 -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>호텔등록</h2>
					<div class="breadcrumb-option">
						<span>a_hotelInfoForm</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main top 끝 -->

<!-- Contact Section Begin -->
    <section class="contact-section">
        <div class="single-property-item" style="background-color: white;">
            <div class="row">
                <div class="col-lg-7" style="margin-left: auto; margin-right: auto;">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <div class="contact-text">
                                <form action="hotelInfoForm" class="contact-form" method="post" enctype="multipart/form-data" id="insertId">
                                	<!-- 지역 카테고리 코드 선택 -->
                                	<div class="row">
                                    	<div class="col-lg-4">
                                    		<div class="section-title">
                                				<select name="ctname" id="ctname">
                                					<option value="none">지역 선택</option>
                                					<option value="서울">서울</option>
                                					<option value="경주">경주</option>
                                					<option value="부산">부산</option>
                                					<option value="여수">여수</option>
                                					<option value="제주도">제주도</option>
                            					</select>
                                    		</div>
                                    	</div>
                                    	<div class="col-lg-4" style="display: none;" id="ctdivideDiv">
                                    		<div class="section-title">
                                				<select name="ctdivide" id="ctdivide">
                                					<option value="none">지역 선택</option>
                                					<option value="동">동</option>
                                					<option value="서">서</option>
                                					<option value="남">남</option>
                                					<option value="북">북</option>
                            					</select>
                                    		</div>
                                    	</div>
                                    	<div class="col-lg-4" style="display: none;" id="ctboroughDiv">
                                    		<div class="section-title" id="optionId">
                                				<select name="ctborough" id="ctborough">
                                					<option value="none">지역 선택</option>
                                					<!-- <option value="은평구">은평구</option>
                                					<option value="서대문구">서대문구</option>
                                					<option value="종로구">종로구</option>
                                					<option value="중구">중구</option>
                                					<option value="용산구">용산구</option>
                                					<option value="마포구">마포구</option> -->
                            					</select>
                                    		</div>
                                    	</div>
                                    </div>
                                    <hr>
                                    
                                    <!-- 호텔 이름 -->
                                	<div class="ba-text">
                                        <label class="breadcrumb-text">호텔 이름</label>
                                        <input type="text" id="honame" name="honame" required="required">
                                    </div>
                                    
                                    <!-- 주소 -->
                                    <div class="row">
                                    	<div class="col-lg-6">
                                        	<label class="breadcrumb-text">주소</label>
                                        	<input type="text" id="sample6_postcode" name="hopost" placeholder="우편번호" required="required">
                                        </div>
                                        <div class="col-lg-6">
                                        	<label class="breadcrumb-text">우편번호</label>
											<input class="btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										</div>
										<div class="col-lg-10">
											<input type="text" id="sample6_address" name="hoaddress" placeholder="주소">
										</div>
										<div class="col-lg-6">
											<input type="text" id="sample6_detailAddress" name="hodetail" placeholder="상세주소">
										</div>
										<div class="col-lg-6">
											<input type="text" id="sample6_extraAddress" name="hoexaddr" placeholder="참고항목">
										</div>
                                    </div>
                                    
                                    <!-- 호텔홍보내용 -->
                                	<div class="ba-text">
                                        <label class="breadcrumb-text">소개글</label>
                                        <textarea rows="8" class="card-body form-control" name="hopublicize" id="hopublicize"></textarea>
                                    </div>
                                    
                                    <hr>
                                    <!-- 정보들 입력 -->
                                    <!-- 와이파이 -->
                                    <div class="row">
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text">와이파이</label>
                                    		<input type="text" id="inwifi" name="inwifi" required="required">
                               			</div>
                               			
                               			<!-- 조식 -->
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text">조식여부</label>
                                    		<input type="text" id="inbreak" name="inbreak" required="required">
                                		</div>
                                		
                                		<!-- 주차장 -->
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text">주차장</label>
                                    		<input type="text" id="inparking" name="inparking" required="required">
                                		</div>
                            		</div>
                            		
                            		<!-- 이른체크인 -->
                                    <div class="row">
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">이른 체크인</label>
                                    		<input type="text" id="incin_early" name="incin_early" required="required">
                               			</div>
                               			
                               			<!-- 늦은 체크아웃 -->
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">늦은 체크아웃</label>
                                    		<input type="text" id="incout_late" name="incout_late" required="required">
                                		</div>
                            		</div>
                            		
                            		<!-- 체크인 -->
                                    <div class="row">
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">체크인</label>
                                    		<input type="text" id="incin" name="incin" required="required">
                               			</div>
                               			
                               			<!-- 체크아웃 -->
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">체크아웃</label>
                                    		<input type="text" id="incout" name="incout" required="required">
                                		</div>
                            		</div>
                            		
                            		<!-- 그외 세부내용 -->
                                	<div class="ba-text">
                                        <label class="breadcrumb-text">그 외 세부내용</label>
                                        <textarea rows="8" class="card-body form-control" name="indetail" ></textarea>
                                    </div>
                                    
                                    <hr>
                                    <!-- 호텔사진 -->
									<div class="form-row">
										<div class="form-group col-md-6">
											<label class="small mb-1">호텔 사진</label> 
											<input type="file" class="form-control" id="hophoto" name="hophoto"><br>
										</div>
									</div>
                                    
                                    <!-- 등록 버튼 -->
                                    <hr>
                                    <div class="col-lg-12">
                    					<div class="loadmore">
                        					<button type="button" onclick="insertForm()" class="btn site-btn">등록하기</button>
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
            </div>
    <!-- Contact Section End -->

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
$(document).ready(function(){
    $(".active").removeClass('active');
    $("#hotelInsert").addClass('active');
    $("#ctname").change(function(){
		$("#ctdivideDiv").removeAttr("style");
    	})
    $("#ctdivide").change(function(){
        var ctname = $("#ctname").val();
        var ctdivide = $("#ctdivide").val();
        
		$.ajax({
			type : "post",
			url : "getCtborough",
			data : {
				"ctname" : ctname,
				"ctdivide" : ctdivide
				},
			dataType : "json",
			success : function(result) {
				console.log(result);
				showCtborough(result);
				},
				error : function(){
					alert("연결 실패.");
					}
			})
    	})
 })
 
 function showCtborough(result){
	$("#ctboroughDiv").removeAttr("style");
	$("#ctborough").empty();
	$("#optionId .list").empty();
	var output = '<li data-value="none" class="option selected">지역 선택</li>';
	var option = "<option value='none'>지역 선택</option>";
	for(var list in result){
		option += "<option value='"+result[list]+"'>"+result[list]+"</option>";
		output += '<li data-value="'+result[list]+'" class="option selected focus">'+result[list]+'</li>'
		}
		$("#ctborough").append(option);
		$("#optionId .list").append(output);
	 }

	function insertForm(){
		var ctname = $("#ctname").val();
        var ctdivide = $("#ctdivide").val();
		var ctborough = $("#ctborough").val();
		if(ctname == "none" || ctdivide == "none" || ctborough == "none"){
			alert('지역을 선택해주세요');
			return;
			}
		var honame = $("#honame").val();
        var hopost = $("#hopost").val();
		var inwifi = $("#inwifi").val();
		var inbreak = $("#inbreak").val();
		var hopublicize = $("#hopublicize").val();
		var inparking = $("#inparking").val();
		var incin_early =  $("#incin_early").val();
		var incout_late =  $("#incout_late").val();
		var incin =  $("#incin").val();
		var incout =  $("#incout").val();
		if(honame == "" || hopost == "" || inwifi == ""|| inbreak == "" || hopublicize == ""|| inparking == "" || incin_early == ""|| incout_late == "" || incin == ""|| incout == ""){
			alert('작성을 완료해주세요');
			return;
			}
		insertId.submit();
		
		}
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