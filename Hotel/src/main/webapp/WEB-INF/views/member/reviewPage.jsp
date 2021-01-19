<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<style>
.property-pagination a{
 display:contents 
}
</style>
<body>
<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>My Page</h2>
                        <div class="breadcrumb-option">
                            <a href="home"><i class="fa fa-home"></i> Home</a>
                            <a href="myPage"><i class="fa fa-home"></i> my page</a>
                            <span>my review</span>
                        </div>
                         
                    </div>
                </div>
            </div>
        </div>
    </section>
     <section class="property-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="property-sidebar">
             
                        <form action="#" class="sidebar-search">
                           <ul>
                                <li><i class="fa fa-caret-right"></i> <a href="#">회원정보보기</a></li><br>
                                <li><i class="fa fa-caret-right"></i> <a href="#">내가 예약한 목록</a></li><br>
                                <li><i class="fa fa-caret-right"></i> <a href="#">찜 목록</a></li><br>
                                <li><i class="fa fa-caret-right"></i> <a href="reviewList">나의 후기</a></li><br>
                                <li><i class="fa fa-caret-right"></i> <a href="#">회원 탈퇴</a></li><br>
                            </ul>
                        </form>
                        </div>
                </div>
                
                <div class="col-lg-9">
                    <h4 class="property-title">후기 목록</h4>
                    <div class="property-list">
                    
                    <c:forEach var="rList" items="${reviewList }">
                        <div class="single-property-item">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="property-text">
                                        <h5><a href = "roomList">${rList.honame }<a></h5>
                                        <p>${rList.vcontent }<p>
                                         <div class="top-nav" style="background-color:white;">
						<div class="col-lg-5">
                        <div class="top-right" style="margin: 25px 0;">
                        	<button onclick="location.href='reviewDelete?vcode=${rList.vcode}'" class="property-sub"style="margin: 0 10px;">삭제</button>
                        </div>
                    </div>
  						 </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                  </c:forEach>     
                        
                    </div>
                    <div class="property-pagination">
                     <c:choose>  
                    <c:when test="${pageDTO.page<=1 }">
                        <a href="#" class="page-link">[이전]</a> 
                    </c:when>
                    <c:when test="${pageDTO.page>1 }">
                        <a href="reviewPage?page=${pageDTO.page-1 }">[이전]</a> 
                    </c:when>
                    </c:choose>
                    <c:forEach var="pageNum" begin="${pageDTO.startpage}" end="${pageDTO.endpage}" step="1">
                        <c:choose>
                            <c:when test="${pageNum == pageDTO.page }">
                                <a href="#" class="page-link">${pageNum }</a>
                            </c:when>
                            <c:otherwise>
                                <a href="reviewPage?page=${pageNum }" >${pageNum }</a> 
                            </c:otherwise>
                        </c:choose>
                        </c:forEach>
                    <c:choose>
                    <c:when test="${pageDTO.page < pageDTO.maxpage }">
                        <a href="reviewPage?page=${pageDTO.page+1 }">[다음]</a> 
                    </c:when>
                    <c:when test="${pageDTO.page >= pageDTO.maxpage }">
                        <a href="#" class="page-link">[다음]</a> 
                    </c:when>
                    </c:choose>
              
                    </div>
                </div>
                
                
                
                
                
                </div>
            </div>
    </section>
         
    
</body>






<%@ include file="../includes/footer.jsp"%>