<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div style="font-size: 20px;">${ p.categoryName }</div>
                <div style="font-size: 40px;">${ p.productTitle }</div>
                <hr>
                <br>
                <div style="font-size: 30px;">${ p.productPrice }</div>
                
                사이즈 <br> 수량
                <button>BUY NOW</button>
                <button>CART</button>
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
</body>
</html>