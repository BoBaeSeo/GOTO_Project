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
			<td>업체아이디</td>
			<td>업체이름</td>
			<td>업체번호</td>
			<td>업체주소</td>
			<td>업체이메일</td>
			<td>승인</td>
			<td>거절</td>
		</tr>
		<c:forEach var="list" items="${companyList }">
			<tr id="com${list.cmcode }">
				<td>${list.cmid }</td>
				<td>${list.cmname }</td>
				<td>${list.cmphone }</td>
				<td>${list.cmaddress }</td>
				<td>${list.cmemail }</td>
				<td><button onclick="comApprove('${list.cmcode}')">승인</button></td>
				<td><button onclick="comDecline('${list.cmcode}')">거절</button></td>
			</tr>
		</c:forEach>
	</table>
	<a href="a_approveJoin">업체 회원가입 승인</a>
</body>
<script type="text/javascript">

	/* 업체 승인 버튼을 누를 경우 */
	function comApprove(cmcode){
			$.ajax({
				type: 'post',
				url: 'comApprove',
				data: {
					'cmcode' : cmcode,
				},
				dataType: 'text',
				success: function(result){
					if(result == 'OK'){
						$("#com"+cmcode).remove();
					}
				},
				error: function(){
					console.log('approve 연결 실패')
				}
			})
	}
	
	/* 업체 거절 버튼을 누를 경우 */
	function comDecline(cmcode){
			$.ajax({
				type: 'post',
				url: 'comDecline',
				data: {
					'cmcode' : cmcode,
				},
				dataType: 'text',
				success: function(result){
					if(result == 'OK'){
						$("#com"+cmcode).remove();
					}
				},
				error: function(){
					console.log('decline 연결 실패')
				}
			})
	}
</script>
</html>