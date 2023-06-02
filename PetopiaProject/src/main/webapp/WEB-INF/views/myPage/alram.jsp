<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="main_center_right">
		<div id="main_center_right_top">
			<div align="center">
				<h3><b>게시글 조회</b></h3>
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



</body>
</html>