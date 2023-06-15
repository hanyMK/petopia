<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
<style>
    #product_info_div{
        width: 1200px;
        height: 500px;
        margin: auto;
    }
    #product_thumbnail_div{
        width: 45%;
        height: 100%;
        box-sizing: border-box;
        float: left;
        padding: 50px;
    }
    #product_detail_div{
        width: 55%;
        height: 100%;
        box-sizing: border-box;
        float: left;
        padding-top: 50px;
        padding-left: 20px;
        padding-bottom: 50px;
    }
    #product_thumbnail{
        width: 100%;
        height: 100%;
    }
    #product_detail{
        width: 100%;
        height: 100%;
    }
    #img1{
        width: 100%;
        height: 100%;
    }
    #product_detail_page_div{
        width: 800px;
        height: auto;
        margin: auto;
    }
    #product_detail_page_img{
        width: 100%;
        height: auto;
    }
    #product_navibar{
        width: 1200px;
        height: 50px;
        margin: auto;
    }
    #inputCount{
        width: 40px;
        height: 25px;
        text-align: center;
        font-size: 20px;
    }
    #product_size_select{
        width: 100px;
        height: 30px;
        text-align: center;
        font-size: 20px;
    }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

	<div id="product_info_div">
        <div id="product_thumbnail_div">
            <div id="product_thumbnail">
                <img id="img1" src="${ p.filePath }${p.changeName}">
            </div>
        </div>
        <div id="product_detail_div">
            <div id="product_detail">
                <form action="buyPage.pd" method="get">
                <div style="font-size: 20px;">${ p.categoryName }</div>
                <div style="font-size: 40px;">${ p.productTitle }</div>
                <hr>
                <br>
                <span>가격</span>
                <div style="font-size: 30px;">${ p.productPrice }</div>
                
                    <input type="hidden" name="productNo" value="${ bno }">
                    <c:if test="${p.categoryName eq '애견의류'}">
                        사이즈 
                        <select name="productSize" id="product_size_select">
                            <c:forEach var="list" items="${ list }">
                                <option value="${ list.productSize }">${ list.productSize }</option>
                            </c:forEach>
                        </select>
                    </c:if>
                        <br>
                        <br>
                        수량 <input type="number" name="amount" id="inputCount" value="1" max="10" min="1">
                        <br>
                        <br>
                    <button type="submit">BUY NOW</button>
                </form>
                <button id="cartGo">CART</button>
            </div>
        </div>
        <hr>
    </div>
    <div id="product_navibar">
        <br>
        <button id="detail_info" onclick="selectProductDetailList();">상품상세</button>
        <button>리뷰(리뷰수)</button>
        <button>상품문의</button>
        <button id="delivery_info">배송/교환반품 안내</button>
        <hr>
    </div>
    <br>
    <br>
    <div id="product_detail_page_div">

    </div>
    <jsp:include page="../common/footer.jsp"/>

    <script>
        $(function(){
            selectProductDetailList();
        })

        function selectProductDetailList(){
            $.ajax({
                url : 'productDetailNavi.pd',
                data : {
                    bno : ${bno}
                },
                success : function(product){
                    
                    var value = '';
                    
                    value += '<img id="product_detail_page_img" src="'+ (product.filePath + product.changeName) + '">'

                    $('#product_detail_page_div').html(value);
                },
                error : function(){
                    
                }
            });
        }

        $('#delivery_info').click(function(){
            var value = '';
            value += '<img id="product_detail_page_img" src="resources/images/deliveyInfo.jpg">'
            $('#product_detail_page_div').html(value);
        })
    </script>

    <script>
        $('#inputCount').on('blur', function(){
            if($('#inputCount').val() > 10){
                alert('최대 구매 가능한 수량은 10개 입니다.');
                $('#inputCount').val('1');
            }
            if($('#inputCount').val() <= 0){
                alert('최소 구매 가능한 수량은 1개 입니다.');
                $('#inputCount').val('1');
            }
        })
    </script>

    <script>
        $('#cartGo').on('click', function(){
            $.ajax({
                url : 'insertCart.pd',
                data : {
                    memberNo : ${loginMember.memberNo},
                    productNo : ${ bno },
                    amount : $('#inputCount').val(),
                    productSize : $('#product_size_select').val()
                },
                success : function(result){
                    alert('장바구니에 추가하였습니다.');
                },
                error : function(){
                    console.log('응안돼');
                }
            });
        })
    </script>
</body>
</html>