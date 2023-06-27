<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 내역</title>
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
        width: 900px;
        height: 800px;
        margin: auto;
        padding: 60px;
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
        width: 800px;
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


    #product_receipt_content_4{
        width: 55%;
        height: 400px;
        float: left;
        box-sizing: border-box;
        padding: 15px;
    }
    #product_receipt_detail_info4{
        border: 1px solid black;
        width: 800px;
        height: 100%;
        float: left;
        box-sizing: border-box;
        padding: 20px;
    }
   
    #tableContainer{
        border:1px black;
    }

    #shppingInfo  input{
        width: 200px;
    }

    #pImg{
        width: 400px;
        height: 400px;
    }
    .product{
        font-size: 20px;
        font-weight: 900px;
    }

    #main_center_right_top> h2{
        padding-top: 50px;
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
					<h2 align="center">배송주문 목록 조회</h2>
				</div>
				<div id="main_center_right_bottom">
					<div id="orderList">
                        <div id="product_receipt_content">
                            <div id="product_receipt_content_1">
                                <div id="product_receipt_detail_info">
                                    <span id="detail_span">주문 상품 정보</span>
                                    <hr>
                                    <div id="tableContainer">
                                        <span id="detail_span">결제정보</span>
                                        <hr>
                                        <c:forEach var="item" items="${order}">
                                            <img id="pImg" src="${item.filePath}" ><br>
                                            <h2>상품명: ${item.productTitle}</h2><br>
                                            <h2>결제 가격 : <fmt:formatNumber value="${item.resultPrice}" type="number"/> </h2>
                                            <hr>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${not empty order[0].couponType and order[0].couponType eq 1}">
                                                <h4>쿠폰 할인 : <fmt:formatNumber value="${order[0].discount}" type="number"/>  원</h4>
                                            </c:when>
                                            <c:when test="${ order[0].couponType eq 2}">
                                                <h4>쿠폰 할인 :${order[0].discount} %</h4>
                                            </c:when>
                                            <c:otherwise>
                                                <h4>쿠폰 할인금액 : <fmt:formatNumber value="${order[0].discount}" type="number"/>  원</h4>
                                            </c:otherwise>
                                        </c:choose>
                                            <h4>적립금 사용금액 :<fmt:formatNumber value="${order[0].point}" type="number"/>   원</h4>
                                            <h4>총 결제 금액 : <fmt:formatNumber value="${order[0].totalPrice}" type="number"/> 원 </h4>
                                    </div>
                                </div>
                            </div>

                           
                            <div id="product_receipt_content_4">
                                <div id="product_receipt_detail_info4">
                                    <span id="detail_span">배송지</span>
                                    <br>
                                    <br>
                                    <h1>${order[0].shippingStatus}</h1>
                                    <h2>받는분 이름 : ${order[0].receiver}</h2>
                                    <h2>전화번호 : ${order[0].phone}</h2>
                                    <h2>주소 : ${order[0].shippingAddress}</h2>
                                    <c:choose>
                                        <c:when test=" ${order[0].shippingMessage eq ''}">
                                            <div >배송메모 : 없음</div>
                                        </c:when>
                                        <c:otherwise>
                                            <h2>배송메모 : ${order[0].shippingMessage}</h2>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:if test="${order[0].shippingStatus eq '상품준비중'}">
                                        <button id="give_update" button type="button" data-toggle="modal" data-target="#shipping">배송지 정보 수정하기</button>
                                    </c:if>
                                    <hr>
                                    <br>
                                </div>
                            </div>
                        </div>
					</div>
				</div>
			</div>
		</div>
		<div id="main_right">
			
		</div>
		
	</div>
	

    <!-- The Modal -->
    <div class="modal fade" id="shipping">
        <div class="modal-dialog">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">배송 수정</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body" >
                <br>
                <h1>${order[0].shippingStatus}</h1>
                <form action="updateSippingInfo.me" method="post">
                    <table align="center" id="shppingInfo">
                        <tr>
                            <th>받는분 이름 :</th>
                            <td><input type="text" name="receiver" value="${order[0].receiver}" >
                                <input type="hidden" name="receiptNo" value="${order[0].receiptNo}">
                            </td>
                        </tr>
                        <tr>
                            <th>전화번호 :</th>
                            <td><input type="text" name="phone" value="${order[0].phone}" ></td>
                        </tr>
                        <tr>
                            <th>주소 :</th>
                            <td>                                
                                <input type="button" onclick="findPostcode()" value="주소 검색"><br>
                                <input type="text" id="postcode" name="shippingAddress" placeholder="우편번호">
                                <input type="text" class="form-control" id="address" placeholder="주소" name="shippingAddress"> 
                                <input type="text"  class="form-control" id="detailAddress" name="shippingAddress" placeholder="상세주소" ><br>
                            </td>
                        </tr>
                        <tr>
                            <th>배송메모 : </th>
                            <td>
                                <c:choose>
                                    <c:when  test="${order[0].shippingMessage eq ''}">
                                        <input type="text" name="shippingMessage" value="없음" >
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" name="shippingMessage" value="${order[0].shippingMessage}" >
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                        <button type="submit" id="update" class="btn btn-danger" >수정하기</button>
                    </div>
            </form>
            
        </div>
        </div>
    </div>

    <script>
	    function findPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
				    var roadAddr = data.roadAddress; // 도로명 주소 변수
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById('address').value = roadAddr;
	            }
	        }).open();
            $('#detailAddress').val('');
	    }
        var address = '${order[0].shippingAddress}'.split(',');
        console.log(address);
        $('#postcode').val(address[0]);
        $('#address').val(address[1]);
        $('#detailAddress').val(address[2]);
	</script>
    

    <jsp:include page="../common/footer.jsp"/>


    <script>

      



    </script>

</body>
</html>