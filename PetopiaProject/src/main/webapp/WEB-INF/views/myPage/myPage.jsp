<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>myPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	
    .content {
        background-color:rgb(247, 245, 245);
        width:80%;
        height:800px;
        margin:auto;
        border:1px solid lightgray;
    }
    .innerOuter {
        border:1px solid lightgray;
        width:80%;
        margin:auto;
        padding:5% 10%;
        background-color:white;
    }
	#main_center_left{
		width:20%; 
		height:100%;
		border: 1px solid black;
		box-sizing: border-box;
		float: left;
	}
	#main_center_right{
		width:80%; 
		height:100%;
		border: 1px solid black;
		box-sizing: border-box;
		float: left;
	}
		
</style>
</head>
<body>
    
    <jsp:include page="../common/header.jsp" />

    <div id="main">
		<div id="main_left">
		
		</div>
		<div id="main_center">
			<div id="main_center_left">
				<jsp:include page="myPageNavi.jsp" />
			</div>
			<div id="main_center_right">
				<div id="main_center_right_1">
					dfa
				</div>
			
			</div>
		</div>
		<div id="main_right">
		
		</div>
		
	</div>

   
    <jsp:include page="../common/footer.jsp" />

</body>
</html>