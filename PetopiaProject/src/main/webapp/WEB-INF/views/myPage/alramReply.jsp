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
			console.log(list);
				let value = "";
				for(let i in list) {
					value += '<tr>'
						   + '<th>' + list[i].category + '</th>'
						   + '<th>' + list[i].createDate + '</th>'
						   + '<th>' + list[i].boardTitle + '</th>'
						   + '<th>' + list[i].nickname + '</th>'
						   + '<th>' + list[i].replyContent + '</th>'
						   + '</tr>';
				};
				$('#myAlramList').html(value);
				
			},
			error : function() {
				console.log('AJAX 댓글 조회 실팽이');
			}
			
		});
		
	};
	</script>


</body>
</html>