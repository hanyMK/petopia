<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245); 
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
    </style>
</head>
<body>
        
    <jsp:include page="../common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>리뷰 작성하기</h2>
            <br>
            <form id="enrollForm" method="post" action="reviewInsert.me" enctype="multipart/form-data">
            
                <table algin="center">
                	<!-- 예약인지 상품인지 구별 -->
                    <tr>
                    	<input type="hidden" name="mno" value="${loginMember.memberNo }">
                    	<th><label for="writer">상품 or 예약</label></th>
                    	<td><input type="text" id="" class="form-control" value="" name="">
                    		<input type="text" id="" class="form-control" value="" name="">
                    	</td>
                    	
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${loginMember.nickname }" name="nickName"></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        
                        <td><input type="file" id="upfile" class="form-control-file border" name="upfile" onchange="readURL(this);"></td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="boardContent" required></textarea></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
    <jsp:include page="../common/footer.jsp" />
    
    <script>
	    function readURL(input){
	        if(input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                document.getElementById('preview').src = e.target.result;
	            };
	            reader.readAsDataURL(input.files[0]);
	        } else {
	            document.getElementById('preview').src = "";
	        }
	    }
    </script>
    
    
</body>
</html>