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
				<a href="board.me"></a>
				<a href="reply.me"></a>
			</div>
		</div>
		<div id="main_right">
		
		</div>
		
	</div>

   
    <jsp:include page="../common/footer.jsp" />

</body>
</html>