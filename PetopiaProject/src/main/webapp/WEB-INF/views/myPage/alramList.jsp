<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	#alram_area_top{
		height: 10%;
		padding-top: 30px;
		padding-bottom: 30px;		
		}
		#alram_area_bottom{
			height:90%;
		}
		#myAlramList{
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

	<div id="alram_area">
		<div id="alram_area_top">
			<div align="center">
				<button onclick="myNoticeList();">공지사항</button>
				<button onclick="myShippingList();">상품/배송</button>
				<button onclick="myReplyList();">게시글/댓글</button>
				<button onclick="myCouponList();">쿠폰</button>
			</div>
		</div>
		<div id="alram_area_bottom">
			<c:forEach var="r" items="${ replyList }" >
				<div id="myAlramList">
					${r.category} <br>
					${r.createDate} <br>
					${r.boardTitle} <br>
					${r.nickname} <br>
					${r.replyContent} <br>
				</div><br>
            </c:forEach>	
		</div>
		
	</div>
	
	<script>
	
	function myReplyList() {
		
		$.ajax({
			url : 'ajaxAlramReply.me', 
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				let value = "";
				for(let i in list) {
					
					value += '<div id="myAlramList">'
						   + list[i].category + '<br>'
						   + list[i].createDate + '<br>'
						   + list[i].boardTitle + '<br>'
						   + list[i].nickname + '<br>'
						   + list[i].replyContent + '<br>'
						   + '</div><br>';
				};
				$('#alram_area_bottom').html(value);
				
			},
			error : function() {
				console.log('AJAX 댓글 조회 실팽이');
			}
		});
		
	};
	
	function myNoticeList() {
		
		$.ajax({
			url : 'alramNotice.me', 
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				let value = "";
				for(let i in list) {
						if(list[i].qnaYN = 'Y') {
						value += '<div id="myAlramList">'
							   + '답변이 완료되었습니다.'
							   + '</div><br>';
					}
				};
				$('#alram_area_bottom').html(value);
				
			},
			error : function() {
				console.log('AJAX 댓글 조회 실팽이');
			}
		});
		
	};
	
	function myShippingList() {
		
		$.ajax({
			url : 'alramShipping.me', 
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				let value = "";
				for(let i in list) {
					if(list[i].shippingSatatus = '배송중') {
						value += '<div id="myAlramList">'
							   + '주문하신 상품이 '
							   + list[i].shippingSatatus
							   + '입니다. </div><br>';
					}
				};
				
				$('#alram_area_bottom').html(value);
				
			},
			error : function() {
				console.log('AJAX 댓글 조회 실팽이');
			}
		});
		
	};
	
 function myCouponList() {
		
		$.ajax({
			url : 'alramCoupon.me', 
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				let value = "";
				for(let i in list) {
					if(list[i].couponName != '') {
						value += '<div id="myAlramList">'
							   + list[i].couponName
							   + '쿠폰이 발행되었습니다. </div><br>';
					}
				};
				
				$('#alram_area_bottom').html(value);
				
			},
			error : function() {
				console.log('AJAX 댓글 조회 실팽이');
			}
		});
		
	};
	</script>


</body>
</html>