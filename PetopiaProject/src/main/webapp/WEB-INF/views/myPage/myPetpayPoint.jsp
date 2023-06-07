<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	#main_center_right_top{
		height: 30%;
		padding-top: 30px;
	}
	#main_center_right_top>div{
		margin: auto;
		text-align: center;
	}
	#main_center_right_bottom{
		height:70%;
	}
	#myBoardList{
		border: 1px solid black;
		height: 100px;
		width: 400px;
		margin: auto;
		text-align: center;
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
				<div id="main_center_right_top">
					<div>
						<div>
						</div>
						<div>
						
						</div>
					
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