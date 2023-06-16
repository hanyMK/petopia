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
            받는분 이름 : <input type="text"> <br><br>
            전화번호 : <input type="text"> <br><br>
            주소 : <input type="text"> <br><br>
            상세주소 : <input type="text"> <br><br>
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">수정하기</button>
            </div>
            
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
                    <span id="detail_span">결제정보</span>
                    <h4>상품가격 : </h4>
                    <h4>쿠폰 사용 : </h4>
                    <h4>적립금 사용 : </h4>
                    <h4>총 결제 금액 : </h4>
                    <br><hr><br>
                    <h4>보유 펫페이 : 80,000 원</h4> <button>충전</button>
                    <br>
                    <button>결제하기</button>
                </div>
            </div>
            <div id="product_receipt_content_4">
                <div id="product_receipt_detail_info4">
                    <span id="detail_span">배송지</span>
                    <br>
                    <br>
                    <div>받는분 이름 : ${loginMember.memberName}</div>
                    <div>회원 이름 : ${loginMember.memberName}</div>
                    <div>전화번호 : ${loginMember.phone}</div>
                    <div id="give_address">주소 : ${loginMember.address}</div>
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



</body>
</html>