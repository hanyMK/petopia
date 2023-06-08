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
    </div>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>