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
        
        #myPage_left{ width:20% }
        #myPage_center{ width:60% }
        #myPage_right{ width:20% }
    </style>
</head>
<body>
    
    <jsp:include page="../common/header.jsp" />

    <div class="content" border="1">
		<div id="myPage_left">
		fdsa
		</div>        
		<div id="myPage_center">
		ddd
		</div>
		<div id="myPage_center">
		sss
		</div>
    </div>

   
    <jsp:include page="../common/footer.jsp" />

</body>
</html>