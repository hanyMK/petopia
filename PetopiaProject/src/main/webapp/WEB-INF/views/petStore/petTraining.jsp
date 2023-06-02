<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 애견 훈련 메인 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div id="main">
	
		<div id="main_left"></div>
		
		<div id="main_center">
			
			<!-- 애견 훈련 콘텐츠 시작 -->
			<div id="petSalone-content">
			
				<h3> petopia 애견 훈련 </h3>
			
				<div>
					* 애견 호텔 정보 * <br>
					${petTraining.petStoreName} <br>
					${petTraining.petStoreAddress} <br>
					${petTraining.openTime} <br>
					${petTraining.closeTime} <br>
					${petTraining.offDay} <br>
					${petTraining.petStoreCall} <br>
					${petTraining.petStoreInfo} <br>
					${petTraining.usageFee} <br>
					
					<br>
					
					<a href="reservation1.ps" style="color:lightgray;">예약</a>
					
					<br><br>
					
					<hr>
					
					*리뷰 영역*
					
				</div>
			
			</div>
			<!-- 애견 호텔 콘텐츠 끝 -->
			
		</div>
		
		<div id="main_right"></div>
		
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>