<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>준혁씨와 같이 작업하는 공간</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    #product_receipt_header{
        width: 1200px;
        height: 100px;
        margin: auto;
        text-align: center;
        font-size: 40px;
        padding-top: 50px;
    }
    #product_receipt_content{
        width: 1000px;
        height: 1200px;
        margin: auto;
        padding: 30px;
    }
    #product_receipt_content_1{
        width: 55%;
        height: 400px;
        float: left;
        box-sizing: border-box;
        padding: 15px;
    }
    #product_receipt_detail_info{
        border: 1px solid black;
        width: 100%;
        height: 100%;
        box-sizing: border-box;
        overflow-y:scroll;
        padding: 20px;
    }
    #product_receipt_detail_info::-webkit-scrollbar {
        width: 10px;
        background: white;
    }
    #product_receipt_detail_info::-webkit-scrollbar-thumb {
        height: 30%;
        background: #888888;
        border-radius: 10px;
    }

    #coupon_list{
        border: 1px solid black;
        width: 100%;
        height: 300px;
        max-height: calc(100vh - 200px);
        overflow-y: auto;
        padding: 20px;
    }


    #detail_span{
        font-weight: bold;
        font-size: 20px;
    }
    #product_receipt_content_2{
        width: 45%;
        height: 230px;
        float: left;
        box-sizing: border-box;
        padding: 15px;
    }
    #product_receipt_detail_info2{
        border: 1px solid black;
        width: 100%;
        height: 100%;
        box-sizing: border-box;
        padding: 20px;
    }
    #product_receipt_content_3{
        width: 45%;
        height: 570px;
        float: right;
        box-sizing: border-box;
        padding: 15px;
    }
    #product_receipt_detail_info3{
        border: 1px solid black;
        width: 100%;
        height: 100%;
        box-sizing: border-box;
        padding: 20px;
    }
    #product_receipt_content_4{
        width: 55%;
        height: 400px;
        float: left;
        box-sizing: border-box;
        padding: 15px;
    }
    #product_receipt_detail_info4{
        border: 1px solid black;
        width: 100%;
        height: 100%;
        float: left;
        box-sizing: border-box;
        padding: 20px;
    }
    #product_receipt_content_5{
        width: 100%;
        height: 350px;
        float: left;
        box-sizing: border-box;
        padding: 15px;
    }
    #product_receipt_detail_info5{
        border: 1px solid black;
        width: 100%;
        height: 100%;
        float: left;
        box-sizing: border-box;
        padding: 20px;
    }
    #tableContainer{
        border:1px black;
    }
    #memo{
        width: 400px;
        height: 30px;
        font-size: 20px;
    }
    #selectMemo{
        width: 408px;
        height: 30px;
        font-size: 20px;
    }
    #coupon_detail{
        border: 1px solid black;
    }
    #coupon_detail:hover{
        cursor: pointer;
        background-color: rgb(246, 202, 255);
    }
    #coupon_modal_div{
        color: white;
        background-color: #1e2b67;
    }
    #coupon_modal_end{
        background-color: #1e2b67;
    }
    #coupon_insert_input{
        width: 400px;
    }
    .payment_title{
        font-size: 20px;
        font-weight: bold;
    }
