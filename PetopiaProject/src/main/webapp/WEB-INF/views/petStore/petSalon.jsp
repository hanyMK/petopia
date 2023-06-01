<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 애견 미용실</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div style="height:500px;">
	
		<h3> petopia 애견 미용 </h3>
	
		<div>
			* 애견 미용 정보 * <br>
			${petSalon.petStoreName} <br>
			${petSalon.petStoreAddress} <br>
			${petSalon.openTime} <br>
			${petSalon.closeTime} <br>
			${petSalon.offDay} <br>
			${petSalon.petStoreCall} <br>
			${petSalon.petStoreInfo} <br>
			${petSalon.usageFee} <br>
			
			<br>
			
			<a href="reservation.ps" style="color:lightgray;">예약</a>
			
			
			<br><br>
			
			<hr>
			
			*리뷰 영역*
			
		</div>
		
		
	
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>