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
		padding-left: 10px;	
	}
	#alram_area_bottom{
		height:90%;
	}
	#myList{
	display: inline-block;
		border: 1px solid black;
		height: 100px;
		width: 250px;
		margin: auto;
		text-align: center;
		font-size: 12px;
	}
	.delBtn{
		display: inline;
	}
</style>
</head>
<body>
	
	<!-- 알람창 카테고리 -->
	<div id="alram_area">
		<div id="alram_area_top">
			<div align="center">
				<button class="btn btn-sm" onclick="myAlramList();">전체</button>
				<button onclick="alramShippingList();">상품/배송</button>
				<button onclick="alramReplyList();">댓글</button>
				<button onclick="alramCouponList();">쿠폰</button>
			</div>
		</div>
		<!-- 메인페이지 알람아이콘 클릭 시 iframe jsp -->
		<div id="alram_area_bottom">
		</div>
		
	</div>
	
	<script>
	
	$(document).ready(function(){
		myAlramList();
	});
	
	/* 전체 알람 */
	function myAlramList() {
		
		$.ajax({
			url : 'ajaxAlram.me',
			success : function(list) {
				let value = "";
				for(let i in list) {
					value += '<div>'
						   + '<div id="myList">';
					if(list[i].columnAll == null) {
						value += '제목 : ' + list[i].title + '<br>'
							   + '댓글 단 사람 : ' + list[i].nickname + '<br>'
							   + '내용 : ' + list[i].replyContent + '<br>'
							   + '<input type="hidden" value="댓글">'
							   + '</div>'
							   +'<button class="delBtn" id="' + list[i].primaryNo + "," + list[i].replyNo + '">X</button>';
					} else {
						if(list[i].columnAll == '배송중' || list[i].columnAll == '상품준비중' || list[i].columnAll == '배송완료') {
							value += list[i].dateAll + ' 에 구매하신 <br>'
								   + '[ ' + list[i].title + ' ] 상품이 '
								   + list[i].columnAll + '입니다' 
						   	   + '<input type="hidden" value="배송">';
							} else if(list[i].columnAll == 'Y') {
								value += '1:1 답변이 등록되었습니다.'
									   + '<input type="hidden" value="문의">';
							} else {
								value += list[i].columnAll + ' 쿠폰이 발행되었습니다.'
									   + '<input type="hidden" value="쿠폰">';
							}
							value += '</div>'
							 	   + '<button class="delBtn" id="' + list[i].primaryNo + '">X</button>';
						} 
					value += '</div><br>';
				};
				$('#alram_area_bottom').html(value);
				
			},
			error : function() {
				console.log('AJAX 댓글 조회 실팽이');
			}
		});
		
	};
	
	/* 배송 알람 */
	function alramShippingList() {
		
		$.ajax({
			url : 'alramShipping.me', 
			success : function(list) {
				let value = "";
				for(let i in list) {
					
					value += '<div><div id="myList">'
						   + list[i].receiptDate + ' 에 구매하신 <br>'
						   + '[ ' + list[i].productTitle + ' ] 상품이 '
						   + list[i].shippingStatus + '입니다'
						   + '<input type="hidden" value="배송">'
						   + '</div>'
					       + '<button class="delBtn" id="' + list[i].shippingNo + '">X</button>'
					       + '</div><br>';
				};
				
				$('#alram_area_bottom').html(value);
				
			},
			error : function() {
				console.log('AJAX 배송 조회 실팽이');
			}
		});
		
	};
	
	/* 댓글 알람 */
	function alramReplyList() {
		
		$.ajax({
			url : 'alramReply.me', 
			success : function(list) {
				let value = "";
				for(let i in list) {
					console.log(list[i].replyNo);
					value += '<div><div id="myList">'
						   + list[i].createDate + '<br>'
						   + '제목 : ' + list[i].boardTitle + '<br>'
						   + '댓글 단 사람 : ' + list[i].nickname + '<br>'
						   + '내용 : ' + list[i].replyContent + '<br>'
						   + '<input type="hidden" value="댓글">'
						   + '</div>'
						   + '<button class="delBtn" id="' + list[i].boardNo +","+ list[i].replyNo + '">X</button>'
						   + '</div><br>';
				};
				$('#alram_area_bottom').html(value);
				
			},
			error : function() {
				console.log('AJAX 댓글 조회 실패');
			}
		});
		
	};
	
	
	/* 쿠폰 알람 */
 	function alramCouponList() {
		
		$.ajax({
			url : 'alramCoupon.me', 
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
	
	/* 알람 삭제 */
	$(document).on("click", ".delBtn", () =>{
		$(this).parent().remove();
		
		var category = $(this).siblings('div[id=myList]').children('input[type=hidden]').val();
		var delNo = $(this).attr('id');
		console.log(delNo);
		
		delNo = category == '댓글' ? delNo = delNo.split(',')[1] : delNo;
		
		console.log("삭제번호 : " + delNo);
		console.log("카테고리 : " + category);
		
		$.ajax({
			url : 'deleteAlram.me',
			data : { delNo : delNo, 
					 category : category
			},
			type : 'post',
			success : function(result) {
				if(result != 0) {
					console.log("AJAX 알림 삭제 성공");
				}
			},
			error : function() {
				console.log('AJAX 알림 삭제 실패');
			}
		
		});
		
	});
	
	/* 알림 상세 조회 */
	$(function() {
		$('#alram_area_bottom').on('click', '#myList', function() {
			
			var category = $(this).children('input[type=hidden]').val();
			var primaryNo = $(this).siblings('button[class="delBtn"]').attr('id');
			
			primaryNo = category == '댓글' ? primaryNo = primaryNo.split(',')[0] : primaryNo ;
			
			console.log(primaryNo);
			
			if(category == '쿠폰') {
				parent.location.href = "memberCouponList.me"; 
			} else if(category == '배송'){
				parent.location.href = "orderDetail.me?receiptNo=" + primaryNo;
			} else{
				parent.location.href = "detail.bo?bno=" + primaryNo; 
			} 
		})
	});
	
	</script>


</body>
</html>