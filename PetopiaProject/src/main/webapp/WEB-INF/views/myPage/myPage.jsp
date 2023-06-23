<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>myPage</title>
<style>
	
	#memberImg {
		width:120px;
		height:120px;
		border-radius:50px;
		margin:10px
	}
	
	#main_center_right_1{
		width:100%;
		height:250px;
	}
	
	#main_area_1, #main_area_2 {
		float:left;
	}
	
	#main_area_1 {
		height:100%;
		width:30%;
		padding-top:25px;
	}
	
	#main_area_2 {
		width:70%;
		height:100%;
		padding-top:55px;
	}
	
	#main_area_2 td{
		padding: 23px 23px;
	}
	
	#myPageSelect a {
		text-decoration: none;
		color: #F6823F;
	}
	
	
	
</style>
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
				<div id="main_center_right_1">
					<div id="main_area_1" align="center">
						<c:choose>
							<c:when test="${ not empty image }">
								<img src="${ image }" id="memberImg">
							</c:when>
							<c:otherwise>
								<img name="upfile" id="memberImg" src="https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male4-256.png">
							</c:otherwise>
						</c:choose>
						<br>
						<mark>${ rating }</mark><br>
						${ loginMember.memberName } 님 안녕하세요
					</div>
					<div id="main_area_2" align="center">
						<table>
							<thead>
								<tr id="myPageSelect">
									<td><a href="myBoard.me">내 게시글</a></td>
									<td><a href="myBoard.me">내 댓글</a></td>
									<td><a href="#">예약 중</a></td>
									<td><a href="#">예약 완료</a></td>
									<td><a href="myPetpayPoint.me?mno=${ loginMember.memberNo }">펫페이</a></td>
									<td><a href="myPetpayPoint.me?mno=${ loginMember.memberNo }">포인트</a></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${ board }개</td>
									<td>${ reply }개</td>
									<td>${ rIng }건</td>
									<td>${ rEnd }건</td>
									<td>${ petpay }원</td>
									<td>${ point }원</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div id="main_right">
		
		</div>
		
	</div>
    <jsp:include page="../common/footer.jsp" />

</body>
</html>