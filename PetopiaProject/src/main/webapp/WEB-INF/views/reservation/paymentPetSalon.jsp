<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미용 페이지</title>
   <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
         
            <form action="payment3.ps" method="post" >
         
               <div id="reservation-info">
                  <h4> * 예약 정보</h4>
                  <ul style="list-style:none;">
                     <li>날짜/시간  : ${r.checkIn} / ${r.reservationTime}</li>
                     <li>마이펫 :  ${pet.petName}</li>
                     <li>담당자 : 박미용 </li>
                     <li>예약자  : <input value="${loginMember.memberName}" name=""></li>
                     <li>연락처  : <input value="${loginMember.phone}" name="phone"></li>
                  </ul>
               </div>
            
               <br>
            
               <div id="coupon-point">
                  <h4> * 쿠폰 / 적립금</h4>
            
                  <div id="coupon-area">
                     쿠폰
                     <select id="coupon">
                        <option value="0" value1="0"> 사용 가능 쿠폰 ${avaCouponCount}장 / 보유 ${couponCount}장 </option>
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
               
                  <br>
               
                  <div id="point-area">
                     적립금 
                     <input type="text" id="point" name="point" value="0" min="0" max="${point}"> 
                     <br>
                     <small>보유 적립금 : <span id="left-point">${point}</span>p</small>
                  </div>
                     
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
                  <b> 최종 결제금액 : <span id="totalPayment">${totalFee}</span> 원 </b> <br>
                  
                  <hr style="width: 95%;">
                  
                  보유 펫페이 : <span>${petPay}</span> 원 
                  
                  <button type="button" data-toggle="modal" data-target="#chargePetpay">충전</button>

               </div>

               <br>

               <div align="center">
                  <button type="submit" onclick="payment();">결제</button>
               </div>

            </form>
            
            <br>
         </div>

      </div>
      

      
      <!-- 펫페이 충전 시 보여질 Modal -->
       <div class="modal fade" id="chargePetpay">
           <div class="modal-dialog modal-sm">
               <div class="modal-content">
   
                   <!-- Modal Header -->
                   <div class="modal-header">
                       <h3 class="modal-title">펫페이 충전</h3>
                       <button type="button" class="close" data-dismiss="modal">&times;</button>
                   </div>
                        <form action="insertChargePetpay.me" method="post" id="sign-form">
   
                       <!-- Modal body -->
                       <div class="modal-body">   
                          <h5>펫페이 충전</h5>
                      <h6>1천원 단위로 충전이 가능합니다.</h6><br>
                      
                         <input type="number" name="petpayAmount" id="petpayAmount" max="1000000" required>  원
                         <input type="hidden" name="memberNo" id="memberNo" value="${ loginMember.memberNo }">
                         
                         <div id="alertPetpay"></div>
                         <div id="overPetpay"></div>
                           
                         <br>
                         <div>
                            <a class="btn btn-light" onclick="plusPay(1);">1만</a>
                            <a class="btn btn-light" onclick="plusPay(3);">3만</a>
                            <a class="btn btn-light" onclick="plusPay(5);">5만</a>
                            <a class="btn btn-light" onclick="plusPay(10);">10만</a>
                         </div>
                         
                         <br>
                          
                         <h6>출금 계좌 : ${ loginMember.bank }은행  ${ loginMember.account }</h6>
                         
                         <br>
                         
                         <a href="">계좌 수정하기</a>
                         
                       </div>
                       <!-- Modal footer -->
                       <div class="modal-footer" align="center">
                           <button type="submit" id="chargePetpayBtn" class="btn btn-danger">충전하기</button>
                           <button type="reset" class="btn btn-danger">초기화</button>
                       </div>
                   </form>
               </div>
           </div>
       </div>

      <!-- 쿠폰 및 적립금 사용 -->
      <script>
      
         const totalFee = ${totalFee};   // 원 결제금액  numberType
         const point = ${point};         // 보유 적립금 numberType
         
         var inputPoint = 0;         // 입력 적립금
         var couponType = 0;   // 쿠폰 타입
         var discount = 0;   // 할인률 또는 할인금액

         var finalTotalFee = ${totalFee};   // 할인 적용 후  최종 결제 금액 할인 안 받은 경우에는 원결제금액과 동일함

         // 쿠폰 선택 시 
         $('#coupon').on('change', () => {
            useCoupon();
         });
         
         // 포인트 입력 시
         $('#point').on('keyup', () => {
            usePoint();
         });

         // 쿠폰 함수 
         useCoupon = () => {
            
            couponType = Number($('#coupon > option:selected').attr("value"));   //쿠폰 타입  1, 2, 0 
            discount = Number( $('#coupon > option:selected').attr("value1"));   // 할인금액 또는 할인 율    // 1000, 20

            calculate();
            
         };

         // 적립금 선택 
         usePoint = () => {
            
            inputPoint = $('#point').val();      // 입력한 적립금
            
            if(inputPoint == ''){
               // 1.  입력한 값이 빈문자열인 경우
               
               inputPoint = 0;
               
               // 만약에 이전에 적립금을 입력한 상태에서
               // 지워서 빈문자열이 입력된 경우라면 
               // 다시 refresh
               
               $('#usedPoint').text(0);
               $('#totalPayment').text(totalFee);
               $('#left-point').text(point);
               
            }else if ( isNaN(inputPoint) ){
               // 2. 입력값이 숫자가 아닌 문자인 경우
               
               inputPoint = 0;
               
               alert('숫자를입력해주세요');
               $('#point').val(0);
               $('#left-point').text(point);
               
               
            }else if (point < inputPoint){
               // 3. 보유 적립금 < 입력 적립금
               
               inputPoint = 0;
               
               alert('적립금은 최대 ' + point + 'p까지 입력 가능합니다');
               
               // 모든 값 refresh
               $('#point').val(0);
               $('#usedPoint').text(0);
               $('#left-point').text(point);

            }
            
            calculate();
            
         };
         
         // 쿠폰 , 적립금 적용시 사용하는 calculate ajax
         calculate = () => {
            
            $.ajax({
               url : 'calculate.ps',
               type : 'post',
               data : {
                  totalFee : totalFee,
                  couponType : couponType,
                  discount : discount,
                  inputPoint : inputPoint
               },
               success : result => {
                  
                  $('#usedCoupon').text(result[0]);
                  $('#usedPoint').text(result[1]);
                  $('#left-point').text(point -  result[1]);
                  
                  finalTotalFee = result[2];
                  $('#totalPayment').text(finalTotalFee);
                  
               },
               error : () => {
                  console.log('AJAX통신 성공할줄 알았냐?? 케케케케켘');
               }
            });
            
         }
         
         // 결제 
         payment = () => {
            
            var petPay = ${petPay};
            
            console.log(' 보유 펫페이 : '+ petPay)
            console.log('최종 결제 금액 : '  + finalTotalFee);
            
            var result = confirm('결제하시겠습니까?');
            
            if(result == true){
               
               if( petPay < finalTotalFee ){
                  alert('결제 금액이 부족합니다. 페이 충전 후 결제해주세요');
                  return false;
               }
               
            }else{
               
               alert('결제를 취소하였습니다.');
               
            }
            
            
         }
         
         

         
            
            
      </script>
         
         
      
      <div id="main_right"></div>
      
      <jsp:include page="../common/footer.jsp"/>
      

   </div>
   

</body>
</html>