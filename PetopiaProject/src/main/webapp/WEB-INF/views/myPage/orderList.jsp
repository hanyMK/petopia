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
					<h2>배송목록 조회</h2>
				</div>
				<div id="main_center_right_bottom">
							
				</div>
			</div>
		</div>
		<div id="main_right">
			
		</div>
		
	</div>
	
	<script>
		var cpage = 1;
		var value='';
		$(document).ready(() =>{
			selectOrderList(cpage);
		})
		
		function selectOrderList(cpage){
			$.ajax({
				url: 'selectOrderList.me',
				data: {
					memberNo :${sessionScope.loginMember.memberNo},
					currentPage: cpage
				},
				success : list =>{
					console.log(list);
					for(var i in list) {
						console.log(list);
						value += '<div id="myOrderList">'	
							   +'<div>' 
							   + '<img scr="'+ list[i].filePath + '">'
							   +'</div>' 
							   +'<div>' 
							   + '상품명 : ' + list[i].productTitle + '<br>'
							   + '결제 금액 : ' + list[i].resultPrice + '<br>'
							  
							   +'</div>' 
							   +'<div>' 
							   +'</div>' 
							   + '</div><br>';
					};
					$('#main_center_right_bottom').html(value);
				},
				error: () =>{
					console.log('실패');
				}
			})
		}
	
	
	</script>

   
    <jsp:include page="../common/footer.jsp" />

</body>
</html>