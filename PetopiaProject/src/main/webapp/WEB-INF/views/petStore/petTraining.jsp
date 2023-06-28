<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 애견 훈련 메인 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
   
   #petHotel{
      border : 1px solid black;
      width : 60%;
      margin : auto;
      padding-bottom : 20px;
      padding-left : 20px;
   }

</style>

</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div id="main">
	
		<div id="main_left"></div>
		
		<div id="main_center">
		
		<h3 align="center"> petopia 애견 훈련 </h3>
			
			<!-- 애견 훈련 콘텐츠 시작 -->
			<div id="wrap">
			
				<h4 align="center">* 애견 훈련  * </h4>
			
				<div id="petTraining">
					${petTraining.petStoreName} <br>
					위치 : ${petTraining.petStoreAddress} <br>
					${petTraining.openTime} - ${petTraining.closeTime} <br>
					정기 휴무일 : ${petTraining.offDay} <br>
					☎ ${petTraining.petStoreCall} <br>
					${petTraining.petStoreInfo} <br>
					기본금액 : ${petTraining.usageFee} <br>
					
					<br>
					
					<a href="reservation4.ps" style="color:lightgray;">예약</a>
					
					<br><br>
					
				</div>
			
			</div>
			<!-- 애견 호텔 콘텐츠 끝 -->
			
		</div>
		
		<div id="main_right"></div>
		
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>