<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 상단 지도 부분 -->
<section class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Booking Check</h2>
                        <div class="breadcrumb-option">
                            호텔 예약 체크
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<section class="property-section spad">
        <div class="container">
            <div class="row">
     
                <div class="col-lg-9">
                    <h4 class="property-title">예약 체크</h4>
                    <div class="property-list">


				<div class="col-lg-6">

                            <div class="contact-text">
                                <form action="bookingCheck" class="contact-form" method="post">
                                    <input type="text" id="inputBcode" name="bcode" value="${boCheck.bcode}"><span id="bcodeCheck"></span>
                                    <input type="text" readonly="readonly" value="${mCheck.mname }">
                                    <input type="hidden" name="b_mcode" value="${mCheck.mcode }">
                                    
                                    <input type="text" readonly="readonly" value="${ctCheck.ctname }">
                                    <input type="hidden" name="b_ctcode" value="${ctCheck.ctcode }">
                                    <input type="hidden" name="b_hocode" value="${inCheck.in_hocode}">
                                    
                                    <input type="text" readonly="readonly" value="${hoCheck.honame }">
                                    <input type="text" readonly="readonly" value="${inCheck.inwifi }">
                                    <input type="text" readonly="readonly" value="${inCheck.inbreak }">
                                    체크인<input type="date" name="bcheckin" readonly="readonly" value="${boCheck.bcheckin }">
                                    체크아웃<input type="date" name="bcheckout" readonly="readonly" value="${boCheck.bcheckout }">
                                    <i class="fa fa-car"></i><input type="text" readonly="readonly" value="${inCheck.inparking }">
                                    
                                    <input type="text" readonly="readonly" value="${roCheck.roname }">
                                    <input type="hidden" name="b_rocode" value="${roCheck.rocode }">
                                    <input type="text" readonly="readonly" value="${roCheck.rodetail }">
                                    가격<input type="text" name="bprice" readonly="readonly" value="${roCheck.roprice }">
                                    인원수<input type="number" name="bperson"  max="${roCheck.romaxper }">
									
                                    <textarea name="brequest" placeholder="요청 사항"></textarea>
                                    
                                    <button type="submit" class="site-btn">입력</button>
                                </form>
                            </div>
                        </div>
                        </div>
                    </div>
			
            </div>
        </div>
    </section>
    
<script type="text/javascript">

  $(document).ready(function(){
        
    $("#inputBcode").keyup(function() {
		 var inputBcode = $("#inputBcode").val();
		 $.ajax({
			 type : "post",
			 url : "bcodeCheck",
			 data : {
				 "inputBcode" : inputBcode
				 },
			dataType : "text",
			success : function(result){
				console.log("result: " + result);
				if (result == "OK") {
					$("#bcodeCheck").css("color", "green").text("등록할 수 있는 관광지 이름입니다.");
					 } else {
					$("#bcodeCheck").css("color", "red").text("중복된 이름입니다.");
					}

				},
			error : function() {
				alert("bcodeCheck 연결 실패");
				}


			 });

		 });

</script>
    
    
 <%@ include file="../includes/footer.jsp"%>