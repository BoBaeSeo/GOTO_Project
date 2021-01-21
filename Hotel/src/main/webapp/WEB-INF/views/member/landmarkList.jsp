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
                        <h2>Landmark List</h2>
                        <div class="breadcrumb-option">
                            <i class="fa fa-home"></i>유명 관광지 찾기
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- 좌측 사이드바 -->

<section class="property-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="property-sidebar">
                        <h4>유명한 랜드마크 찾기</h4>
                        <form action="searchingLandmark" class="sidebar-search">
                            <select name="la_ctcode">
                                <option value="#">찾고 있는 지역 선택</option>
                                <option value="CT001">서울</option>
                                <option value="CT002">부산</option>
                                <option value="CT003">제주</option>
                                <option value="CT004">여수</option>
                                <option value="CT005">경주</option>
                            </select>
                            <button type="submit" class="search-btn">관광지 탐색</button>
                        </form>
                        
                    </div>
                </div>
                <div class="col-lg-9">
                    <h4 class="property-title fa fa-arrows"> 랜드마크 찾아보기 </h4>
                    <div class="property-list">
                        
                            
                             <c:forEach  var="LList" items="${landmarkList}">

                       	 <div class="single-property-item">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="property-pic">
                                        <img src="resources/img/landmarkFile/${LList.lafilename}" alt="">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="property-text">
                                        <h5 class="r-title">${LList.laname }</h5>
                                        <div class="properties-location"><i class="icon_pin"></i>${LList.laaddr }</div>
                                        <p>${LList.laintro }</p>
                                    </div>
                                </div>
                            </div>
                            </div>
                                
                                </c:forEach>
                        </div>
                    </div>
                    <div class="property-pagination" style="margin:auto">
            
			
			<c:forEach begin="${pageDTO.startpage}" end="${pageDTO.endpage}" step="1" var="pageNum">
																			<!-- step 씩 증가하는 pageNum -->
			<c:choose>		
			<c:when test="${pageNum == pageDTO.page}">	
				<a href="#">${pageNum}</a>
			</c:when>
			<c:otherwise>	
				<a href="landmarkList?page=${pageNum}">${pageNum}</a>
			</c:otherwise>
			</c:choose>	
			</c:forEach>
					</div>
            </div>
        </div>
    </section>
<script type="text/javascript">

function danger() {
	console.log("서울");
}

</script>



<%@ include file="../includes/footer.jsp"%>