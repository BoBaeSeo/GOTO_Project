<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>

   <!-- Property Details Hero Section Begin -->

    <!-- Property Details Section Begin -->
    <section class="property-details-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="pd-details-text">
                        <div class="property-contactus">
                            <h4 style="text-align: center;">관리자 로그인</h4><br>
                            <div class="row">
                                <div class="col-lg-6 offset-lg-1" style="margin-left: 250px;">
                                    <form action="AdminLogin" id="adminLogin" class="agent-contact-form" method="post">
                                        <input type="text" name="cmid" id="cmid" placeholder="아이디">
                                        <input type="text" name="cmpassword" id="cmpassword" placeholder="비밀번호">
                                        
                                        <button type="button" onclick="ALoginBtn()" class="site-btn">로그인</button>
                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
     <script type="text/javascript">
  function ALoginBtn(){
 	var cmid = $("#cmid").val();
	var cmpassword = $("#cmpassword").val();
	var DBcmid = '${sessionScope.ALoginId}';
	console.log(cmid+":::"+cmpassword+":::"+DBcmid);
	
	if(cmid==''){
		alert("아이디를 입력해야 합니다.");
		$("#cmid").focus();
		return;
	}
	if(cmpassword==''){
		alert("비밀번호를 입력해야 합니다.");
		$("#cmpassword").focus();
		return;
	}
	adminLogin.submit();
	};
	$(document).ready(function(){
		var loginResult = "${loginResult}";
		if(loginResult == "NO"){
			alert('아이디 비밀번호가 일치하지 않습니다.')
			}
		})
    </script>
    

<%@ include file="../includes/footer.jsp"%>
