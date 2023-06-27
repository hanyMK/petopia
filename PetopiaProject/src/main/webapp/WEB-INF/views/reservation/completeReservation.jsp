<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
	<!-- <link rel="stylesheet" type="text/css" href="resources/css/reservation/reservationCalendar.css">  -->
<style>

	#info{
		border : 1px solid black;
		width : 70%;
		margin : auto;
		padding-bottom : 20px;
		padding-left : 20px;
	}
	
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div id="main">
	
		<div id="main_left"></div>
		
		<div id="main_center">
		
			<div id="wrap">
		
			<h3 align="center"> 예약 완료</h3>
			
			<h2 align="center"> ✔ 예약이 확정 되었습니다.</h2>
			
			<div id="info">
				<h4 align="center">예약 정보</h4>
				<ul style="list-style:none;">
					<li>날짜/시간  : ${r.checkIn} / ${r.reservationTime}</li>
					<li>담당자 : ${r.employeeName} </li>
					<li>예약자  : ${r.reservationName} </li>
					<li>연락처  : ${r.reservationPhone} </li>
				 </ul>
			</div>
               
             <br>
               
			<div id="info">
				<h4 align="center">결제 정보</h4>	
				<ul style="list-style:none;">
					<li> 기본금액 : ${r.reservationFee}원 </li>		
					<li> 사용 쿠폰 : {r.couponNo}</li>	
					<li> 사용 적립금 : - ${point}p </li>	
					<li> 최종결제금액 : ${r.finalTotalFee}원	</li>		
				 </ul>
			</div>
			
			</div>
			
			<a href="reservationReviewForm.me?memberNo=' + ${ loginMember.memberNo }
		   + '&receiptNo=' + ${r.reservationNo } + '">'
		   + '<h6>리뷰 작성하기</h6></a>
			
				
		</div>
		<%-- main_center 끝 --%>
		
		<div id="main_right"></div>
	
		<jsp:include page="../common/footer.jsp"/>

	</div>
	
</body>
</html>