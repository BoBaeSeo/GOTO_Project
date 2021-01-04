<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includes/header.jsp"%>
    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="hero-items owl-carousel">
            <div class="single-hero-item set-bg" data-setbg="resources/img/hero/hero-1.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="hero-text">
                                <p class="room-location"><i class="icon_pin"></i> 9721 Glen Creek Ave. Ballston Spa, NY</p>
                                <h2>Villa 9721 Glen Creek</h2>
                                <div class="room-price">
                                    <span>Start Form:</span>
                                    <p>$3.000.000</p>
                                </div>
                                <ul class="room-features">
                                    <li>
                                        <i class="fa fa-arrows"></i>
                                        <p>5201 sqft</p>
                                    </li>
                                    <li>
                                        <i class="fa fa-bed"></i>
                                        <p>8 Bed Room</p>
                                    </li>
                                    <li>
                                        <i class="fa fa-bath"></i>
                                        <p>7 Baths Bed</p>
                                    </li>
                                    <li>
                                        <i class="fa fa-car"></i>
                                        <p>1 Garage</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single-hero-item set-bg" data-setbg="resources/img/hero/hero-2.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="hero-text">
                                <p class="room-location"><i class="icon_pin"></i> 9721 Glen Creek Ave. Ballston Spa, NY</p>
                                <h2>Villa 9721 Glen Creek</h2>
                                <div class="room-price">
                                    <span>Start Form:</span>
                                    <p>$3.000.000</p>
                                </div>
                                <ul class="room-features">
                                    <li>
                                        <i class="fa fa-arrows"></i>
                                        <p>5201 sqft</p>
                                    </li>
                                    <li>
                                        <i class="fa fa-bed"></i>
                                        <p>8 Bed Room</p>
                                    </li>
                                    <li>
                                        <i class="fa fa-bath"></i>
                                        <p>7 Baths Bed</p>
                                    </li>
                                    <li>
                                        <i class="fa fa-car"></i>
                                        <p>1 Garage</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single-hero-item set-bg" data-setbg="resources/img/hero/hero-3.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="hero-text">
                                <p class="room-location"><i class="icon_pin"></i> 9721 Glen Creek Ave. Ballston Spa, NY</p>
                                <h2>Villa 9721 Glen Creek</h2>
                                <div class="room-price">
                                    <span>Start Form:</span>
                                    <p>$3.000.000</p>
                                </div>
                                <ul class="room-features">
                                    <li>
                                        <i class="fa fa-arrows"></i>
                                        <p>5201 sqft</p>
                                    </li>
                                    <li>
                                        <i class="fa fa-bed"></i>
                                        <p>8 Bed Room</p>
                                    </li>
                                    <li>
                                        <i class="fa fa-bath"></i>
                                        <p>7 Baths Bed</p>
                                    </li>
                                    <li>
                                        <i class="fa fa-car"></i>
                                        <p>1 Garage</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="thumbnail-pic">
            <div class="thumbs owl-carousel">
                <div class="item">
                    <img src="resources/img/hero/dot-1.jpg" alt="">
                </div>
                <div class="item">
                    <img src="resources/img/hero/dot-2.jpg" alt="">
                </div>
                <div class="item">
                    <img src="resources/img/hero/dot-3.jpg" alt="">
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Search Form Section Begin -->
    <div class="search-form">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="search-form-text">
                        <div class="search-text">
                            <i class="fa fa-search"></i>
                            예약하기
                        </div>
                    </div>
                    <form action="c_HotelList" class="filter-form" method="post">
                        <div class="first-row">
                            <select name="ctname">
                                <option value="null">지역</option>
                                <option value="서울">서울</option>
                                <option value="부산">부산</option>
                                <option value="제주도">제주도</option>
                            </select>
                            <input type="date" name="bcheckin">
                            <input type="date" name="bcheckout">
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
                            <div class="price-range-wrap">
                                <div class="price-text"></div>
                            </div>
                            <div class="room-size-range">
                                <div class="price-text"></div>
                            </div>
                            <button type="submit" class="search-btn">Search</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Form Section End -->

    <!-- How It Works Section Begin -->
    <section class="howit-works spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Find Your Dream House</span>
                        <h2>How It Work</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="single-howit-works">
                        <img src="resources/img/howit-works/howit-works-1.png" alt="">
                        <h4>Search & Find Apertment</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-howit-works">
                        <img src="resources/img/howit-works/howit-works-2.png" alt="">
                        <h4>Find Your Room</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-howit-works">
                        <img src="resources/img/howit-works/howit-works-3.png" alt="">
                        <h4>Talk To Agent</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- How It Works Section End -->
<%@ include file="includes/footer.jsp"%> 
