<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 애견 미용실 메인 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
   
   #salon-employee, #salon-review{
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
			
			<h3 align="center"> petopia 애견 미용</h3>
			
			<!-- 애견 미용 콘텐츠 시작 -->
			<div id="petSalone-content">
			
				<h4 align="center">* 애견 미용 정보 * </h4>
				
				<div id="salon-employee">
				
					${petSalon.petStoreName} <br>
					위치 : ${petSalon.petStoreAddress} <br>
					영업시간 : ${petSalon.openTime} - ${petSalon.closeTime} <br>
					정기 휴무일 : ${petSalon.offDay} <br>
					☎ ${petSalon.petStoreCall} <br>
					${petSalon.petStoreInfo} <br>
					기본금액 : ${petSalon.usageFee} <br>
					
					<br>
					
					<a href="reservation.ps" style="color:lightgray;">예약</a>
					
				</div>
				
				<br>
					
				
				<br><br>
				
				<hr width="80%;">
				
				<h4 align="center">* 리뷰 영역 *</h4>
				<div id="salon-review">
					<ul style="list-style:none;">
						<c:forEach var="review" items="${rList}">
						
							<hr width="95%;">
						
							<!-- <li>${review.reviewNo}</li>  -->
							<li>미용사 : ${review.employeeName}</li>
							<li>작성자 : ${review.nickName}</li>
							<li>리뷰내용 : ${review.reviewContent}</li>
							
							<li>평점
								<c:forEach begin="1" end="${review.rating}">
									★
								</c:forEach>
							</li>
							
							<c:if test="${ not empty review.modifyDate  }">
								<li>수정일자 : ${review.modifyDate}</li>
							</c:if>
							
							<li>${review.createDate}</li>
							
							<hr width="95%;">
							
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