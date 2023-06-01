<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        width: 100%;
        height: 600px;
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

	#main{
		box-sizing: border-box;
		width: 100%;
		height: 1000px;
		margin: auto;
	}

	#main_left{
		width:20%; 
		height:100%;
		border: 1px solid black;
		box-sizing: border-box;
		float: left;
		}
	#main_center{
		width:60%; 
		height:100%;
		border: 1px solid black;
		box-sizing: border-box;
		float: left;
		}
	#main_right{
		width:20%; 
		height:100%;
		border: 1px solid black;
		box-sizing: border-box;
		float: left;
		}
</style>
</head>
<body> 

	<jsp:include page="common/header.jsp"/>
	
	
	<div id="swiper-area">
		<!-- Slider main container -->
		<div class="swiper">
			<!-- Additional required wrapper -->
			<div class="swiper-wrapper">
				<!-- Slides -->
				<div class="swiper-slide"><img src="https://wallpaperaccess.com/full/2461292.jpg"></div>
				<div class="swiper-slide"><img src="https://wallpaperaccess.com/full/2461292.jpg"></div>
				<div class="swiper-slide"><img src="https://wallpaperaccess.com/full/2461292.jpg"></div>
			   
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
	
	<div id="main">
		<div id="main_left">
		
		</div>
		<div id="main_center">
			
		</div>
		<div id="main_right">
		
		</div>
		
	</div>
		
	
	<jsp:include page="common/footer.jsp"/>

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

</body>
</html>