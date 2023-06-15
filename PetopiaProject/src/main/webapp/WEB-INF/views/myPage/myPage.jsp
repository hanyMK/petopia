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
						<td>프로필이미지</td>
						<td>vip ${loginMember.memberName } 님 안녕하세요</td>
						<td>펫페이 : 145000원</td>
						<td>포인트 : 5000</td>
					</tr>
					<tr>
						<td>쿠폰 : 5개</td>
						<td>예약내역 : 1개</td>
						<td>내가 쓴 글 : 7 개</td>
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