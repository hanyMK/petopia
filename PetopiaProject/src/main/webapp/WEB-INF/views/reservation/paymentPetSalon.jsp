<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 미용 결제 페이지</title>
<style>
	
	#reservation-payment > div{
	
		
	}

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div id="main">
	
		<div id="main_left"></div>
		
		<div id="main_center">
			<h3>미용 결제</h3>
			
				<div id="reservation-payment">
			
				<h4> * 예약 정보</h4>
				<div id="reservation-info">
					날짜/시간  : ${r.checkIn}  ${r.reservationTime} <br>
					마이펫 :  ${pet.petName} <br>
					담당 : 박미용 <br>
					
					예약자  : <input value="${loginMember.memberName}"> <br>
					연락처  : <input value="${loginMember.phone}"> 
					
				</div>
				
				<br>
				
				<h4> * 쿠폰 / 적립금</h4>
				<div id="coupon-point">
				
					<div id="coupon-area">
						쿠폰 
						<select id="coupon">
							 	<option> 사용 가능 쿠폰 ?장 / 보유 ${couponCount}장 </option>
						</select>
						
						<c:forEach var="c" items="${requestScope.cList}">
							${c.couponName} <br>
						</c:forEach>
						
						${cList}
							 
							 <br><br>
					</div>
					
					<div id="point-area">
						적립금 
						<input name="point" value=""> <br>
						<small>보유적립금 : ${point}p</small>
						<!-- 모두 사용 클릭하면 적립금에 내가 보유한 적립금이 모두 출력되고  버튼 클릭이 사용 안 함으로 바꿈 -->
						<button>모두 사용</button>
					</div>
				</div>
				
				<br>
				
				<h4> * 결제 </h4>
				<div id="payment-info">
					총 예약결제금액 
				
				</div>
			
			
			
			</div>
		</div>
			
		
		<div id="main_right"></div>
		

	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>