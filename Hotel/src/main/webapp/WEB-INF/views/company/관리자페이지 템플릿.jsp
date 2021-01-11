<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Azenta Template">
<meta name="keywords" content="Azenta, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>GOTO</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
	crossorigin="anonymous"></script>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<style type="text/css">
table, th, td {
	text-align: center;
}
#grid {
display: grid;
grid-template-columns: 300px 1fr;

}
.property-sidebar{
	display: inline;
	text-align: center;
	display: block;
    padding: 50px;
}

</style>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	
		<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<h2>COMPANY</h2>
						<div class="breadcrumb-option">
							<span>CompanyList</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section Begin -->
	
<div id="grid">
		<div class="container">
					<div class="property-sidebar">
						<div class="best-agents">
							<h4>Help</h4>
							<a href="c_questionList" class="ba-item">
								<div class="ba-text">
									<h5>1대1 문의 목록</h5>
									<span>Q&A</span>
								</div>
							</a> <a href="#" class="ba-item">
								<div class="ba-text">
									<h5>1대1 문의 작성</h5>
									<span>#</span>
								</div>
							</a> <a href="#" class="ba-item">
								<div class="ba-text">
									<h5>자주 묻는 질문</h5>
									<span>#</span>
								</div>
							</a>
					</div>
			</div>
		</div>



	<!-- Property Section Begin -->
	<section class="property-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="property-list">

						<!-- Begin Page Content -->
						<c:choose>
							<c:when test="${sessionScope.ALoginId==ADMIN }">
								<div class="card shadow">
									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-bordered" cellspacing="0">
												<thead>
													<tr>
														<th>코드</th>
														<th>아이디</th>
														<th>이름</th>
														<th>이메일</th>
														<th>삭제</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="cList" items="${companyList }">
														<tr>
															<td>${cList.cmcode }</td>
															<td>${cList.cmid }</td>
															<td><a href="#">${cList.cmname }</a></td>
															<td>${cList.cmemail }</td>
															<td><a class="btn primary-btn"
																style="padding: 5% 10%;"
																href="companyDelete?cmid=${cList.cmid }">삭제</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</section>
	</div>
	<!-- Property Section End -->



	<!-- Js Plugins -->
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/jquery.nice-select.min.js"></script>
	<script src="resources/js/jquery.slicknav.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/main.js"></script>
</body>

</html>