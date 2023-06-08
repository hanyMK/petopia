<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	#main_center_right_top{
		height: 10%;
		padding-top: 30px;
	}
	#main_center_right_top>div{
		margin: auto;
		text-align: center;
	}
	#main_center_right_bottom{
		height:90%;
	}
	#myCouponList{
		border: 1px solid black;
		border-radiors: 20px
		height: 100px;
		width: 300px;
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
				</div>
				<div id="main_center_right_bottom">
				
						<div id="myCouponList">
						안녕<br>
							${ b.boardTitle }<br>
							${ b.boardContent }<br>
							${ b.createDate }<br>
						</div><br>
		           				
				</div>
			</div>
		</div>
		<div id="main_right">
			
		</div>
		
	</div>
	
	<script>

	</script>

   
    <jsp:include page="../common/footer.jsp" />

</body>
</html>