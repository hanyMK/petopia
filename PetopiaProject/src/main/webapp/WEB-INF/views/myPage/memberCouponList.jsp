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
		margin: auto;
	}
	#main_center_right_top>div{
		margin: auto;
		text-align: center;
	}
	#main_center_right_bottom{
		height:90%;
	}
	.myCouponList{
		border: 1px solid black;
		border-radius: 20px;
		height: 130px;
		width: 400px;
		margin: 20px;
		margin-left: 50px;
		text-align: center;
		float: left;
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
		var value = '';
		$(document).ready(() =>{ // 
			couponList(cpage);
		
		})
		
		$(() => {
			
			$('#main_center_right_bottom').on('click', '.myCouponList' ,e =>{
				var couponNo = $(e.target).find('.couponNo').val();
				console.log(couponNo);
				$.ajax({
					url : 'insertCoupon.me',
					type : 'post',
					data : {
						'memberNo' : ${loginMember.memberNo},
						'couponNo' : couponNo
					},
					success: result =>{
						console.log(result);
					},
					error : () =>{
						console.log('실패');
					}


				})
				
			})
		})
		
		function couponList(){
			
			$.ajax({
				url : 'couponList.me',
				type : 'post',
				data :{
					memberNo: 22,
					cpage: 1
				},
				success: result => {

					var cList = result.cList;
					var perfomance = result.result;
					var pi = result.pi;
					console.log(cList);
					for(var i in cList){
					
						
						value +=' <div class="myCouponList">' 
								+ '<input type="hidden" class="couponNo" value="' + cList[i].couponNo +'">'
								+ cList[i].couponName +'<br>';
								if(cList[i].couponType == 1){
									value += + cList[i].discount +'원<br>';
								}else{
									value += cList[i].discount +'%<br>';
								}
								
								if(cList[i].maxPrice == 0){
									value += '최소 사용 금액 : ' + cList[i].minPrice +'원<br>'
											+ cList[i].startDate +' ~ '
											+ cList[i].endDate +'<br>'
											+ '</div>';
								}else{
									value +=
											'최대 할인 금액 : ' + cList[i].maxPrice +'원<br>'
											+ '최소 사용 금액 :  ' + cList[i].minPrice +'원<br>'
											+ cList[i].startDate +' ~ '
											+ cList[i].endDate +'<br>'
											+ '</div>';
								}
					}
					$('#main_center_right_bottom').html(value);
					
				},
				error : () => {
					console.log('실패');
				}
			});
		}



		
	</script>

   
    <jsp:include page="../common/footer.jsp" />

</body>
</html>