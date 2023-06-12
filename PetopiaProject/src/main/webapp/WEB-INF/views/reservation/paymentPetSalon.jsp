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
							<c:forEach var="c" items="${requestScope.cList}">
								 <option>${c.couponName}</option>
							</c:forEach>
						</select>
						
						<br><br>
						
					</div>
					
					<div id="point-area">
						적립금 
						<input name="point" value="0"> 
						<!-- <button id="usePoint" onclick="usePoint();">사용</button>
						 -->
						
						
						<br>
						
						<small id="left-point">보유 적립금 : ${point} p</small>
						<small><button id="useAll" onclick="useAllBtn();">모두 사용</button></small>
						<!-- 모두 사용 클릭하면 적립금에 내가 보유한 적립금이 모두 출력되고  버튼 클릭이 사용 안 함으로 바꿈 -->
						
					</div>
					
					<script>
						
						function useAllBtn() {
							
							// 보유적립금
							var point = '${point}';
							var btnText = $('button[id=useAll]').text();
							
							if( btnText = '모두 사용'){
								
								console.log('얌');
								
								$('input[name=point]').attr('value',point); 
								
								$('#left-point').text('보유 적립금: ' + 0 +'p');
								$('button[id=useAll]').text('사용 안 함');
								
							}
							
							if( btnText = '사용 안 함' ){
								
								$('input[name=point]').attr('value',0);
								$('#left-point').text('보유 적립금: ' + point +'p');
								$('button[id=useAll]').text('모두 사용');
								
								
							}
							
							
							
							console.log(point);
							console.log(btnText);
							
							/*
							$('input[name=point]').attr('value',point); // 8000포인트가 입력됨
								
							$('#left-point').text('보유적립금: ' + 0 +'p');
							$('button[id=useAll]').text('사용 안 함');
								
								
							if( $('input[name=point]').val() != point ){
								
								
							}else if( $('input[name=point]').val() == point){
									
									$('input[name=point]').attr('value',0);
									$('#left-point').text('보유적립금: ' + point +'p');
									$('button[id=useAll]').text('모두 사용');
									
							}else {
								
								// 사용자가 직접 적립금을 입력한 상태에서 모두 사용 클릭한 경우 
								
								console.log('직접 입력하고나서 모두 사용 누른거지 ?');
								
								console.log($('input[name=point]'))
								
								$('input[name=point]').attr('value',0);
								
								// $('button[id=useAll]').text('사용 안 함');
								
							}
							
						}
						
						function usePoint(){
							
							// 보유적립금
							var point = '${point}';
							
							if( $('input[name=point]').val() != '0' ){
								
								// 사용자가 입력한 적립금
								 $('input[name=point]').val()
								
								var left = point - $('input[name=point]').val();
								
								console.log(left);
								
								$('#left-point').text('보유적립금: ' + left +'p');
								
							}
						}
						
						
						function inputPoint(){
							
							console.log('적립금 입력해써?!');
							
							// 보유적립금
							var point = '${point}';
							
							// 사용자가 입력한 적립금
							 $('input[name=point]').val()
							
							var left = point - $('input[name=point]').val();
							
							console.log(left);
							
							$('#left-point').text('보유적립금: ' + left +'p');
							
							
							
							
						}
						*/
						}
					
					</script>
				
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