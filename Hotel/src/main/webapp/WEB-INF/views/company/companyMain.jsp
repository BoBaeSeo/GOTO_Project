<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<div class="main">
   <section class="breadcrumb-section">
      <div class="row">
         <div class="col-lg-12">
            <div class="breadcrumb-text">
               <h2>관리페이지</h2>
               <div class="breadcrumb-option">
                  <span>CompanyList(jsp이름)</span>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- main top 끝 -->

   <!-- main container 시작 -->
   <section class="property-section spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="property-list">
                  <c:choose>
                     <c:when test="${sessionScope.ALoginId=='ADMIN' }">
                        <div class="card shadow">
                           <div class="card-body">
                              <div class="table-responsive">
                                 <table class="table table-bordered" cellspacing="0">
                                    <thead>
                                       <tr>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="a_memberList" class="primary-btn">회원리스트</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="#" class="primary-btn">업체리스트</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="restaurantForm" class="primary-btn">맛집등록</a><br>
                                                </div>
                                             </div>
                                             </th>
                                             </tr>
                                          <tr>
                                          
                                          
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="adminRestaurantList" class="primary-btn">맛집리스트</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="LandmarkInsertForm" class="primary-btn">관광지등록</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="adminLandmarkList" class="primary-btn">관광지 리스트</a><br>
                                                </div>
                                             </div>
                                          </th>
                                          </tr>
                                       <tr>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="questionList" class="primary-btn">1대1문의 리스트</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="#" class="primary-btn">고객 후기리스트</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="FaqList" class="primary-btn">자주묻는질문 리스트</a>
                                                </div>
                                             </div>
                                          </th>


                                       </tr>
                                    </thead>

                                 </table>
                              </div>
                           </div>
                        </div>
                     </c:when>
                     <c:otherwise>
                        <div class="card shadow">
                           <div class="card-body">
                              <div class="table-responsive">
                                 <table class="table table-bordered" cellspacing="0">
                                    <thead>
                                       <tr>

                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="#" class="primary-btn">호텔등록</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="a_hotelList" class="primary-btn">호텔리스트</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="RoomWriteForm" class="primary-btn">룸등록</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="RoomList" class="primary-btn">룸리스트</a>
                                                </div>
                                             </div>
                                          </th>
                                          <th>
                                             <div class="col-lg-12">
                                                <div class="loadmore">
                                                   <a href="#" class="primary-btn">업체정보수정</a>
                                                </div>
                                             </div>
                                          </th>

                                       </tr>
                                    </thead>

                                 </table>
                              </div>
                           </div>
                        </div>
                     </c:otherwise>
                  </c:choose>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- main container 끝 -->
</div>

<!-- main 끝 -->

</body>

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