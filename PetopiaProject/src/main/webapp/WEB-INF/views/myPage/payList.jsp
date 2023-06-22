<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	#alram_area_top{
		height: 10%;
		padding-top: 30px;
		padding-bottom: 30px;		
	}
	#alram_area_bottom{
		height:90%;
		padding-top:17px;
	}
	#myList{
		border: 1px solid black;
		height: 100px;
		width: 250px;
		margin: auto;
		text-align: center;
		font-size: 12px;
	}
	
</style>
</head>
<body>
	<!-- 알람창 카테고리 -->
	<div id="alram_area" align="center">
		<!-- 메인페이지 페이아이콘 클릭 시 iframe jsp -->
		<div id="alram_area_bottom">
			<h4>펫페이 : ${ petpayAmount }원</h4>
			<br>
			<button type="button" data-toggle="modal" data-target="#chargePetpay">충전하기</button>
			<button type="button" data-toggle="modal" data-target="#withdrawPetpay">인출하기</button>
		</div>
	</div>
	
	<!-- 펫페이 충전 시 보여질 Modal -->
    <div class="modal fade" id="chargePetpay"
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
    
    <!-- 펫페이 인출 시 보여질 Modal -->
    <div class="modal fade" id="withdrawPetpay">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">펫페이 인출</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                     <form action="insertWithdrawPetpay.me" method="post" id="sign-form">

                    <!-- Modal body -->
                    <div class="modal-body">	
                    	<h5>펫페이 충전</h5>
    					<h6>1천원 단위로 충전이 가능합니다.</h6><br>
    					
			             <input type="number" name="petpayAmount" id="petpayAmountMinus" value="0" max="1000000" required>  원
			             <input type="hidden" name="memberNo" id="memberNo" value="${ loginMember.memberNo }">
			             
			             <div id="alertPetpay"></div>
			             <div id="overPetpay"></div>
			             
			             <div id="withdrawPetpay"> 총 보유 펫페이 : ${petpayAmount}</div>
				         <a class="btn btn-light" onclick="allWithdrawBtn();">전액인출</a>
				         
			             <br>
			              
			             <h6>출금 계좌 : ${ loginMember.bank }은행  ${ loginMember.account }</h6>
			             
			             <br>
			             
			             <a href="">계좌 수정하기</a>
			             
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">인출하기</button>
                        <button type="reset" class="btn btn-danger">초기화</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
	
    <script>
    
    function plusPay(plus) {
    	
    	console.log(plus);
    	
    	var input = $('#petpayAmount').val();
    	
    	if(plus == 1) {
			input = 10000;
    	} else if(plus == 3) {
    		input = 30000;
    	} else if(plus == 5) {
    		input = 50000;
    	} else if(plus == 10) {
    		input = 100000;
    	}
    	
    	$('#petpayAmount').val(input);
    	
    }
    	 
   	// 1만원 단위로 충전 가능, 백만원 이상 충전 못함
   	$(function () {
   		
   		$('#petpayAmount').on('change', function() {
   			var input = $(this).val();
   			
   			// 최대 가능 금액 백만원이 넘어가는 경우
   			if(input > 1000000) {
   				$('#overPetpay').html('<small>최대 충전 가능 금액은 1,000,000원 입니다.</small>');
   				$('#chargePetpayBtn').attr('disabled', true);
   				
   			} else {
   				$('#overPetpay').html('');
   				$('#chargePetpayBtn').attr('disabled', false);
   			}
   			
   			// 만원 단위로 입력을 안했을 경우
   			if(input != Math.floor(input/10000) * 10000) {
   				$('#alertPetpay').html('<small>만원 단위로 충전이 가능합니다.</small>');
   				input = Math.floor(input/10000) * 10000;
   				                        
   				// 만원 단위로 입력도 안하고 백만원 초과 시
   				if(input > 1000000) {
       				$('#overPetpay').html('<small>최대 충전 가능 금액은 1,000,000원 입니다.</small>');
       				$('#chargePetpayBtn').attr('disabled', true);
       			} else {
       				$('#overPetpay').remove();
       				$('#chargePetpayBtn').attr('disabled', false);
       			}
   			} else {
   				$('#alertPetpay').html('');
   			}
   			
   			$('#petpayAmount').val(input);
   			
   		});
   	});
   	
   	
   	function allWithdrawBtn() {
   		// [전액인출] 버튼을 눌렀을 때
   		// 전액을 $('#petpayAmount').val()에 넣어주기
   		
   		var petpay = '${petpayAmount}';
   		console.log(petpay);
   		$('#petpayAmountMinus').val(petpay); // 인출
   	}
   	
    </script>


</body>
</html>