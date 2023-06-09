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
	<div id="alram_area">
		<div id="alram_area_top">
			<div align="center">
				<button onclick="myAlramList();">전체</button>
				<button onclick="alramShippingList();">상품/배송</button>
				<button onclick="alramReplyList();">게시글/댓글</button>
				<button onclick="alramNoticeList();">공지사항</button>
			</div>
		</div>
		<!-- 메인페이지 알람아이콘 클릭 시 iframe jsp -->
		<div id="alram_area_bottom">
			<c:forEach var="l" items="${ list }" >
				<div id="myList">
					${l.columnAll} <br>
					${l.dateAll} <br>
					${l.category} <br>
					${l.boardTitle} <br>
					${l.nickname} <br>
					${l.replyContent} <br>
				</div><br>
            </c:forEach>	
		</div>
		
	</div>
	
	<script>
	
	/* 전체 알람 */
	function myAlramList() {
		
		$.ajax({
			url : 'ajaxAlram.me', 
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				let value = "";
				for(let i in list) {
					console.log(list);
					// columnAll이 null이면 댓글 조회 
					if(list[i].columnAll == null) {
					
					value += '<div id="myList">'							
						   + list[i].columnAll + '<br>'
						   + list[i].dateAll + '<br>'
						   + list[i].category + '<br>'
						   + list[i].boardTitle + '<br>'
						   + list[i].nickname + '<br>'
						   + list[i].replyContent + '<br>'
						   + '</div><br>';
					} else if(list[i].columnAll != null && list[i].columnAll == '배송중') {
						value += '<div id="myAlramList">'
							   + '배송중 입니다.'
							   + '</div><br>';
					} else if(list[i].columnAll != null && list[i].columnAll == '상품준비중') {
						value += '<div id="myAlramList">'
							   + '상품준비중 입니다.'
							   + '</div><br>';
					} else if(list[i].columnAll != null && list[i].columnAll == 'Y') {
						value += '<div id="myAlramList">'
							   + '1:1 답변 완료.'
							   + '</div><br>';
					} else {
						value += '<div id="myAlramList">'
							   + '쿠폰 들어옴.'
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
	
	/* 상품 배송출발 알람 */
	function alramShippingList() {
		
		$.ajax({
			url : 'alramShipping.me', 
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				console.log(list);
				let value = "";
				for(let i in list) {
					if(list[i].shippingStatus == '배송중') {
						value += '<div id="myList">'
							   + '주문하신 상품이 '
							   + list[i].shippingStatus
							   + '입니다. </div><br>';
					} else if (list[i].shippingStatus == '상품준비중') {
						value += '<div id="myAlramList">'
							   + '주문하신 상품이 '
							   + list[i].shippingStatus
							   + '입니다. </div><br>';
					} else if (list[i].shippingStatus == '배송완료') {
						value += '<div id="myAlramList">'
							   + '주문하신 상품이 '
							   + list[i].shippingStatus
							   + '되었습니다. </div><br>';
					}
				};
				
				$('#alram_area_bottom').html(value);
				
			},
			error : function() {
				console.log('AJAX 댓글 조회 실팽이');
			}
		});
		
	};
	
	/* 댓글 알람 */
	function alramReplyList() {
		
		$.ajax({
			url : 'alramReply.me', 
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				let value = "";
				for(let i in list) {
					console.log(list);
					value += '<div id="myList">'							
						   + list[i].columnAll + '<br>'
						   + list[i].dateAll + '<br>'
						   + list[i].category + '<br>'
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
	
	
	/* 쿠폰 들어온 거 알람 */
 	function alramNoticeList() {
		
		$.ajax({
			url : 'alramNotice.me', 
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				console.log(list);
				let value = "";
				for(let i in list) {
					if(list[i].qnaYN != '') {
						if(list[i].columnAll == 'Y') {
							value += '<div id="myList">'
								   + '답변이 완료되었습니다.'
								   + '</div><br>';
						} else {
							value += '<div id="myAlramList">'
								   + list[i].columnAll + ' 쿠폰이 발행되었습니다.'
								   + '</div><br>';
						}
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