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
    .sizeInput{
        text-align: center;
        width: 20px;
    }
    #smallSize{
        display: none;
    }
    #mediumSize{
        display: none;
    }
    #largeSize{
        display: none;
    }
    #spanSize{
        display: none;
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
                제목    <input type="text" name="productTitle" id="input_title" required> <br><br>
                가격    <input type="number" name="productPrice" id="input_price" required> <br><br>
                        <span id="spanSize">사이즈</span> 
                        <input type="hidden" name="smallSize" id="sizeSmallInput" class="sizeInput" readonly> 
                        <input type="hidden" name="mediumSize" id="sizeMediumInput" class="sizeInput" readonly>
                        <input type="hidden" name="largeSize" id="sizeLargeInput" class="sizeInput" readonly>
                        <br><br>
                <button type="button" name="smallSize" id="smallSize">S</button>
                <button type="button" name="mediumSize" id="mediumSize">M</button>
                <button type="button" name="largeSize" id="largeSize">L</button>
                <br>
                <br>
                썸네일 사진 넣기 <input type="file" name="thumbnail" onchange="thumbnailReadURL(this)" required>
                <br>
                <br>
                <div id="product_thumbnail">
                    <img id="preview_thumbnail">
                </div>
                <br>
                상세페이지 사진 넣기 <input type="file" name="detail" onchange="detailReadURL(this)" required>
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

        $('#product_category').change(function(){
            if( $('#product_category').val() == '애견의류'){
            $('#smallSize').css('display','inline-block');
            $('#mediumSize').css('display','inline-block');
            $('#largeSize').css('display','inline-block');
            $('#spanSize').css('display','inline-block');
            } else {
            $('#smallSize').css('display','none');
            $('#mediumSize').css('display','none');
            $('#largeSize').css('display','none');
            $('#spanSize').css('display','none');
            $('#sizeSmallInput').val('');
            $('#sizeMediumInput').val('');
            $('#sizeLargeInput').val('');
            $('#sizeSmallInput').prop('type',"hidden");
            $('#sizeMediumInput').prop('type',"hidden");
            $('#sizeLargeInput').prop('type',"hidden");
            }
        })
        

        $('#smallSize').click(function(){
            if($('#sizeSmallInput').val() == 'S'){
                $('#sizeSmallInput').val('');
                $('#sizeSmallInput').prop('type',"hidden");
            } else {
                $('#sizeSmallInput').val($(this).text());
                $('#sizeSmallInput').prop('type',"text");
            }
        })
        $('#mediumSize').click(function(){
            if($('#sizeMediumInput').val() == 'M'){
                $('#sizeMediumInput').val('');
                $('#sizeMediumInput').prop('type',"hidden");
            } else {
                $('#sizeMediumInput').val($(this).text());
                $('#sizeMediumInput').prop('type',"text");
            }
        })
        $('#largeSize').click(function(){
            if($('#sizeLargeInput').val() == 'L'){
                $('#sizeLargeInput').val('');
                $('#sizeLargeInput').prop('type',"hidden");
            } else {
                $('#sizeLargeInput').val($(this).text());
                $('#sizeLargeInput').prop('type',"text");
            }
        })
    </script>

    <jsp:include page="../common/footer.jsp"/>
	
</body>
</html>