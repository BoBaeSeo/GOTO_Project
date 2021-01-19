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
                        <h2>Restaurant List</h2>
                        <div class="breadcrumb-option">
                            지역 주변 맛집 찾기
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
                        <h4>최적의 맛집 찾기</h4>
                        <form action="searchingRestaurant" class="sidebar-search">
                            <select name="re_ctcode">
                                <option value="#">찾고 있는 지역 선택</option>
                                <option value="CT001">서울</option>
                                <option value="CT002">제주</option>
                                <option value="CT003">부산</option>
                                <option value="CT004">여수</option>
                                <option value="CT005">경주</option>
                            </select>
                            <button type="submit" class="search-btn">맛집 탐색</button>
                        </form>
                        
                    </div>
                </div>
                <div class="col-lg-9">
                    <h4 class="property-title fa fa-arrows"> 내 주변 맛집 찾아보기!</h4>
                    <div class="property-list">
 
                             <c:forEach  var="rList" items="${restaurantList}">

                       	 <div class="single-property-item">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="property-text">
                                        <h5 class="r-title">${rList.rename }</h5>
                                        <div class="properties-location"><i class="icon_pin"></i>${rList.readdr }</div>
                                        <p>${rList.reintro }</p>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="property-pic">
                                        <img src="resources/fileUpload/${rList.refilename}" alt="">
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
				<a href="restaurantList?page=${pageNum}">${pageNum}</a>
			</c:otherwise>
			</c:choose>	
			</c:forEach>
					</div>
            </div>
        </div>
    </section>



<%@ include file="../includes/footer.jsp"%>