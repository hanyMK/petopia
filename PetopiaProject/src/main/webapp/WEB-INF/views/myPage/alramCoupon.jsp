<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
			<c:forEach var="r" items="${ replyList }" >
				<div id="myAlramList">
					${ r.category } 게시판 <br>
					${ r.createDate }<br>
					제목 : ${ r.boardTitle }<br>
					댓글 작성자 : ${ r.nickname }<br>
					댓글 : ${ r.replyContent }<br>
				</div><br>
            </c:forEach>	
		</div>
	</div>



</body>
</html>