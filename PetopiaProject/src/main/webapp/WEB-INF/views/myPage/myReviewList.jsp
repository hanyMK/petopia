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
						<!-- reviewNo = 0 이면 리뷰 작성 전 -->
						<c:if test="${ r.reviewNo eq 0 }">
							<div id="myReviewList">
								<!-- 상품리뷰인 경우 -->
								<c:choose>
									<c:when test="${ not empty r.shippingStatus }">
										상품 : ${ r.title }<br>
										결제금액 : ${ r.finalPrice } 수량 : ${ r.details }<br>
										배송상태 : ${ r.shippingStatus }<br>
										결제일자 : ${ r.receiptDate }<br>
										<a href="insertProductReview.me"><h6>리뷰 작성하기</h6></a>
									</c:when>
									<c:otherwise>
										예약 : ${ r.title }<br>
										예약금액 : ${ r.finalPrice } 선생님 : ${ r.details }<br>
										<!-- 호텔, 훈련 예약인 경우 checkInOut -->
										<c:choose>
											<c:when test="${ not empty r.checkInOut }">
												예약일자 : ${ r.checkInOut }<br>
											</c:when>
											<c:otherwise>
												예약일자 : ${ r.receiptDate }<br>
											</c:otherwise>
										</c:choose>
										<a href="insertReservationReview.me"><h6>리뷰 작성하기</h6></a>
									</c:otherwise>
								</c:choose>
							</div><br>
						</c:if>
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