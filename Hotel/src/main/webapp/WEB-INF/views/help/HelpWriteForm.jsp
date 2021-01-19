<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<!-- Property Section Begin -->
    <section class="contact-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-3" style="margin-top: 200px;">
				<div class="property-sidebar">
					<div class="best-agents">
						<h4>Help</h4>
						<a href="questionList" class="ba-item">
							<div class="ba-text">
								<h5>1대1 문의 목록</h5>
								<span>Q&A</span>
							</div>
						</a> <a href="HelpWriteForm" class="ba-item">
							<div class="ba-text">
								<h5>1대1 문의 작성</h5>
								<span>#</span>
							</div>
						</a> <a href="/c_FAQList" class="ba-item">
							<div class="ba-text">
								<h5>자주 묻는 질문</h5>
								<span>FAQ</span>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!-- 사이드 메뉴 끝 -->
			
    <!-- Contact Section Begin -->
                        <div class="col-lg-7 offset-lg-1">
                            <div class="contact-text">
                                <div class="section-title">
                                    <span>Help</span>
                                    <h2>1대1 문의 작성 폼</h2>
                                </div>
                                <form action="HelpWrite" class="contact-form">
                                <input type="text" name="hecode" value="HE">
                                <select name="he_qccode">
                                	<option value="QC001">예약관련</option>
                                  	<option value="QC002">취소관련</option>
                                  	<option value="QC003">할인관련</option>
                                </select><br><br><br>
                                    <input type="text" name="hetitle" placeholder="제목">
                                    
                                   <input type="text" name="he_mid" value="${sessionScope.MLoginId }" readonly="readonly">
                                   
                                    <textarea placeholder="내용" name="hecontent"></textarea>
                                    <button type="submit" class="site-btn">보내기</button>
                                </form>
                            </div>
                        </div>
                        </div>
                        </div>
    </section>








<%@ include file="../includes/footer.jsp"%>