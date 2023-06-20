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
							<option selected disabled> 사용 가능 쿠폰 ?장 / 보유 ${couponCount}장 </option>
							<option>사용 안 함</option>
							<c:forEach var="c" items="${requestScope.cList}">
								<c:choose>
									<c:when test="${c.couponType eq 1}">
										<option value="${c.discount}">${c.couponName}(${c.discount}원)</option>
									</c:when>
									<c:otherwise>
										<option value="${c.discount}">${c.couponName}(${c.discount}%)</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					
					<!-- 사용자가 쿠폰을 선택하면 실행되는 script -->
					<script>
					
						function selectCoupon(){
							
							console.log('쿠폰  선택해써');
							
							var discount = $('#coupon').val();
							console.log(discount);
							
							
							if(discount == '사용 안 함'){
								// 쿠폰 사용 안 함 선택한 경우
								console.log('쿠폰 안 쓸고임');
								$('#usedCoupon').text(0);
								
							}else{
								
								// 쿠폰 사용하려고 선택한 경우
								if( discount.length == 4){
									// discount 자체가 할인금액인 경우	
									$('#usedCoupon').text(discount);
									
								}else{
									// %할인인 경우
									$('#usedCoupon').text( ${ r.reservationFee } * (discount/100));
								}
							}
							
						}
						
						
					</script>
					
					<br>
					
					<div id="point-area">
						적립금 
						<input name="point" value="0" min="0" max="${point}" onKeyup="usePoint();"> 
						<br>
						<small id="left-point">보유 적립금 : ${point}p</small>
						<button id="useAllBtn" onclick="useAllPoint();">모두 사용</button>
						<!-- 모두 사용 클릭하면 적립금에 내가 보유한 적립금이 모두 출력되고  버튼 클릭이 사용 안 함으로 바꿈 -->
					</div>
					
					<script>
					
						// 적립금을 쓰기위해 적은 경우
						function usePoint(){
							console.log('적립금 입력해써?');
							console.log($('input[name=point]').val());
							
							$('#usedPoint').text($('input[name=point]').val());
							
							
						}
						
						// '모두 사용' 혹은 '사용 안 함' 버튼을 누른 경우 
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
							
							
						}
					
					</script>
					
				</div>
				
				<br>
				
				<div id="payment-info">
					<h4> * 결제 </h4>
					
					<!-- 미용예약하려는 동물의 무게에 따라 금액이 다르게 측정됨 -->
					<!-- 무게가 10kg이상이면 10000원 추가  -->
					<!-- 펫 나이가 10살이상인 경우 5000원 추가  -->
					기본금액 : ${ r.reservationFee } 원<br>
					총예약 금액 :
					<c:choose>
						<c:when test="${pet.weight ge 10 && pet.age ge 10}">
								${ r.reservationFee + 10000 + 5000 } 원
						</c:when>
						<c:when test= "${pet.weight ge 10 }">
								${ r.reservationFee + 5000 } 원
						</c:when>
						<c:otherwise>
								${ r.reservationFee } 원
						</c:otherwise>
					</c:choose>
					<br>
					쿠폰 사용 : - <span id="usedCoupon">0</span> 원 <br>
					적립금 사용 : - <span id="usedPoint">0</span> 원 <br>
					총결제금액 : 
				</div>
					
					
					
			
			</div>
		</div>
			
		
		<div id="main_right"></div>
		

	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>