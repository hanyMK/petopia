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

        #updateForm>table {width:100%;}
        #updateForm>table * {margin:5px;}
    </style>
</head>
<body>
        
    <jsp:include page="../common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 수정하기</h2>
            <br>

            <form id="updateForm" method="post" action="update.bo" enctype="multipart/form-data">
                <input type="hidden" name="boardNo" value="${b.boardNo }" />
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" value="${ b.boardTitle }" name="boardTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${b.nickName }" name="nickName" readonly></td>
                    </tr> 
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td>
                            <input type="file" id="upfile" class="form-control-file border" name="reUpfile" onchange="readURL(this);">
                         	<img id="preview" width="100px" height="100px">
                         	<c:if test="${ not empty b.originName }">
                         	   	현재 업로드된 파일 : 
                            	<a href="${b.filePath }${b.changeName }" download="${ b.originName }">${b.originName }</a>
                            	<input type="hidden" name="originName" value="${b.originName }" />
                            	<input type="hidden" name="changeName" value="${b.changeName }" />
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="boardContent" required>${b.boardContent }</textarea></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                </div>
            </form>
            <br>
            	<div align="center">
                    <button class="btn btn-danger" id="prePage">이전으로</button>
            	</div>
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
	    
	    $('#prePage').click(function(){
	    	history.back();
	    })
    </script>
    
</body>
</html>