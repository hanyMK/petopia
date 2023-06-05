<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#alram_area_top{
		height: 10%;
		padding-top: 30px;
		padding-bottom: 30px;		
	}
	#alram_area_bottom{
		height:90%;
	}
	#myAlramList{
		border: 1px solid black;
		height: 50px;
		width: 250px;
		margin: auto;
		text-align: center;
		font-size: 12px;
	}
</style>
</head>
<body>
	<div id="alram_area">
		<div id="alram_area_top">
			<div align="center">
				<a href="alramNotice.me?mno=${ loginMember.memberNo }">공지사항</a>
				<a href="alramShipping.me?mno=${ loginMember.memberNo }">상품/배송</a>
				<a href="alramReply.me?mno=${ loginMember.memberNo }">게시글/댓글</a>
				<a href="alramCoupon.me?mno=${ loginMember.memberNo }">쿠폰</a>
			</div>
		</div>
		<div id="alram_area_bottom">
			<c:forEach var="n" items="${ noticeList }" >
				<div id="myAlramList">
					<c:if test="${ n.qnaYN eq 'Y' }" >
						등록하신 1:1문의에 답변이 완료되었습니다.
					</c:if>
				</div><br>
            </c:forEach>	
		</div>
	</div>



</body>
</html>