<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	#alram_area_top{
		height: 10%;
		padding-top: 30px;
		padding-bottom: 30px;		
	}
	#alram_area_bottom{
		height:90%;
		padding-top:50px;
	}
	
	#alram_area_bottom>a{
		font-size:20px;
		text-decoration: none;
		color:#F6823F;
	}
	
	#alram_area_bottom>a:hover{
		cursor:point;
	}
	
	#myList{
		border: 1px solid black;
		height: 100px;
		width: 250px;
		margin: auto;
		text-align: center;
		font-size: 12px;
	}
	
</style>
</head>
<body>
	<!-- 알람창 카테고리 -->
	<div id="alram_area" align="center">
		<!-- 메인페이지 페이아이콘 클릭 시 iframe jsp -->
		<div id="alram_area_bottom">
			<h2>펫페이 : ${ petpayAmount }원</h2><br>
			<a target="_parent" href="myPetpayPoint.me?mno=${ loginMember.memberNo }">조회 / 충전하기</a>
		</div>
	</div>

</body>
</html>