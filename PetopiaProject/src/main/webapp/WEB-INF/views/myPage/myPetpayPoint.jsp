<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<div id="main_center_right_top">
					<div algin="center">
						<a href="#" onclick="myBoardList();"><h6>내가 쓴 게시글</h6></a>
						<a href="#" onclick="myReplyList();"><h6>내가 쓴 댓글</h6></a>
					</div>
				</div>
				<div id="main_center_right_bottom">
					<c:forEach items="${ list }" var="b">
						<div id="myBoardList">
							${ b.category }<br>
							${ b.boardTitle }<br>
							${ b.boardContent }<br>
							${ b.createDate }<br>
						</div><br>
		            </c:forEach>					
				</div>
			</div>
		</div>
		<div id="main_right">
			
		</div>
		
	</div>

</body>
</html>