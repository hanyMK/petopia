<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>myPage</title>
</head>
<body>

    <jsp:include page="../common/header.jsp" />

    <div id="main">
		<div id="main_left">
		
		</div>
		<div id="main_center">
			<div id="main_center_left">
				<jsp:include page="myPageNavi.jsp" />
			</div>
			<div id="main_center_right">
				<table id="main_center_right_1">
					<tr>
						<td><img src="${ image }"></td>
						<td><mark>${ rating }</mark>${ loginMember.memberName } 님 안녕하세요</td>
					</tr>
					<tr>
						<td>펫페이 : ${ petpay }원</td>
						<td>포인트 : ${ point }원 </td>
						<td>쿠폰 : ${ coupon }개</td>
					</tr>
					<tr>
						<td>예약 중 : ${ rIng }개 / 예약 지남 : ${ rEnd }</td>
						<td>내가 쓴 글 : ${ board }개 / 내가 쓴 댓글 : ${ reply }개</td>
					</tr>
				</table>
			
			</div>
		</div>
		<div id="main_right">
		
		</div>
		
	</div>
	
    <jsp:include page="../common/footer.jsp" />

</body>
</html>