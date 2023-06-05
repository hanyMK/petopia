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
	}
	#alram_area_bottom{
		height:90%;
	}
	#myAlramList{
		border: 1px solid black;
		height: 100px;
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
				<h3>제발 나와라 뿅</h3>
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