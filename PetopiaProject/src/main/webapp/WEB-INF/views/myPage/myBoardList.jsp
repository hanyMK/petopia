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
	#myBoardList{
		border: 1px solid black;
		height: 100px;
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
						<a href="#" onclick="myBoardList();"><h6>내가 쓴 게시글</h6></a>
						<a href="#" onclick="myReplyList();"><h6>내가 쓴 댓글</h6></a>
					</div>
				</div>
				<div id="main_center_right_bottom">
					<c:forEach items="${ list }" var="b">
						<div id="myBoardList">
							${ b.category }<br>
							${ b.boardTitle }<br>
							${ b.boardContent }<br>
							${ b.createDate }<br>
						</div><br>
		            </c:forEach>					
				</div>
			</div>
		</div>
		<div id="main_right">
			
		</div>
		
	</div>
	
	<script>
	function myBoardList() {
		
		$.ajax({
			url : 'ajaxMyBoard.me', 
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				let value = "";
				for(let i in list) {
					console.log(list);
					value += '<div id="myBoardList">'							
						   + list[i].boardTitle + '<br>'
						   + list[i].boardContent + '<br>'
						   + list[i].createDate + '<br>'
						   + list[i].category + '<br>'
						   + '</div><br>';
				};
				$('#main_center_right_bottom').html(value);
				
			},
			error : function() {
				console.log('AJAX 댓글 조회 실팽이');
			}
		});
		
	};
	
	function myReplyList() {
		
		$.ajax({
			url : 'myReply.me', 
			data : { mno : ${ loginMember.memberNo } },
			success : function(list) {
				let value = "";
				for(let i in list) {
					console.log(list);
					value += '<div id="myBoardList">'							
						   + list[i].boardTitle + '<br>'
						   + list[i].replyContent + '<br>'
						   + list[i].createDate + '<br>'
						   + list[i].category + '<br>'
						   + '</div><br>';
				};
				$('#main_center_right_bottom').html(value);
				
			},
			error : function() {
				console.log('AJAX 댓글 조회 실팽이');
			}
		});
		
	};
	
	</script>

   
    <jsp:include page="../common/footer.jsp" />

</body>
</html>