</style>
</head>
<body>
    
    <jsp:include page="../common/header.jsp"/>

    <!-- The Modal -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">배송지 정보</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
                <label for="phone"> &nbsp;* 전화번호 : </label>
                <input type="tel" class="form-control" id="phone" placeholder="전화번호를 -를 포함해서 입력해주세요." name="phone" onchange="checkPhone();"> <br>
                <span>&nbsp;* 받는분 성함 : </span> <input type="text" id="giveName"><br><br>
                <div id="phonehidden" class="hidden"></div>

                <label for="address"> &nbsp;* 주소 : </label><br>
                <input type="text" id="postcode" name="address" placeholder="우편번호">
                <input type="button" onclick="findPostcode()" value="주소 검색"><br>
                 <input type="text" class="form-control" id="address" placeholder="주소" name="address"> 
                <input type="text"  class="form-control" id="detailAddress" name="address" placeholder="상세주소" required><br>
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal" id="update_gift_info" onclick="updateAddress();">수정하기</button>
            </div>
            
        </div>
        </div>
    </div>

    <script>

        function regExpPhone(phone) { //전화번호
            var regPhone = /^01([0|1|6|7|8|9])-([0-9]{4})-([0-9]{4})$/;
            return regPhone.test(phone);
        }

        function updateAddress(){
            var $phone = $('#phone').val();
            if(regExpPhone($phone) == true){
                $('#give_phone').text($('#phone').val());

            } else {
                alert('ex) 010-1234-1234  "-" 포함 11자리 숫자 ');
                $('#phone').val('');
            }
            $('#give_name').text($('#giveName').val());
            $('#give_address').text($('#address').val());
            $('#give_detale_address').text($('#detailAddress').val());
            
        }
    </script>

    <script>
	    function findPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
				    var roadAddr = data.roadAddress; // 도로명 주소 변수

	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById('address').value = roadAddr;
	            }
	        }).open();
	    }
	</script>



        <!-- 펫페이 충전 시 보여질 Modal -->
        <div class="modal fade" id="chargePetpay">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h3 class="modal-title">펫페이 충전</h3>
                        <button type="button" class="close" data-dismiss="modal" id="closePay">&times;</button>
                    </div>
                        <!-- <form action="insertPetpay.pd" method="post" id="sign-form"> -->
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
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer" align="center">
                            <button id="chargePetpayBtn" class="btn btn-danger" onclick="insertPetpay();">충전하기</button>
                            <button class="btn btn-danger">초기화</button>
                        </div>
                    <!-- </form> -->
                </div>
            </div>
        </div>
    
        <div id="product_receipt_header">
            결제하기
        </div>
        <div id="product_receipt_content">
            <div id="product_receipt_content_1">
                <div id="product_receipt_detail_info">
                    <span id="detail_span">주문 상품 정보</span>
                    <hr>
                    <div id="tableContainer">
                        <c:forEach var="item" items="${list}">
                            <div>제목 : ${item.cartTitle}
                            수량 : ${item.amount}
                            사이즈 : ${item.productSize}
                            가격 : ${item.cartPrice}
                            추가금 : ${item.extraMoney}</div>
                            <hr>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div id="product_receipt_content_2">
                <div id="product_receipt_detail_info2">
                    <span id="detail_span">회원정보</span> <br>
                    <h4>회원 이름 : ${loginMember.memberName} </h4>
                    <h4>전화번호 : ${loginMember.phone} </h4><br>
                </div>
            </div>
            <div id="product_receipt_content_3">
                <div id="product_receipt_detail_info3">
                    <span id="detail_span">결제정보</span> <br>
                    <span class="payment_title">상품가격 : </span> <span id="payment_info_1">${result}</span><br>
                    <span class="payment_title">쿠폰 사용 : </span> <span id="payment_info_2"></span><br>
                    <span class="payment_title">적립금 사용 : </span> <span id="payment_info_3"></span><br>
                    <span class="payment_title">총 결제 금액 : </span> <span id="payment_info_4"></span><br>
                    <br><hr><br>
                    <h4 id="payAmount"></h4> <button data-toggle="modal" data-target="#chargePetpay">충전</button>
                    <br>
                    <button onclick="goPayment();">결제하기</button>
                </div>
            </div>
            <div id="product_receipt_content_4">
                <div id="product_receipt_detail_info4">
                    <span id="detail_span">배송지</span>
                    <br>
                    <br>
                    <div id="give_name">받는분 이름 : ${loginMember.memberName}</div>
                    <div id="give_phone">전화번호 : ${loginMember.phone}</div>
                    <div id="give_address">주소 : ${loginMember.address}</div>
                    <div id="give_detale_address">상세주소 : ${loginMember.address}</div>
                    <br>
                    <!-- Button to Open the Modal -->
                    <button id="give_update" button type="button" data-toggle="modal" data-target="#myModal">배송지 수정하기</button>
                    <br>
                    <hr>
                    <div>수령지 : </div>
                    <select id="selectMemo">
                        <option class="a" value="">관리사무소</option>
                        <option class="a" value="">택배수령함</option>
                        <option class="a" value="">문앞</option>
                        <option class="a" value="">직접입력</option>
                    </select>
                    <br>
                    <br>
                    <input type="text" id="memo" placeholder="직접입력">
                </div>
            </div>


            <div id="product_receipt_content_5">
                <div id="product_receipt_detail_info5">
                    <span id="detail_span">쿠폰/포인트</span>
                        <div>쿠폰</div>
                        <input type="text" id="coupon_insert_input"> <button data-toggle="modal" data-target="#couponModal">쿠폰등록</button>
                        <div hidden id="coupon_no"></div>
                        <div hidden id="coupon_discount">0</div>
                        <div>포인트</div>
                        <input type="text" id="usePointInput" value="0"> 
                        <button onclick="usePotinBtn();">사용</button>
                        <button onclick="allUsePotinBtn();">모두사용</button>
                        <br>
                        <c:choose>
                            <c:when test="${not empty point}">
                                <span>보유 포인트 : </span><span id="point_span">${point}</span>
                            </c:when>
                            <c:otherwise>
                                <span>보유 포인트 : </span><span id="point_span">0</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="couponModal">
                <div class="modal-dialog">
                <div class="modal-content">
                
                    <!-- Modal Header -->
                    <div class="modal-header" id="coupon_modal_div">
                    <h4 class="modal-title">쿠폰 정보</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body">
                    쿠폰 리스트 
                    <button onclick="selectCoupon();">쿠폰 목록</button>
                        <div id="coupon_list">
                 
                        </div>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer" id="coupon_modal_end">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="modal_close">닫기</button>
                    </div>
                </div>
                </div>
            </div>

        </div>

    <jsp:include page="../common/footer.jsp"/>

    <script>
        $('select').on('change',function(){
            if($('option:selected').text() == '직접입력'){
                $('#memo').val('');
            } else {
                $('#memo').val($('option:selected').text());
            }
        })

        // $('#selectMemo').on('change', function(){
        //     for(var i = 0; i < ('#selectMemo')[0].length; i++){
        //         $('#memo').val($(this[i]).text());
        //         console.dir($('#selectMemo')[0][0].text);
        //     }
        // })
    </script>

    <script>
        $(function(){
            insertCoupon();
            calculate();
            selectPetpay();
        })

        function selectCoupon(){
            $.ajax({
                url : 'selectCoupon.pd',
                data : {
                    memNo : ${loginMember.memberNo}
                },
                success : function(list){
                    console.log(list);
                    let value = '';
                    if(list != ' '){
                        for(let i in list){
                            value  += '<div id="coupon_detail" class="couponClass">'
                               + '쿠폰 이름 : <span class="cName">'+ list[i].couponName +'</span> <br>'
                               + '<span hidden class="cno">'+ list[i].couponNo +'</span>';
                               if(list[i].couponType == 1){
									value += '<span class="discount">'+ list[i].discount +'</span>원<br>';
								}else{
									value += '<span class="discount">'+ list[i].discount +'</span>%<br>';
								}
                              //+ '할인률 : '+ list[i].discount +' <br>'
                              value += 
                                '기간 : '+ list[i].startDate +'~'+ list[i].endDate +'<br>'
                               + '50000원 이하부터 10000원 이상'
                               + '</div>'
                               + '<hr>'
                        }
                        $('#coupon_list').html(value);
                        console.log('리스트있음 엘스구문');
                    } else {
                        value += '등록된 쿠폰이 없습니다.';
                        $('#coupon_list').text(value);
                        console.log('빈문자 엘스구문');
                    }

                },
                error : function(){
                    console.log('안됨');
                }
            })
        }

        function insertCoupon(){
            $('#coupon_list').on('click', '.couponClass', function(){

                let discount = $(this).find('.discount').text();

                $('#coupon_insert_input').val($(this).find('.cName').text());
                $('#coupon_no').text($(this).find('.cno').text())
                $('#coupon_discount').text($(this).find('.discount').text());

                if(discount >= 0 && discount <= 100){
                    $('#payment_info_2').text($(this).find('.discount').text() + '%');
                } else {
                    $('#payment_info_2').text($(this).find('.discount').text() + '원');
                }

                $('#modal_close').click();
                calculate();
            });
        }

        function allUsePotinBtn(){
            $('#usePointInput').val(${point});
            $('#point_span').text('0');
            $('#payment_info_3').text($('#usePointInput').val());
            calculate();
        }

        function usePotinBtn(){

            var num = $('#usePointInput').val();
            var result = Math.round(num/100) * 100;
            
                if(result >= 0 && result < ${point}){
                    var point = ${point} - result;
                    $('#point_span').text(point);
                    $('#payment_info_3').text(result);
                    $('#usePointInput').val(result);
                    calculate();
    
                } else {
                    alert('보유 포인트보다 적거나 많습니다.');
                    $('#usePointInput').val('');
                    $('#payment_info_3').text('');
                }
            
            $("#usePointInput").blur(function() {
                if($(this).val() == '') {
                    $('#point_span').text(${point});
                    $('#payment_info_3').text($('#usePointInput').val());
                }
            });
        }

        function calculate(){
            $.ajax({
                url : 'calculate.pd',
                data : {
                    total : ${result},
                    coupon : $('#coupon_discount').text(),
                    point : $('#usePointInput').val(),
                },
                success : function(value){
                    $('#payment_info_4').text(value);
                    console.log(value);
                    console.log('됨');
                },
                error : function(){
                    console.log('안됨');
                }
            })

        }

        var couponDiscount = $('#coupon_discount').text();
        var pointValue = $('#point_span').text();

        // $.ajax({
        //     url : 'insertPayment.pd',
        //     data : {
        //         total : ${result},
        //         coupon : couponDiscount,
        //         point : pointValue,
        //     },
        //     success : function(){

        //     },
        //     error : function(){

        //     }
        // })

    function insertPetpay(){
            $.ajax({
                url : 'insertPetpay.pd',
                data : {
                    petpayAmount : $('#petpayAmount').val(),
                    memberNo : $('#memberNo').val()
                },
                success : function(){
                    alert('충전이 완료되었습니다.');
                    $('#closePay').click();
                    selectPetpay();
                },
                error : () => {
                    console.log('안됨');
                }
            })

        }

        function selectPetpay(){
            $.ajax({
                url : 'selectPetpay.pd',
                success : function(result){
                    console.log(result);
                    let value = '보유 펫페이 : ' + result + ' 원'
                    $('#payAmount').text(value);
                },
                error : function(){
                    console.log('안됨');
                }
            })
        }



    </script>

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
    </script>

    <script>
        function goPayment(){
            $.ajax({
                url : ,
                data : {

                },
                success : function(){
                    couponNo : ,
                    point : ,
                    
                },
                error : function(){

                }
            })
            
        }
    </script>

</body>
</html>