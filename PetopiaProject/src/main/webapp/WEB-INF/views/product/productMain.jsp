<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petopia 메인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<style>

	 /* 이미지 영역 사이즈 조절 */
	 .swiper {
        width: 1200px;
        height: 500px;
    }
    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;
    }
    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : white;
        /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
    }
	#product_create_btn_div{
		box-sizing: border-box;
		width: 1200px;
		height: 50px;
		margin: auto;
		padding: 4px;
		padding-left: 1100px;
	}
	#product_create_btn{
		width: 90px;
		height: 40px;
		font-size: 17px;
		background-color: #007BFF;
		color: white;
		border: none;
		border-radius: 5px;
	}
	#product_create_btn:hover{
		cursor: pointer;
		background-color: #248eff;
	}
	#product_select_category_div{
		box-sizing: border-box;
		width: 1200px;
		height: 50px;
		margin: auto;
	}
	#product_header{
		box-sizing: border-box;
		width: 1200px;
		height: 30px;
		margin: auto;
	}
	#product_content{
		box-sizing: border-box;
		width: 1200px;
		margin: auto;
		overflow:hidden;
	}
	.product{
		box-sizing: border-box;
		width: 25%;
		height: 400px;
		float: left;
	}
	.product_1{
		box-sizing: border-box;
		width: 90%;
		height: 90%;
		margin: 15px;
	}
	.product_1:hover{
		cursor: pointer;
		filter:hue-rotate(180deg);
	}
	.product_1_1{
		box-sizing: border-box;
		width: 100%;
		height: 85%;
	}
	.product_1_2{
		box-sizing: border-box;
		width: 100%;
		height: 15%;
	}
	.product_upfile{
		width: 100%;
		height: 100%;
	}


</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

	<div id="content_1">
		<!-- Slider main container -->
		<div class="swiper">
			<!-- Additional required wrapper -->
			<div class="swiper-wrapper">
				<!-- Slides -->
				<div class="swiper-slide"><img src="https://bananab2b.co.kr/data/bananab2b/editor/202305/RLGHLRWJS.jpg"></div>
				<div class="swiper-slide"><img src="resources/images/crong1.jpg"></div>
				<div class="swiper-slide"><img src="resources/images/crong2.jpg"></div>
				<div class="swiper-slide"><img src="resources/images/crong3.jpg"></div>
			</div>
		
			<!-- If we need pagination -->
			<div class="swiper-pagination"></div>
		
			<!-- If we need navigation buttons -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		
			<!-- If we need scrollbar -->
			<div class="swiper-scrollbar"></div>
		</div>
	</div>

	<div id="product_create_btn_div">
		<c:set var="name" value="${sessionScope.loginMember.email}" />

		<c:if test="${ name == 'admin@email.com' }">
			<button id="product_create_btn">상품관리</button>
		</c:if>
	</div>

	<div id="product_select_category_div">
		<button>전체</button>
		<button>애견용품</button>
		<button>애견식품</button>
		<button>애견의류</button>

		<input type="text"><button>검색</button>
	</div>

	<div id="product_header">
		조회순 낮은가격순 높은가격순
	</div>

	<div id="product_content">
		<!-- <div class="product">
			<div class="product_1">
				<div class="product_1_1">
					<img id="product_upfile" src="https://mongliebe.com/web/product/medium/202304/a5566c293a82534a60fbe01ebf0ca966.png">
				</div>
				<div class="product_1_2">
					안녕하세요.안녕하세요. <br>
					12000원
				</div>
			</div>
		</div> -->
	</div>

	<jsp:include page="../common/footer.jsp"/>

	<script>
		const swiper = new Swiper('.swiper', {
          autoplay : {
              delay : 3000 // 3초마다 이미지 변경
          },
          loop : true, //반복 재생 여부
          slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
          pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
              el: '.swiper-pagination',
              clickable: true
          },
          navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
              prevEl: '.swiper-button-prev',
              nextEl: '.swiper-button-next'
          }
      }); 
	</script>

	<script>
		$(function(){
			selectProductList();
		})

		function selectProductList(){
			$.ajax({
				url : 'productAjax.pd',
				success : function(list){
					
					var value = '';
					
					for(let i in list){
						console.log(list[i].filePath + list[i].changeName)

						value += '<div class="product">'
							   + 	'<div class="product_1">'
							   + 		'<div class="product_1_1">'
							   +           '<div hidden class="bno">' + list[i].productNo + '</div>'
							   + 			'<img class="product_upfile" src="'+ list[i].filePath + list[i].changeName +'">'
							   + 		'</div>'
							   + 		'<div class="product_1_2">'
							   +       '<div>'+ list[i].productTitle +'</div>'
							   +       '<div>가격 : '+ list[i].productPrice +'</div>'
							   + 		'</div>'
							   + 	'</div>'
							   + '</div>';
					};
					
					$('#product_content').html(value);
				},
				error : function(){

				}
			});
		}
	</script>

	<script>
		$('#product_create_btn').click(function(){
			location.href='productManagement.pd';
		});
		$('#product_content').on('click', '.product_1' , (function(){
		 	location.href='detail.pd?bno=' + $(this).find('.bno').html();
		}));
	</script>
</body>
</html>