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
						<a href="#" onclick="myReviewList();"><h6>작성 가능한 리뷰</h6></a>
						<a href="#" onclick="myReviewEndList();"><h6>작성한 리뷰</h6></a>
					</div>
				</div>
				<div id="main_center_right_bottom">
										
				</div>
			</div>
		</div>
		<div id="main_right">
			
		</div>
		
	</div>
	
	<script>
	$(document).ready(function(){
		myReviewList();
	})
	
	function myReviewList() {
		$.ajax({
			url : 'ajaxMyReviewList.me', 
			type : 'post',
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				let value = "";
				for(let i in list) {
					if(list[i].reviewNo == 0) {
						value += '<div id="myReviewList">';
						if(list[i].productNo != 0) {
							if(list[i].productNo != list[i].reviewProductNo){
							<!-- 배송상태가 있고, 리뷰의 상품번호랑 상품의 상품번호가 다르면 상품 리뷰 조회-->
							value += '<small style="color:green;">상품</small><br>'
								   + '상품 : ' + list[i].title + '<br>'
								   + '결제금액 : ' + list[i].finalPrice + '<br>'
								   + '결제일자 : ' + list[i].receiptDate + '<br>'
								   + '<a href="productReviewForm.me?memberNo=' + ${ loginMember.memberNo } 
								   											   + '&productNo=' + list[i].productNo 
								   											   + '&receiptNo=' + list[i].receiptNo + '">';
							}
						} else {
							<!-- 배송상태가 없으면 예약 리뷰 조회 -->
							value += '<small style="color:orange;">예약</small><br>'
								   + '예약 : ' + list[i].title + '<br>'
								   + '예약금액 : ' + list[i].finalPrice +'<br>';
								   
								   if( list[i].checkInOut != null) {
									   <!-- 호텔, 훈련 예약인 경우 checkInOut -->
									   value += '예약일자 : ' + list[i].checkInOut + '<br>';
									          
								   }
							value += '결제일자 : ' + list[i].receiptDate + '<br>'
								   + '<a href="reservationReviewForm.me?memberNo=' + ${ loginMember.memberNo } 
																				   + '&receiptNo=' + list[i].receiptNo + '">';
						}
						value += '<h6>리뷰 작성하기</h6></a>'
						       + '</div><br>';
					}
				};
				
				$('#main_center_right_bottom').html(value);
			},
			error : function() {
				console.log('AJAX 조회 실팽이');
			}
		});
	};
	
	function myReviewEndList() {
		
		$.ajax({
			url : 'myReviewEndList.me', 
			type : 'post',
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				let value = "";
				for(let i in list) {
					if(list[i].reviewNo != 0) {
						value += '<div id="myReviewList">';
						
						if(list[i].productNo != 0) {
							if(list[i].productNo == list[i].reviewProductNo) {
							// 배송상태가 있으면 상품 리뷰 조회
							value += '<small style="color:green;">상품</small><br>'
								   + '상품 : ' + list[i].title + '<br>'
								   + '결제금액 : ' + list[i].finalPrice +'<br>';
							}
						} else {
							// 배송상태가 없으면 예약 리뷰 조회
							value += '<small style="color:orange;">예약</small><br>'
								   + '예약 : ' + list[i].title + '<br>'
								   + '예약금액 : ' + list[i].finalPrice + '<br>';
								   
								   if( list[i].checkInOut != null) {
									   <!-- 호텔, 훈련 예약인 경우 checkInOut -->
									   value += '예약일자 : ' + list[i].checkInOut + '<br>';
								   } 
						}
						value += '결제일자 : ' + list[i].receiptDate + '<br>'
							   + '</div><br>';
					}
				};
				
				$('#main_center_right_bottom').html(value);
				
			},
			error : function() {
				console.log('AJAX 조회 실팽이');
			}
		});
		
	};
	</script>
	
   
    <jsp:include page="../common/footer.jsp" />

</body>
</html>