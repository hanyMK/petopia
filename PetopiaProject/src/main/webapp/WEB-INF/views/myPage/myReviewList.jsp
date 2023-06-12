<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	#main_center_right_top{
		height: 10%;
		padding-top: 30px;
	}
	#main_center_right_top>div{
		margin: auto;
		text-align: center;
	}
	#main_center_right_bottom{
		height:90%;
	}
	#myReviewList{
		border: 1px solid black;
		height: 120px;
		width: 400px;
		margin: auto;
		text-align: center;
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
				<div id="main_center_right_top">
					<div algin="center">
						<a href="#" onclick="myReviewWriteList();"><h6>작성 가능한 리뷰</h6></a>
						<a href="#" onclick="myReviewList();"><h6>작성한 리뷰</h6></a>
					</div>
				</div>
				<div id="main_center_right_bottom">
					<c:forEach items="${ list }" var="r">
						<div id="myReviewList">
							상품 : ${ r.productTitle }<br>
							결제금액 : ${ r.productFinalPrice } 수량 : ${ r.amount }<br>
							배송상태 : ${ r.shippingStatus }<br>
							결제일자 : ${ r.receiptDate }<br>
							<a href=""><h6>리뷰 작성하기</h6></a>
						</div><br>
		            </c:forEach>					
				</div>
			</div>
		</div>
		<div id="main_right">
			
		</div>
		
	</div>
	
	

   
    <jsp:include page="../common/footer.jsp" />

</body>
</html>