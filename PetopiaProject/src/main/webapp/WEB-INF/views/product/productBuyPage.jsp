<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>준혁씨와 같이 작업하는 공간</title>
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
    }
    #tableContainer{
        border:1px black;
    }
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
        <div id="product_receipt_header">
            결제하기
        </div>
        <div id="product_receipt_content">
            <div id="product_receipt_content_1">
                <div id="product_receipt_detail_info">
                    <span id="detail_span">주문 상품 정보</span>
                    <hr>
                    <div id="tableContainer">

                    </div>
                </div>
            </div>
            <div id="product_receipt_content_2">
                <div id="product_receipt_detail_info2">

                </div>
            </div>
            <div id="product_receipt_content_3">
                <div id="product_receipt_detail_info3"></div>
            </div>
            <div id="product_receipt_content_4">
                <div id="product_receipt_detail_info4"></div>
            </div>
            <div id="product_receipt_content_5">
                <div id="product_receipt_detail_info5"></div>
            </div>
        </div>
    <jsp:include page="../common/footer.jsp"/>

        <script>
            $(function(){
                selectProduct();
            })

            function selectProduct(){
                $.ajax({
                    url : 'productInfo.pd',
                    data : {
                        pno : ${pr.productNo}
                    },
                    success : result => {
                        console.log(result);
                    },
                    error : () => {
                        console.log('안됨 ㅅㄱ');
                    }
                })
            };

        </script>



</body>
</html>