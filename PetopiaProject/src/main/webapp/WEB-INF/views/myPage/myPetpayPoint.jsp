<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>

	#main_center_right_top{
		height: 25%;
		padding-top: 25px;
		margin: auto;
		border: 1px solid black;
	}
	#main_center_right_top>div{
		margin: auto;
		text-align: center;
	}
	#main_center_right_bottom{
		height:75%;
		padding-top: 25px;
		margin: auto;
		border: 1px solid black;
	}
	#pay_point_top {
		height:70%;
		text-align:center;
	}
	
	#pay_point_middle {
		height:10%;
		padding-right
	}
	
	#pay_point_bottom {
		height:20%;
	}
	
	.pay_point_top_1 {
		display: inline-block;
		width: 200px;
	}
	
	.pay_point_middle_1 {
		display: inline-block;
		width: 200px;
	}
	
	#main_center_right_bottom_1 {
		height:10%;
		text-align:center;
	}
	
	#main_center_right_bottom_2 {
		height:10%;
	}
	
	#main_center_right_bottom_3 {
		height:10%;
	}
	
	#main_center_right_bottom_4 {
		height:70%;
	}
	
	#petpayAmount {
		width: 200px;
	}
	
	#pointList{
		display: none;
	}
	
	
	
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

    <div id="main">
		<div id="main_left">
		
		</div>
		<div id="main_center">
			<div id="main_center_left">
				<jsp:include page="myPageNavi.jsp" />
			</div>
			<div id="main_center_right">
				<div id="main_center_right_top">
					<div>
						<div id="pay_point_top">
							<div class="pay_point_top_1">
								<h4>펫페이</h4><br>
								<h5>${ petpayAmount }원</h5>
							</div>
							<div class="pay_point_top_1">
								<h4>포인트</h4><br>
								<h5>${ pointAmount }원</h5>
							</div>
						</div>
						<div id="pay_point_middle">
							<div class="pay_point_middle_1">
								<button type="button" data-toggle="modal" data-target="#chargePetpay">충전하기</button>
								<button type="button" data-toggle="modal" data-target="#withdrawPetpay">인출하기</button>
							</div>
						</div><br>
						<div id="pay_point_bottom">
							<small>작성 가능한 리뷰 : ??개개</small><br>
							<small>펫페이 충전 후 결제 시, 결제 금액의 5%를 포인트로 적립해드려요!</small>
						</div>
					</div>
				</div>
				<div id="main_center_right_bottom">	
					<div id="main_center_right_bottom_1">
						<button onclick="petpayBtn();">펫페이 내역</button>
						<button onclick="pointBtn();">포인트 내역</button>
					</div>
					<div id="petpayList" align="center">
						<div id="petpayList_1">
							<button class="petpayStatus" onclick="petpayStatusBtn('ALL');">전체</button>
							<button class="petpayStatus" onclick="petpayStatusBtn('PLUS');">충전</button>
							<button class="petpayStatus" onclick="petpayStatusBtn('MINUS');">사용</button>
						</div>
						<div id="petpayList_2">
							총 n건	기간
						</div>
						<div id="petpayList_3">
							<c:forEach var="pp" items="${ petpayList }" >
								<div id="myList">
									${pp.petpayDate}
									${pp.account}
									${pp.petpayAmount}
									${pp.petpayStatus}
								</div><br>
				            </c:forEach>
						</div>	
					</div>
					<div id="pointList" align="center">
						<div id="pointList_1">
							<button class="pointStatus" onclick="pointStatusBtn('ALL');">전체</button>
							<button class="pointStatus" onclick="pointStatusBtn('PLUS');">충전</button>
							<button class="pointStatus" onclick="pointStatusBtn('MINUS');">사용</button>
						</div>
						<div id="pointList_2">
							총 n건	기간
						</div>
						<div id="pointList_3">
							<c:forEach var="p" items="${ pointList }" >
								<div id="myList">
									${p.pointDate}
									${p.pointStatus }
									${p.pointAmount}
								</div><br>
				            </c:forEach>
						</div>
					</div>		
				</div>
			</div>
		</div>
		<div id="main_right">
			
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
    
    <!-- 펫페이내역, 포인트내역 버튼 -->
    <script>
    
    var petpayList = $("#petpayList");
    var pointList = $("#pointList");
    
    function petpayBtn () {
    	petpayStatusBtn();
        if(petpayList.css("display") === 'none' ) {
        	petpayList.css("display", 'block'); 
        	pointList.css("display", 'none');  
        }
    }
    
    function pointBtn () {
    	petpayStatusBtn();
        if(pointList.css("display") === 'none' ) {
        	pointList.css("display", 'block'); 
        	petpayList.css("display", 'none'); 
        }
    }
    
    </script>
    
    <!-- 전체, 충전, 사용 카테고리 -->
    <script>
    // 펫페이
    
    function petpayStatusBtn(status) {
    	
    	console.log(status);
    	
    	$.ajax({
    		url : 'petpayStatusList.me', 
    		data : { 
    				status : status,
    				mno : ${ loginMember.memberNo }
    			},
    		success : function(list) {
    			let value = "";
    			for(let i in list) {
    				console.log(list);
    				value += '<div id="myList">'							
    					   + list[i].petpayDate
    					   + list[i].account
    					   + list[i].petpayAmount
    					   + list[i].petpayStatus
    					   + '</div><br>';
    				};
    			$('#petpayList_3').html(value);
    			
    		},
    		error : function() {
    			console.log('AJAX 조회 실팽이');
    		}
    	});
	}
    
    // 포인트
     function pointStatusBtn(status) {
    	
    	console.log(status);
    	
    	$.ajax({
    		url : 'pointStatusList.me', 
    		data : { 
    				status : status,
    				mno : ${ loginMember.memberNo }
    			},
    		success : function(list) {
    			let value = "";
    			for(let i in list) {
    				console.log(list);
    				value += '<div id="myList">'							
    					   + list[i].pointDate
    					   + list[i].pointAmount
    					   + list[i].pointStatus
    					   + '</div><br>';
    				};
    			$('#pointList_3').html(value);
    			
    		},
    		error : function() {
    			console.log('AJAX 조회 실팽이');
    		}
    	});
	}
    </script>
    
    <script>
    
    
    </script>

</body>
</html>