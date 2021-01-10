<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a_memberList</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
<style type="text/css">
	table, tr, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<td>지역코드</td>
			<td>업체이름</td>
			<td>호텔코드</td>
			<td>호텔이름</td>
			<td>호텔평점</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="list" items="${hotelList }">
			<tr id="hotel${list.hocode }">
				<td>${list.ho_ctcode }</td>
				<td>${list.ho_cid }</td>
				<td>${list.hocode }</td>
				<td>${list.honame }</td>
				<td>${list.hoscore }</td>
				<td><button onclick="hotelDelete('${list.hocode}')">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
	<a href="a_approveJoin">업체 회원가입 승인</a>
	<a href="test">test</a>
</body>
<script type="text/javascript">
	function hotelDelete(hocode){
		var cmPw = '${password}';
		var newPw = prompt('비밀번호를 입력하세요');
		/* 비밀번호 확인 작업 */
		if(cmPw == newPw){
			/* 비밀번호가 일치하다면 hotel delete */
			$.ajax({
				type: 'post',
				url: 'deleteHotel',
				data: {
					'hocode' : hocode,
				},
				dataType: 'text',
				success: function(result){
					if(result == 'OK'){
						$("#hotel"+hocode).remove();
					}
				},
				error: function(){
					console.log('hotel 삭제 연결 실패')
				}
			})
		}
	}
</script>
</html>