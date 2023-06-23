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
		</div>
		
	</div>
	
	<script>
	
	$(document).ready(function() {
		myAlramList();
		

	});
	
	/* 전체 알람 */
	function myAlramList() {
		
		$.ajax({
			url : 'ajaxAlram.me',
			success : function(list) {
				let value = "";
				for(let i in list) {
					// columnAll이 null이면 댓글 조회 
					if(list[i].columnAll == null) {
					
					value += '<div id="myList">'
						   + list[i].dateAll + '<br>'
						   + '제목 : ' + list[i].boardTitle + '<br>'
						   + '댓글 단 사람 : ' + list[i].nickname + '<br>'
						   + '내용 : ' + list[i].replyContent + '<br>'
						   + '<input type="hidden" value="댓글">';
						   
					} else if(list[i].columnAll != null && list[i].columnAll == '배송중') {
						value += '<div id="myList">'
							   + '배송중 입니다.'
							   + '<input type="hidden" value="배송">';
					} else if(list[i].columnAll != null && list[i].columnAll == '상품준비중') {
						value += '<div id="myList">'
							   + '상품준비중 입니다.'
							   + '<input type="hidden" value="배송">';
					} else if(list[i].columnAll != null && list[i].columnAll == '배송완료') {
						value += '<div id="myList">'
							   + '배송완료되었습니다.'
							   + '<input type="hidden" value="배송">';
					} else if(list[i].columnAll != null && list[i].columnAll == 'Y') {
						value += '<div id="myList">'
							   + '1:1 답변이 등록되었습니다.'
							   + '<input type="hidden" value="문의">';;
					} else {
						value += '<div id="myList">'
							   + list[i].columnAll + ' 쿠폰이 발행되었습니다.'
							   + '<input type="hidden" value="쿠폰">';;
					}
					
					value += '<span class="delBtn" id="' + list[i].primaryNo + '">X</span>'
						  + '</div><br>';
				};
				$('#alram_area_bottom').html(value);
				
			},
			error : function() {
				console.log('AJAX 댓글 조회 실팽이');
			}
		});
		
	};
	
	// 알람 삭제 함수
	$(document).on("click", ".delBtn", function() {
		$(this).parent().remove();
		
		var category = $(this).siblings('input[type=hidden]').val();
		var delNo = $(this).attr('id');
		
		console.log(category);
		console.log(delNo);
		$.ajax({
			url : 'deleteAlram.me',
			data : { delNo : delNo, category : category },
			success : function(result) {
				console.log("성공해쪄");
			},
			error : function() {
				console.log('AJAX 댓글 조회 실팽이');
			}
		
		});
		
		
	});

		
	/* 상품 배송출발 알람 */
	function alramShippingList() {
		
		$.ajax({
			url : 'alramShipping.me', 
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				let value = "";
				for(let i in list) {
					if(list[i].shippingStatus == '배송중') {
						value += '<div id="myList">'
							   + '주문하신 상품이 '
							   + list[i].shippingStatus;
							
					} else if (list[i].shippingStatus == '상품준비중') {
						value += '<div id="myList">'
							   + '주문하신 상품이 '
							   + list[i].shippingStatus;
					} else if (list[i].shippingStatus == '배송완료') {
						value += '<div id="myList">'
							   + '주문하신 상품이 '
							   + list[i].shippingStatus;
					}
					value += '<input type="hidden" value="배송">'
					       + '<span class="delBtn" id="' + list[i].shippingNo + '">X</span>'
					       + '입니다. </div><br>';
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
					console.log(list[i].replyNo);
					value += '<div id="myList">'
						   + list[i].dateAll + '<br>'
						   + '제목 : ' + list[i].boardTitle + '<br>'
						   + '댓글 단 사람 : ' + list[i].nickname + '<br>'
						   + '내용 : ' + list[i].replyContent + '<br>'
						   + '<input type="hidden" value="댓글">'
						   + '<span class="delBtn" id="' + list[i].replyNo + '">X</span>'
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
								   + '<input type="hidden" value="문의">'
								   + '<span class="delBtn" id="' + list[i].primaryNo + '">X</span>'
								   + '</div><br>';
						} else {
							value += '<div id="myList">'
								   + list[i].columnAll + ' 쿠폰이 발행되었습니다.'
								   + '<input type="hidden" value="쿠폰">'
								   + '<span class="delBtn" id="' + list[i].primaryNo + '">X</span>'
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