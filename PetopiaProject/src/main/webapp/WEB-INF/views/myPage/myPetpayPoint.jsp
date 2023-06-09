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
								<button type="button" data-toggle="modal" data-target="#deleteForm">충전하기</button>
							</div>
							<div class="pay_point_middle_1">
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
						<button onclick="peypayList();">펫페이 내역</button>
						<button onclick="pointList();">포인트 내역</button>
					</div>
					<div id="main_center_right_bottom_2">
					
						<button class="petpayStatus" onclick="selectCategory('ALL');">전체</button>
						<button onclick="selectCategory('PLUS');">충전</button>
						<button onclick="selectCategory('MINUS');">사용</button>
					</div>
					<div id="main_center_right_bottom_3">
						총 n건	기간
					</div>
					<div id="main_center_right_bottom_4">
						5.21 	강아지개껌		+12000원
					</div>			
				</div>
			</div>
		</div>
		<div id="main_right">
			
		</div>
		
	</div>
	
	<!-- 쿠폰발급시 보여질 Modal -->
    <div class="modal fade" id="deleteForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">펫페이 충전</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                     <form action="#" method="post" id="sign-form">

                    <!-- Modal body -->
                    <div class="modal-body">	
                    	<h5>펫페이 충전</h5>
    					<h6>1천원 단위로 충전이 가능합니다.</h6><br>
    					
			             <input type="number" name="petpayAmount" id="petpayAmount" max="1000000">  원
			             
			             
			             <div id="alertPetpay"></div>
			             <div id="overPetpay"></div>
			            	
			             <br>
			             <div>
				             <a class="btn btn-light" id="plus1man">1만</a>
				             <a class="btn btn-light" id="plus3man">3만</a>
				             <a class="btn btn-light" id="plus5man">5만</a>
				             <a class="btn btn-light" id="plus10man">10만</a>
			             </div>
			             
			             <br>
			              
			             <h6>출금 계좌 : ${ loginMember.bank }은행  ${ loginMember.account }</h6>
			             
			             <br>
			             
			             <a href="">계좌 수정하기</a>
			             
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button id="insertCoupon"  type="submit" class="btn btn-danger">충전하기</button>
                        <button type="reset" class="btn btn-danger">초기화</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script>
    	// 1만원 충전
    	$(function () {
    		$('#plus1man').on('click', function() {
    			var input = $('#petpayAmount').val();
    			input = Number(input) + 10000;
    			$('#petpayAmount').val(input);
    		});
    	});
    	
    	// 3만원 충전
    	$(function () {
    		$('#plus3man').on('click', function() {
    			var input = $('#petpayAmount').val();
    			input = Number(input) + 30000;
    			$('#petpayAmount').val(input);
    		});
    	});
    	
    	// 5만원 충전
    	$(function () {
    		$('#plus5man').on('click', function() {
    			var input = $('#petpayAmount').val();
    			input = Number(input) + 50000;
    			$('#petpayAmount').val(input);
    		});
    	});
    	
    	// 10만원 충전
    	$(function () {
    		$('#plus10man').on('click', function() {
    			var input = $('#petpayAmount').val();
    			input = Number(input) + 100000;
    			$('#petpayAmount').val(input);
    		});
    	});
    	
    	// 1천원 단위로 충전 가능
    	$(function () {
    		$('#petpayAmount').on('change', function() {
    			var input = $(this).val();
    			
    			// 최대 가능 금액 백만원이 넘어가는 경우
    			if(input > 1000000) {
    				$('#overPetpay').html('<small>최대 충전 가능 금액은 1,000,000원 입니다.</small>');
    				
    			} else {
    				$('#overPetpay').remove();
    			}
    			
    			// 만원 단위로 입력을 안했을 경우
    			if(input != Math.floor(input/10000) * 10000) {
    				$('#alertPetpay').html('<small>만원 단위로 충전이 가능합니다.</small>');
    				input = Math.floor(input/10000) * 10000;
    				
    				// 만원 단위로 입력도 안하고 백만원 초과 시
    				if(input > 1000000) {
        				$('#overPetpay').html('<small>최대 충전 가능 금액은 1,000,000원 입니다.</small>');
        				
        			} else {
        				$('#overPetpay').remove();
        			}
    			}
    			
    			$('#petpayAmount').val(input);
    			
    		});
    	});
    </script>
    
    <!-- 조회 카테고리 -->
    <script>
    	
    
    </script>

</body>
</html>