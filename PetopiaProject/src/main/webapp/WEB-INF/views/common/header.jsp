<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 (펫페이 충전, 쿠폰발급) -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Alertify Framework -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
 	

    <style>
    	@font-face {
		  font-family: "font1";
		  src: url("resources/fonts/PoorStory-Regular.ttf");
		}
		
		* {
			font-family : "font1"
		}
		
		
        div {box-sizing:border-box;} 
        #header {
            width:1200px;
            height:180px;
            padding-top:20px;
            margin:auto;
        }
        #header>div {width:100%;}
        #header_1 {height:70%;}
        #header_2 {height:30%;}

        #header_1>div{
            height:100%;
            float:left;
        }
        #header_1_left {width:30%; position:relative;}
        #header_1_center {width:40%;}
        #header_1_right {width:30%; float: right;}
        #header_1_right > a {font-size : 20px}

        #header_1_left>img {height:100%; position:absolute; margin:auto; top:0px; bottom:0px; right:0px; left:0px;}
        #header_1_right {text-align:right; line-height:35px; font-size:12px; text-indent:35px;}
        #header_1_right>a {margin:5px;}
        #header_1_right>a:hover {cursor:pointer;}
        #header_1_right_bottom {padding-top: 10px;}

        #header_2>ul {width:100%; height:100%; list-style-type:none; margin:auto; padding:0;}
        #header_2>ul>li {float:left; width:13%; height:100%; line-height:55px; text-align:center;}
        #header_2>ul>li a {text-decoration:none; color:black; font-size:18px; font-weight:900;}

        #header_2 {border-bottom:1px solid lightgray; padding-left: 130px;}

        #header a {text-decoration:none; color:black;}

        /* 세부페이지마다 공통적으로 유지할 style */
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        /*--------------------------------------------------------------------------------*/

        /* 네비 스타일 */
        #navi{
            list-style : none;
            /* ul요소는 기본적으로 위, 아래 marign이 존재 왼쪽에는 padding도 있음 */
            margin : 0px;
            padding : 0px;
            height : 100%;
        }

        #navi > li{
            float : center;
            height : 100%;
            text-align : center;
        }

        #navi a{
            text-decoration : none;
            color : forestgreen;
            font-weight : 800;
            width : 100%;
            height : 100%; /* a태그는 인라인요소기 때문에 width, height속성이 적용 X */
            display : block; /* 인라인 요소를 블록으로 바꿔줌 */
            /*vertical-align : middle;*/
            line-height : 35px; /* 줄간격속성 px / % / em */
        }

        #navi a:hover{
            font-size : 17px;
            color : rgb(16, 85, 16);
        }

        #navi > li > ul{
            list-style : none;
            padding : 0px;
            display:none; /* 평소에는 안보이다가 마우스가 올라가는 순간 펼쳐지는 효과 1 */
        }

        #navi > li > a:hover + ul {
            display : block;  /* 평소에는 안보이다가 마우스가 올라가는 순간 펼쳐지는 효과 2 */
        }

        #navi > li > ul:hover {
            display : block; /* 평소에는 안보이다가 마우스가 올라가는 순간 펼쳐지는 효과 3 */
        }

        #navi > li > ul a{font-size : 11px;}
        #navi > li > ul a:hover{font-size : 14px;}
        
        /* 메인 공통 스타일 div 규격 */
        #main{
		box-sizing: border-box;
		width: 100%;
		/* height: 1000px; */
		height : 1500px;
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
			
		/* 헤더 알람 / 페이 */
		#alram_box, #pay_box{
			display: none;
			vertical-align: bottom;
			position: absolute;
			z-index: 2;
		}
		
		#alramIcon, #payIcon, #cartIcon{
			background-color:transparent;
			border:0px;
			padding-right:15px;
		}
		
		#alramIcon:hover, #payIcon:hover, #cartIcon:hover {
			cursor: pointer;
		}
		
		#alramIframe{
			width:350px;
			height:500px;
			background-color:white;
		}
		
		#payIframe{
			width:250px;
			height:180px;
			background-color:white;
		}
		
		/* 알람 jsp */
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
		#cartIcon{
			height: 30px;
			width: 30px;
		}
        #div1{
            position: fixed;
            top: 800px;
            /* width: 100% */
            left: 900px;
            right: 10px;
            border: 1px solid black;
            width: 100px;

        }
		
		#fixed_menu_border{
			position: fixed;
			left: 1800px;
			top: 800px;
			right:0px;
			text-align:center;
		}
		
		#fixed_menu_content{
			height:70px;
			width:70px;
			background-color:orange;
			border-radius:50%;
		}
		
		#fixed_menu_content>a {
			font-size:50px;
			padding-top:10px;
			padding-left:10px;
		}
	 
    </style>

	<!-- 아이콘 사용 라이브러리 -->
	<script src="https://kit.fontawesome.com/280c5da56d.js" crossorigin="anonymous"></script>
