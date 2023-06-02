<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 애견 유치원 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div id="main">
	
		<div id="main_left"></div>
		
		<div id="main_center">
			
			<!-- 애견 호텔 콘텐츠 시작 -->
			<div id="petSalone-content">
			
				<h3> petopia 애견 유치원 </h3>
			
				<div>
					* 애견 유치원 정보 * <br>
					${petSchool.petStoreName} <br>
					주소 : ${petSchool.petStoreAddress} <br>
					${petSchool.openTime} - ${petSchool.closeTime} <br>
					휴무일 : ${petSchool.offDay} <br>
					전화번호 : ${petSchool.petStoreCall} <br>
					${petSchool.petStoreInfo} <br>
					월 ${petSchool.usageFee}원<br>
					
					<br>
					
					<a href="reservation1.ps" style="color:lightgray;">신청</a>
					
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