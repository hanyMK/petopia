<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    #area{
        border: 1px solid black;
        width: 1200px;
        height: 800px;
        margin: auto;
    }
    #area_in{
        width: 600px;
        height: 800px;
        margin: auto;
    }
    #select_el{
        width: 300px;
        height: 30px;
    }
    #input_title{
        width: 300px;
        height: 30px;
    }
    #input_price{
        width: 300px;
        height: 30px;
    }
    #product_thumbnail{
        border: 1px solid black;
        width: 200px;
        height: 200px;
    }
</style>
<title>상품 등록</title>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div id="area">
        <div id="area_in">
            <form action="" method="get">
                <br>
                카테고리 <select id="select_el">
                        <option value="goods">애견용품</option>
                        <option value="food">애견식품</option>
                        <option value="clothes">애견의류</option>
                        </select> <br><br>
                제목    <input type="text" name="productTitle" id="input_title"> <br><br>
                가격    <input type="number" name="productPrice" id="input_price"> <br><br>
                <input type="checkbox" name="noSize"> 선택안함<br>
                <input type="checkbox" name="sSize"> S<br>
                <input type="checkbox" name="mSize"> M<br>
                <input type="checkbox" name="lSiez"> L<br>
                <br>
                <div id="product_thumbnail">

                </div>
                <br>
                썸네일 사진 넣기 <input type="file">
                <br>
                
                <br>
                상세페이지 사진 넣기 <input type="file">

                <hr>

                <input type="submit" value="상품등록">

            </form>
        </div>
    </div>



    <jsp:include page="../common/footer.jsp"/>
	
</body>
</html>