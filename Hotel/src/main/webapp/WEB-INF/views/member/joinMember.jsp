<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>

<body>
 <section class="contact-section">
                <div class="col-lg-6" style ="margin-left: auto; margin-right: auto;">
                    <div class="row">
                        <div class="col-lg-7 offset-lg-1">
                            <div class="contact-text">
                                <div class="section-title">
                                    <span>일반</span>
                                    <h2>회원가입</h2>
                                </div>
                                <form action="joinMember" class="contact-form" method="post">
                                
                                <div class="ba-text">
                                    <label>이름</label>
                                    <input type="text" id="inputMname" name="mname" placeholder="이름입력">
                                </div>
                                   <div class="ba-text">
                                   <label class="small mb-1" for="inputMid">아이디 <span id="idCheckMsg"></span></label>
                                    <input type="text" id="inputMid" name="mid" placeholder="아이디 입력">
                                  </div>
                                  <div class="row">
                                  <div class="col-lg-6">
                                    <label class="small mb-1" for="inputMpassword">비밀번호 <span id="pwCheckMsg" >  </span></label>
                                    <input type="text" id="inputMpassword" name="mpassword" placeholder="비밀번호 입력">
                                    </div>
                                    <div class="col-lg-6">
                           <label class="small mb-1" for="checkPw">비밀번호 확인 <span id="pwConfirmMsg"></span></label>
                           <input  type="text" class="form-control" id="checkPw" placeholder="비밀번호확인">
                           </div>
                           </div>
                           <div class="ba-text">
                            <label>전화번호</label>
                                    <input type="text" id="inputMphone" name="mphone" placeholder="전화번호 입력">
                                 </div>
                                 <div class="ba-text">
                                     <label>생년월일</label>
                                    <input type="date" id="inputMbirth" name="mbirth" placeholder="생년월일 입력">
                                 </div>
                                     <div class="row">
                                      <div class="col-lg-4">
                                         <label for ="inputMemailId">이메일</label>
                                          <input type="text" placeholder="이메일 입력" id="inputMemailId" name="memailid">
                                        </div>
                                        <div class="form-group col-md-1">
                              <label class="small mb-1" for="inputMemailId"></label>
                              <span class="form-control" style="border: none;"> @</span>
                           </div>
                                      <div class="col-lg-4">
                                         <label>직접입력</label>
                                          <input type="text" placeholder="직접입력" id="memailDomain" name="memaildomain">
                                      </div>
                                      <div class="col-lg-3">
                                         <label>선택</label>
                                         <select id="domainSel" class="nice-select">
                                             <option value="직접입력">직접입력</option>
                                             <option value="naver.com">naver.com</option>
                                             <option value="gmail.com">gmail.com</option>
                                             <option value="daum.net">daum.net</option>
                                          </select>
                                      </div>
                                  </div>
                           <br>
                                    <button type="submit" class="site-btn">회원 가입</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
    </section>


<script type="text/javascript">
   $(document).ready(function(){

      $("#domainSel").change(function(){
         var domain = $("#domainSel").val();
         $("#memailDomain").val(domain);
      });
      
      /* 비밀번호 확인 */
      $("#checkPw").keyup(function(){
         var checkPw = $("#checkPw").val();
         var mpassword = $("#inputMpassword").val();

         if(mpassword ==''){
            alert("비밀번호가 입력되지 않았습니다.");
            $("#checkPw").val("");
            $("#inputMpassword").focus();
            return;
         }
         
         if(checkPw == mpassword){
            $("#pwConfirmMsg").css("color","green").text("비밀번호 일치");
         }else{
            $("#pwConfirmMsg").css("color","red").text("비밀번호 불일치");
         }
      });

      
      /* 아이디 중복 확인 */
      $("#inputMid").keyup(function(){
         var inputMid = $("#inputMid").val();
         $.ajax({
            type : "post",
            url : "idCheck",
            data : {
                  "inputMid":inputMid
                 },
            dataType : "text",
            success : function(result){
               console.log("result:" + result);
               if(result=="OK"){
                  $("#idCheckMsg").css("color","green").text("사용가능한 아이디");
               }else{
                  $("#idCheckMsg").css("color","red").text("사용 불가능한 아이디");
               }
            },
            error : function(){
               alert("idCheck 연결실패");
            }
         });
      });
      });
</script>
</body>
<%@ include file="../includes/footer.jsp"%>