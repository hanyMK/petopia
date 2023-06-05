<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 애견 미용실 메인 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div id="main">
	
		<div id="main_left"></div>
		
		<div id="main_center">
			
			<!-- 애견 미용 콘텐츠 시작 -->
			<div id="petSalone-content">
			
				<h3> petopia 애견 미용 </h3>
			
				<div id="salon-employee">
				
					<h4>* 애견 미용 정보 * </h4>
					${petSalon.petStoreName} <br>
					${petSalon.petStoreAddress} <br>
					${petSalon.openTime} <br>
					${petSalon.closeTime} <br>
					${petSalon.offDay} <br>
					${petSalon.petStoreCall} <br>
					${petSalon.petStoreInfo} <br>
					${petSalon.usageFee} <br>
					
				</div>
				
				<br>
					
				<a href="reservation1.ps" style="color:lightgray;">예약</a>
				
				<br><br>
				
				<hr>
				
				<div id="salon-review">
					<h4>* 리뷰 영역 *</h4>
					<ul style="list-style:none;">
						<c:forEach var="review" items="${rList}">
							<li>${review.reviewNo}</li>
							<li>미용사 : ${review.employeeName}</li>
							<li>작성자 : ${review.nickName}</li>
							<li>리뷰내용 : ${review.reviewContent}</li>
							<li>작성일자 : ${review.createDate}</li>
							<c:if test="${ not empty review.modifyDate  }">
								<li>수정일자 : ${review.modifyDate}</li>
							</c:if>
							<li>평점 : ${review.rating}</li>
							<br>
						</c:forEach>
					
					</ul>
				</div>
				
			
			</div>
			<!-- 애견 미용 콘텐츠 끝 -->
			
		</div>
		
		<div id="main_right"></div>
		
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>