<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미용 페이지</title>
<style>
	
	#reservation-info, #coupon-point, #payment-info {
		border : 1px solid black;
		width : 70%;
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
			<h3 align="center">미용 결제</h3>
			
				<div id="payment-wrap">
			
				<div id="reservation-info">
				<h4> * 예약 정보</h4>
					<ul style="list-style:none;">
						<li>날짜/시간  : ${r.checkIn} / ${r.reservationTime}</li>
						<li>마이펫 :  ${pet.petName}</li>
						<li>담당자 : 박미용 </li>
						<li>예약자  : <input value="${loginMember.memberName}"></li>
						<li>연락처  : <input value="${loginMember.phone}"></li>
					</ul>
				</div>
				
				<br>
				
				<div id="coupon-point">
				<h4> * 쿠폰 / 적립금</h4>
				
					<div id="coupon-area">
						쿠폰 
						<select id="coupon" onchange="selectCoupon();">
							<option> 사용 가능 쿠폰 ${avaCouponCount}장 / 보유 ${couponCount}장 </option>
							<c:forEach var="c" items="${requestScope.cList}">
								<c:choose>
									<c:when test="${c.couponType eq 1}">
										<option value="${c.couponType}" value1="${c.discount}">${c.couponName}(${c.discount}원)</option>
									</c:when>
									<c:otherwise>
										<option value="${c.couponType}" value1="${c.discount}">${c.couponName}(${c.discount}%)</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					
					<!-- 사용자가 쿠폰을 선택하면 실행되는 script -->
					<script>
					
						function selectCoupon(){
							console.log('쿠폰  선택해써');
							
							var couponType = $('#coupon > option:selected').attr("value");
							var discount = $('#coupon > option:selected').attr("value1");
							var totalReservationFee = $('#totalReservationFee').text();
							
							console.log('쿠폰타입은:'+ couponType);
							console.log('할인은:' + discount);
							console.log('현재 총 예약 금액:'+ totalReservationFee);
							
							if( couponType == 1 ){
								// 금액할인 
								$('#usedCoupon').text(discount);							
								$('#totalPayment').text(totalReservationFee - discount - $('input[name=point]').val());
							}else if(couponType == 2){
								// % 할인 
								$('#usedCoupon').text(totalReservationFee * (discount/100));
								$('#totalPayment').text(totalReservationFee - (totalReservationFee * (discount/100)) - $('input[name=point]').val() );
							}else{
								// 쿠폰 선택 안 하면 
								$('#usedCoupon').text(0);
								$('#totalPayment').text(totalReservationFee);
							}
						}
					</script>
					<!-- 사용자가 쿠폰을 선택하면 실행되는 script -->
					
					<br>
					
					<div id="point-area">
						적립금 
						<input name="point" value="0" min="0" max="${point}" onKeyup="usePoint();"> 
						<br>
						<small>보유 적립금 : <span id="left-point">${point}</span>p</small>
						
					</div>
					
					<script>
					
						// 사용자가 적립금을  keyup한 경우
						function usePoint(){
							
							// 적립금 입력 후 쿠폰 선택시엔 둘 다 할인 적용되는데
							// 쿠폰 선택 후 적립금 입력 시에는 둘 다 할인 적용이 안 됨
							
							// 쿠폰을 선택하고 적립금 입력을 한 경우 -> 이미 선택 되어있음
							// 쿠폰을 선택하지 않고 적립금을 입력한 경우
							// 구분해서 코드 작성해야함 
							
							// 쿠폰선택한 상태에서 적립금을 입력
							var couponType = $('#coupon > option:selected').attr("value");
							
							if(couponType == 1){
								
							}else if( couponType == 2)
							
							var usedPoint = $('input[name=point]').val();
							
							if( ! isNaN(Number(usedPoint)) ){
								console.log('숫자');
								
								// 만약 보유한 적립금금보다 더 많이 입력한 경우에는 
								if( usedPoint > ${point} ){
									// 경고창 띄우고
									// 입력창에 입력가능한 최대 적립금 출력해주기
									// 보유 적립금도 바꿔줌
									
									alert('너 어딜 감히 적립금 더쓸라해?');			
									$('input[name=point]').val(${point});
									$('#left-point').text(0);
									
								}else{
									// 올바르게 입력한 경우
									// 입력창에 입력한 적립금 출력해주기
									// 보유 적립금도 바꿔줌
									
									$('input[name=point]').val(usedPoint);
									$('#left-point').text( ${point} - usedPoint);
									
								}
								
	
								console.log($('input[name=point]').val());
								
								// 적립금 사용 text에 입력한 값 뿌려주기
								// 총 결제금액에 입력한 적립금값도 함께 반영
								
								// 쿠폰 선택 한경우에 또 빼줘야함
								
								$('#usedPoint').text($('input[name=point]').val());
								$('#totalPayment').text( $('#totalReservationFee').text() - $('#usedCoupon').val() - $('input[name=point]').val() )
								
								
							}else {
								alert('숫자를입력해주세요');
								$('input[name=point]').val(0);
							}
						}
						
			
					
					</script>
					
				</div>
				
				<br>
				
				<div id="payment-info">
					<h4> * 결제 </h4>
					
					<!-- 미용예약하려는 동물의 무게에 따라 금액이 다르게 측정됨 -->
					<!-- 무게가 10kg이상이면 10000원 추가  -->
					<!-- 펫 나이가 10살이상인 경우 5000원 추가  -->
					기본금액 : <span id="reservationFee">${ r.reservationFee } 원 </span> <br>
					총예약 금액 : 
					<span id="totalReservationFee">
						<c:choose>
							<c:when test="${pet.weight ge 10 && pet.age ge 10}">
								<c:set var="totalFee" value="${ r.reservationFee + 10000 + 5000 }"/>
								<c:out value="${totalFee}"/>
							</c:when>
							<c:when test= "${pet.weight ge 10 }">
								<c:set var="totalFee" value="${ r.reservationFee + 5000 }"/>
								<c:out value="${totalFee}"/>
							</c:when>
							<c:otherwise>
								<c:set var="totalFee" value="${ r.reservationFee }"/>
								<c:out value="${totalFee}"/>
							</c:otherwise>
						</c:choose>
					</span> 
					<br>
					쿠폰 사용 : - <span id="usedCoupon">0</span> 원 <br>
					적립금 사용 : - <span id="usedPoint">0</span> 원 <br>
					총결제금액 : <span id="totalPayment">${totalFee}</span> 원 <br>
					
				</div>
					
					
					
			
			</div>
		</div>
			
		
		<div id="main_right"></div>
		

	</div>
	
	<script>
		/*
		
		// 사용자가 적립금 버튼
						function useAllPoint() {
							
							var input = $('input[name=point]').val();
							console.log('입력 적립금' + input + '일 때 눌렀어');
							
							// 모두 사용 누른 경우 
							if(input == '0'){
								console.log('모두 사용 눌렀어');
								$('input[name=point]').attr('value', ${point});
								$('#left-point').text('보유 적립금 : ' + 0 +'p');
								$('button[id=useAllBtn]').text('사용 안 함');
								
							}else if(input == '${point}'){
							
								// 사용 안 함 누른 경우
								console.log('사용 안 함 눌렀어');
								$('input[name=point]').attr('value',0);
								$('#left-point').text('보유 적립금: ' + ${point} +'p');
								$('button[id=useAllBtn]').text('모두 사용');
								
							}else{
								
								console.log('0도 아니고 8000도 아닐때 오는 창');
								
								console.log($('button[id=useAllBtn]').text());
								
								var $btnText =  $('button[id=useAllBtn]').text();
								console.log($btnText);
								
								if( $btnText == '모두 사용' ){
									
									console.log('여기오냐?')
									console.log($('input[name=point]').val() );
									
									
									$('input[name=point]').removeAttr();
									console.log($('input[name=point]').val() );
									
									$('input[name=point]').val(${point});
									
									$('#left-point').text('보유 적립금 : ' + 0 +'p');
									$('button[id=useAllBtn]').text('사용 안 함');
									
								}
								
								if( $btnText == '사용 안 함' ){
									
									console.log('여기능..');
									
									console.log('사용 안 함 눌렀어');
									
									$('input[name=point]').val(0);
									
									$('#left-point').text('보유적립금: ' + ${point} +'p');
									$('button[id=useAllBtn]').text('모두 사용');
									
								}
								
								
								
							}
							
							
		
		*/
	</script>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>