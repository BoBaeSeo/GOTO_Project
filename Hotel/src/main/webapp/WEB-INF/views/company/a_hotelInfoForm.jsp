<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>


<!-- 주소 -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/resources/js/addr.js"></script>
	
	
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
                                <form action="hotelInfoForm" class="contact-form" method="post" enctype="multipart/form-data">
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
                                        <input type="text" id="honame" name="honame">
                                    </div>
                                    
                                    <!-- 주소 -->
                                    <div class="row">
                                    	<div class="col-lg-6">
                                        	<label class="breadcrumb-text">주소</label>
                                        	<input type="text" id="sample6_postcode" name="hopost" placeholder="우편번호">
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
                                        <textarea rows="8" class="card-body form-control" name="hopublicize"></textarea>
                                    </div>
                                    
                                    <hr>
                                    <!-- 정보들 입력 -->
                                    <!-- 와이파이 -->
                                    <div class="row">
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text">와이파이</label>
                                    		<input type="text" id="inwifi" name="inwifi">
                               			</div>
                               			
                               			<!-- 조식 -->
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text">조식여부</label>
                                    		<input type="text" id="inbreak" name="inbreak">
                                		</div>
                                		
                                		<!-- 주차장 -->
                                		<div class="col-lg-4">
                                			<label class="breadcrumb-text">주차장</label>
                                    		<input type="text" id="inparking" name="inparking">
                                		</div>
                            		</div>
                            		
                            		<!-- 이른체크인 -->
                                    <div class="row">
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">이른 체크인</label>
                                    		<input type="text" id="incin_early" name="incin_early">
                               			</div>
                               			
                               			<!-- 늦은 체크아웃 -->
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">늦은 체크아웃</label>
                                    		<input type="text" id="incout_late" name="incout_late">
                                		</div>
                            		</div>
                            		
                            		<!-- 체크인 -->
                                    <div class="row">
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">체크인</label>
                                    		<input type="text" id="incin" name="incin">
                               			</div>
                               			
                               			<!-- 체크아웃 -->
                                		<div class="col-lg-6">
                                			<label class="breadcrumb-text">체크아웃</label>
                                    		<input type="text" id="incout" name="incout">
                                		</div>
                            		</div>
                            		
                            		<!-- 그외 세부내용 -->
                                	<div class="ba-text">
                                        <label class="breadcrumb-text">그 외 세부내용</label>
                                        <textarea rows="8" class="card-body form-control" name="indetail"></textarea>
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
                        					<button type="submit" class="btn site-btn">등록하기</button>
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
    $("#hotel").addClass('active');
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
</script>