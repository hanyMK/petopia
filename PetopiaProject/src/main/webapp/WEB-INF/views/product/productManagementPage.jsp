<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
<style>
	#gongback{
		width: 1200px;
		height: 80px;
	}
	#management_header{
		border: 1px solid black;
		margin: auto;
		width: 1200px;
		height: 200px;
	}
	#management_content{
		border: 1px solid black;
		margin: auto;
		width: 1200px;
		height: 600px;
	}
	#management_header_1{
		border: 1px solid black;
		box-sizing: border-box;
		width: 30%;
		height: 100%;
		float: left;
	}
	#management_header_2{
		border: 1px solid black;
		box-sizing: border-box;
		width: 70%;
		height: 100%;
		float: left;
	}
	#insert_btn{
		width: 90px;
		height: 40px;
		font-size: 17px;
		background-color: #007BFF;
		color: white;
		border: none;
		border-radius: 5px;
	}
	#insert_btn:hover{
		cursor: pointer;
		background-color: #248eff;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div id="gongback"></div>

	<div id="management_header">
		<div id="management_header_1">

		</div>
		<div id="management_header_2">
			<button id="insert_btn">상품등록</button>
			<input type="text"> <button>검색</button>
			<br>
			<button>삭제</button>
		</div>
	</div>

	<div id="management_content">

	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$('#insert_btn').click(function(){
			location.href='productInsert.pd';
		})
	</script>

</body>
</html>