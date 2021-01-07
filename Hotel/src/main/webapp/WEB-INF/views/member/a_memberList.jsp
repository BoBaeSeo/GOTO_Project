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
<div>
	<table>
		<tr>
			<td>회원코드</td>
			<td>회원이름</td>
			<td>회원아이디</td>
			<td>회원이메일</td>
			<td>탈퇴</td>
		</tr>
		<c:forEach var="list" items="${memberList }">
			<tr id="mem${list.mcode }">
				<td>${list.mcode }</td>
				<td>${list.mname }</td>
				<td>${list.mid }</td>
				<td>${list.memail }</td>
				<td><button onclick="memberDelete('${list.mcode}', '${list.mid }')">탈퇴</button></td>
			</tr>
		</c:forEach>
	</table>
	<a href="a_hotelList">업체 호텔리스트 보러가기</a>
</div>
</body>
<script type="text/javascript">
	function memberDelete(mcode, mid){
		$.ajax({
			type: 'post',
			url: 'a_memberDelete',
			data: {
				'mcode': mcode,
				'mid': mid
			},
			dataType: 'text',
			success: function(result){
				console.log(result);
				if(result == 'OK'){
					$("#mem"+mcode).remove();
					alert('탈퇴되었습니다.')
				}
			},
			error: function(){
				console.log('member 삭제 연결 실패')
			}
		})
	}
</script>
</html>