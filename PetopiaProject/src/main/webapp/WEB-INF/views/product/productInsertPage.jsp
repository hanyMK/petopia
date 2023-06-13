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
        height: 1200px;
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
        width: 300px;
        height: 300px;
    }
    #preview_thumbnail{
        border: 1px solid black;
        width: 300px;
        height: 300px;
    }
    #product_detail{
        width: 300px;
        height: 300px;
    }
    #preview_detail{
        border: 1px solid black;
        width: 300px;
        height: 300px;
    }
</style>
<title>상품 등록</title>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div id="area">
        <div id="area_in">
            <form action="insert.pd" method="post" enctype="multipart/form-data">
                <br>
                카테고리 <select name="category" id="product_category">
                        <option>애견용품</option>
                        <option>애견식품</option>
                        <option>애견의류</option>
                        </select> <br><br>
                제목    <input type="text" name="productTitle" id="input_title"> <br><br>
                가격    <input type="number" name="productPrice" id="input_price"> <br><br>
                사이즈 <input type="text" disabled> <br><br>
                <input type="hidden">
                <button type="button" name="smallSize" id="smallSize">S</button>
                <button type="button" name="mediumSize" id="mediumSize">M</button>
                <button type="button" name="largeSize" id="largeSize">L</button>
                <br>
                <br>
                썸네일 사진 넣기 <input type="file" name="thumbnail" onchange="thumbnailReadURL(this)">
                <br>
                <br>
                <div id="product_thumbnail">
                    <img id="preview_thumbnail">
                </div>
                <br>
                상세페이지 사진 넣기 <input type="file" name="detail" onchange="detailReadURL(this)">
                <br>
                <br>
                <div id="product_detail">
                    <img id="preview_detail">
                </div>
                <br>
                <hr>
                <input type="submit" value="상품등록">

            </form>
        </div>
    </div>

    <script>
        function thumbnailReadURL(input){
            if(input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('preview_thumbnail').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                document.getElementById('preview_thumbnail').src = "";
            }
        }
        function detailReadURL(input){
            if(input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('preview_detail').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                document.getElementById('preview_detail').src = "";
            }
        }
    </script>

    <script>
        $('#smallSize').click(function(){
            
        })
    </script>

    <jsp:include page="../common/footer.jsp"/>
	
</body>
</html>