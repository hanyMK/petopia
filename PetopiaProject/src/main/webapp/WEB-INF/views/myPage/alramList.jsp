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
	/*
	배송 : 컬럼올 => 배송중, 상품준비중, 배송완료
	문의 : y 답변 완료
	쿠폰 : 쿠폰 이름 "왔다"
	*/
	function myAlramList() {
		
		$.ajax({
			url : 'ajaxAlram.me',
			success : function(list) {
				let value = "";
				for(let i in list) {
					value += '<div><div id="myList">';
					// columnAll이 null이면 댓글 조회 
					if(list[i].columnAll == null) {
					
					value += list[i].dateAll + '<br>'
						   + '제목 : ' + list[i].boardTitle + '<br>'
						   + '댓글 단 사람 : ' + list[i].nickname + '<br>'
						   + '내용 : ' + list[i].replyContent + '<br>'
						   + '<input type="hidden" value="댓글">';
						   
					} else if(list[i].columnAll != null && list[i].columnAll == '배송중') {
						value += list[i].columnAll + '입니다.'
							   + '<input type="hidden" value="배송">';
					} else if(list[i].columnAll != null && list[i].columnAll == '상품준비중') {
						value += '상품준비중 입니다.'
							   + '<input type="hidden" value="배송">';
					} else if(list[i].columnAll != null && list[i].columnAll == '배송완료') {
						value += '배송완료되었습니다.'
							   + '<input type="hidden" value="배송">';
					} else if(list[i].columnAll != null && list[i].columnAll == 'Y') {
						value += '1:1 답변이 등록되었습니다.'
							   + '<input type="hidden" value="문의">';
					} else {
						value += list[i].columnAll + ' 쿠폰이 발행되었습니다.'
							   + '<input type="hidden" value="쿠폰">';
					}
					
					value += '</div>'
						   + '<button class="delBtn" id="' + list[i].primaryNo + '">X</button>'
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
		
		var category = $(this).siblings('div[id=myList]').children('input[type=hidden]').val();
		var delNo = $(this).attr('id');
		
		delNo = category == '댓글' ? delNo = delNo.split(',')[1] : delNo ;
		
		
		console.log(category);
		//console.log(delNo);
		
		$.ajax({
			url : 'deleteAlram.me',
			data : { delNo : delNo, category : category },
			success : function(result) {
				if(result!=0){
					console.log(result);
					console.log("성공해쪄");
				}
				
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
					value += '<div><div id="myList">'
						   + '주문하신 상품이 ';
					if(list[i].shippingStatus == '배송중') {
						value += list[i].shippingStatus;
					} else if (list[i].shippingStatus == '상품준비중') {
						value += list[i].shippingStatus;
					} else if (list[i].shippingStatus == '배송완료') {
						value += list[i].shippingStatus;
					}
					value += '입니다.'
						   + '<input type="hidden" value="배송">'
						   + '</div>'
					       + '<button class="delBtn" id="' + list[i].shippingNo + '">X</button>'
					       + '</div><br>';
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
					value += '<div><div id="myList">'
						   + list[i].createDate + '<br>'
						   + '제목 : ' + list[i].boardTitle + '<br>'
						   + '댓글 단 사람 : ' + list[i].nickname + '<br>'
						   + '내용 : ' + list[i].replyContent + '<br>'
						   + list[i].boardNo + list[i].replyNo 
						   + '<input type="hidden" value="댓글">'
						   + '</div>'
						   + '<button class="delBtn" id="' + list[i].boardNo +","+ list[i].replyNo + '">X</button>'
						   + '</div><br>';
				};
				$('#alram_area_bottom').html(value);
				
			},
			error : function() {
				console.log('AJAX 댓글 조회 실팽이');
			}
		});
		
	};
	
	
	/* 쿠폰, 문의 들어온 거 알람 */
 	function alramNoticeList() {
		
		$.ajax({
			url : 'alramNotice.me', 
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				let value = "";
				for(let i in list) {
					if(list[i].qnaYN != '') {
						value += '<div><div id="myList">';
						
						if(list[i].columnAll == 'Y') {
							value += '답변이 완료되었습니다.'
								   + '<input type="hidden" value="문의">';
						} else {
							value += list[i].columnAll + ' 이 발행되었습니다.'
								   + '<input type="hidden" value="쿠폰">';
						}
						value += '</div>'
							   + '<button class="delBtn" id="' + list[i].primaryNo + '">X</button>'
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
	</script>
	
	<script>
		// 알람 상세 조회
		$(function() {
			$('#alram_area_bottom').on('click', '#myList', function() {
				
				var category = $(this).children('input[type=hidden]').val();
				var primaryNo = $(this).siblings('button[class="delBtn"]').attr('id');
				
				primaryNo = category == '댓글' ? primaryNo = primaryNo.split(',')[0] : primaryNo ;
				
				console.log(primaryNo);
				
				if(category == '쿠폰') {
					//parent.location.href = "memberCouponList.me"; 
				} else if(category == '배송'){
					//parent.location.href = "orderDetail.me?receiptNo=" + primaryNo;
				} else if(category="댓글"){
					//parent.location.href = "detail.bo?bno=" + primaryNo; 
				} else if(category="문의"){
					//parent.location.href = ""; 
				}
					
			})
		});
	
	</script>


</body>
</html>