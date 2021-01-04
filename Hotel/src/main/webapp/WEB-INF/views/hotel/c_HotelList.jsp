<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>HotelList</h2>
                        <div class="breadcrumb-option">
                            <a href="#"><i class="fa fa-home"></i> Home</a>
                            <span>HotelList</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Property Section Begin -->
    <section class="property-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="property-sidebar">
                        <h4>예약하기</h4>
                        <form action="c_HotelList" class="sidebar-search" method="post">
                            <div class="first-row">
                            <select name="ctname">
                                <option value="null">지역</option>
                                <option value="서울">서울</option>
                                <option value="부산">부산</option>
                                <option value="제주도">제주도</option>
                            </select>
                            <input type="date" value="${searchData.bcheckin }" name="bcheckin">
                            <input type="date" value="${searchData.bcheckout }" name="bcheckout">
                            <select name="bperson">
                                <option value="">인원</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>
                       	 	</div>
                        	<div class="second-row">
                            <select name="bprice">
                                <option value="">가격</option>
                                <option value="50000">50000이하</option>
                                <option value="100000">100000이하</option>
                                <option value="150000">150000이하</option>
                            </select>
                            <button type="submit" class="search-btn">Search</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-9">
                    <h4 class="property-title">HotelList</h4>
                    <div class="property-list">
                    <c:forEach var="list" items="${hotelList }">
                        <div class="single-property-item">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="property-pic">
                                        <a href="c_RoomList?hocode=${list.hocode }" style="text-decoration: none;"><img src="img/properties/${list.hophoto }.jpg" alt=""></a>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="property-text">
                                        <div class="s-text">평점 : ${list.hoscore }</div>
                                        <h5 class="r-title"><a href="c_RoomList?hocode=${list.hocode }" style="text-decoration: none; color: black;">${list.honame }</a></h5>
                                        <div class="properties-location"><i class="icon_pin"></i>${list.hoaddr }</div>
                                        <p>${list.hopublicize }</p>
                                        <div class="room-price">
                                            <span>가격: </span>
                                            <h5>${list.price } ~</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <c:forEach begin="${pageDTO.startpage }" end="${pageDTO.endpage }" step="1" var="pageNum">
                    <div class="property-pagination">
                    	<c:choose>
                    		<c:when test="${pageNum == pageDTO.page }">
		                        <a href="#" class="active">${pageNum }</a>
                    		</c:when>
                    		<c:otherwise>
		                        <a href="c_HotelList?page=${pageNum }">${pageNum }</a>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
    <!-- Property Section End -->
<%@ include file="../includes/footer.jsp"%> 