</head>
<body>



   	<c:if test="${ not empty alertMsg }">
	<script type="text/javascript">
	alertify.alert('${alertMsg}');
	</script>
	<c:remove var="alertMsg" scope="session"/>
	</c:if>

    <div id="header">
        <!-- 로그인 및 회원가입 -->
        <div id="header_1">
            <div id="header_1_left">
            </div>
            <div id="header_1_center" align="center">
            <a href="http://localhost:8282/petopia/">  <img src="resources/images/petopiaLogo.png" alt="펫토피아로고" style="height: 60px; width: 170px;"></a>
            </div>
            <div id="header_1_right">               
               <!-- null == loginUser // empty loginUser -->
               <!-- 빈문자열인지 아닌지도 체크  -->
               
               <c:choose>
                  <c:when test="${ empty sessionScope.loginMember }">
                      <!-- 로그인 전 -->
                      <a href="memberEnroll.member">회원가입 </a> |
                      <a href="login">로그인</a> <!-- 모달의 원리 : 이 버튼 클릭시 data-target에 제시되어있는 해당 아이디의 div요소를 띄워줌 -->
                  </c:when>
                  <c:otherwise> 
                      <label>${ sessionScope.loginMember.memberName } 님 환영합니다</label> &nbsp;
                      <c:choose>
                      	<c:when test="${ not empty sessionScope.loginMember and sessionScope.loginMember.memberNo eq 1 }">
                      		<a href="memberList.ad">관리자페이지</a>
                      	</c:when>
                      	<c:otherwise>
		                     <a href="myPage.me?mno=${ sessionScope.loginMember.memberNo }">마이페이지</a>
                      	</c:otherwise>
                      </c:choose>
                      <c:choose>
                        <c:when test="${sessionScope.loginMember.loginType eq 'P'}">
                            <a href="logout.member">로그아웃</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${logout}">로그아웃</a>
                        </c:otherwise>
                      </c:choose>
                      
                  </c:otherwise>
               </c:choose>
               
               <div id="header_1_right_bottom" class="iconArea">
	               <c:choose>
	                  <c:when test="${ empty sessionScope.loginMember }">
	                      <!-- 로그인 전 -->
	                      <button class="fa-regular fa-credit-card fa-2x" id="payIcon"></button>
	                      <button class="fa-regular fa-bell fa-2x" id="alramIcon"></button>
	                      <button class="fa-solid fa-cart-shopping" id="cartIcon"></button>
	                  </c:when>
	                  <c:otherwise>
	                  	  <!-- 페이 아이콘-->
		                  <button class="fa-regular fa-credit-card fa-2x" id="payIcon" onclick="payBtn();"></button>
		                  <div id="pay_box" > 					               
							<iframe src="pay.me" id="payIframe"></iframe>
		                  </div>
		                  <!-- 알람 아이콘-->
		                  <button class="fa-regular fa-bell fa-2x" id="alramIcon" onclick="alramBtn();"></button>
		                  <div id="alram_box" > 					               
							<iframe src="alram.me" id="alramIframe"></iframe>
		                  </div>
		               	  <button class="fa-solid fa-cart-shopping" id="cartIcon" onclick="goCart();"></button>
	                  </c:otherwise>
	               </c:choose>
               </div>
               <!-- 장바구니 아이콘-->
            </div>
        </div>
		<div>
			<form  action="search.daum" method="get">
				<input name="searchKeyWord" type="text" id="search">
					
				<button onclick="search();" >검색</button>
			</form>
		</div>


        <div id="header_2">
            <ul id="navi">
                <li>
                	<a href="petHotel.pe">호텔</a>
                </li>
                <li>
                	<a href="petSchool.pe">유치원</a>
                </li>
                <li>
                	<a href="petSalon.pe">미용</a>
                </li>
                <li>
                	<a href="petTraining.pe">훈련</a>
                </li>
                <li><a href="product.pd">상점</a>
                    <ul>
                        <li><a href="">메뉴1</a></li>
                        <li><a href="">메뉴2</a></li> 
                        <li><a href="">메뉴3</a></li>
                        <li><a href="">메뉴4</a></li>
                    </ul>
                </li>
                <li><a href="board.bo?category=ALL">커뮤니티</a>
                	<!-- 
                    <ul>
                        <li><a href="">메뉴1</a></li>
                        <li><a href="">메뉴2</a></li>
                        <li><a href="">메뉴3</a></li>
                        <li><a href="">메뉴4</a></li>
                    </ul>
                     -->
                </li>
            </ul>
    
        </div>

		<!-- 채팅, 리모컨  -->
			
			<div id="fixed_menu_border">
				<div id="fixed_menu_content">
				  <a class="fa-brands fa-rocketchat" href="chatBot.ct" id="chatMove_1" onclick="window.open(this.href, '_blank', 'width=600, height=600 scrollbars=yes'); return false;"></a>
				</div>
			</div>
   	 
    </div>
    
    

    
    <script>
    // 맨위로
    $('#topMove_1').click(function(){
      location.href = 'javascript:window.scrollTo(0,0)'
    });
    
    var alram = $("#alram_box");
    var pay = $("#pay_box");
    
    var alramIcon = $("#alramIcon");
    var payIcon = $("#payIcon");
    
    // 알람 버튼
    function alramBtn() {
        
        if(alram.css("display") === 'none' ) {
        	pay.css("display", 'none'); 
        	alram.css("display", 'block');
        }
        else {
        	alram.css("display", 'none'); 
        }
    }
    
 	// 페이 버튼
    function payBtn() {
       
        if(pay.css("display") === 'none' ) {
        	alram.css("display", 'none'); 
        	pay.css("display", 'block'); 
        	
        }
        else {
        	pay.css("display", 'none'); 
        }   
    }
 	
 	// 영역 외 클릭 시 Icon의 iframe 닫기
    $('html').click(function(e) {   
    	if($(e.target).parents('.iconArea').length < 1){   
    		
    		if(pay.css("display") === 'block') {
	    		pay.css("display", 'none'); 
	    		alramIcon.attr("disabled", false);
    		}
    		
    		if(alram.css("display") === 'block') {
    			alram.css("display", 'none'); 
    			payIcon.attr("disabled", false);
    		}
    	}
    });
 	
 	function goCart(){
 		location.href = "productCart.pd";
 	}
 	
 	$('#chatMove_1').click(function(){
 		$('#chatOpen').css('display', 'block');
 	})
 	
 	
 	
 	
 	//다음 REST API검색하기
 	function search(){
 		$ajax({
 			url : "search.daum",
 			type : "get",
 			data :{searchKeyWord : $('#searchKeyWord').text()},
 			success:(searchResult) =>{
 				consol.log(searchResult);
 			},
 			error: ()=>{
 				console.log('실패');
 			}
 		})
 	}
 	
 	
    </script>
</body>
</html>