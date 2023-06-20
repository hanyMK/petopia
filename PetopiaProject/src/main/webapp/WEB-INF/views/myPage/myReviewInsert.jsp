<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
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

        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
        
        /*리뷰 별점*/
        .star-rating {
		  display: flex;
		  flex-direction: row-reverse;
		  font-size: 2.25rem;
		  line-height: 2.5rem;
		  justify-content: space-around;
		  padding: 0 0.2em;
		  text-align: center;
		  width: 5em;
		}
		 
		.star-rating input {
		  display: none;
		}
		
		.star-rating label {
		   opacity: 0.5;
		}
		
    </style>
</head>
<body>
        
    <jsp:include page="../common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>리뷰 작성하기</h2>
            <br>
            <form id="insertReview" method="post" action="insertReview.me" enctype="multipart/form-data">
            	<input type="hidden" name="memberNo"  value="${loginMember.memberNo }">
             	<input type="hidden" name="receiptNo" value="${ review.receiptNo }">   
             	
            	<c:choose>
             		<c:when test="${ not empty review.productNo }">
             			<!-- 상품  리뷰 작성인 경우 -->
             			<input type="hidden" name="productNo" value="${ review.productNo }">
             			<label><b>상품 : ${ review.title } 결제 날짜: ${ review.receiptDate }</b></label>
             		</c:when>
                	<c:otherwise>
                		<!-- 예약 리뷰 작성인 경우 -->
                		<label><b>예약 : ${ review.title } 결제 날짜: ${ review.receiptDate }</b></label>
                	</c:otherwise>
                </c:choose>   	
             	
                <table align="center">
                    <tr>
                        <th width="100px"><label>작성자</label></th>
                        <td width="400px"><input type="text" id="nickname" class="form-control" value="${ loginMember.nickname }" name="nickName" readonly></td>
                    </tr>
                    <tr>
                    	<th><label>별점</label></th>
                    	<td>
							<div class="star-rating space-x-4 mx-auto">
								<input type="radio" id="5-stars" name="rating" value="5"/>
								<label for="5-stars" class="star" id="star5" onclick="starBtn(5);">★</label>
								<input type="radio" id="4-stars" name="rating" value="4"/>
								<label for="4-stars" class="star" id="star4" onclick="starBtn(4);">★</label>
								<input type="radio" id="3-stars" name="rating" value="3"/>
								<label for="3-stars" class="star" id="star3" onclick="starBtn(3);">★</label>
								<input type="radio" id="2-stars" name="rating" value="2"/>
								<label for="2-stars" class="star" id="star2" onclick="starBtn(2);">★</label>
								<input type="radio" id="1-star" name="rating" value="1" />
								<label for="1-star" class="star" id="star1" onclick="starBtn(1);">★</label>
							</div>
						</td>
					</tr>
				     <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td><input type="file" id="upfile" class="form-control-file border" name="upfile" onchange="readURL(this);"></td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="reviewContent" required></textarea></td>
                    </tr>
                </table>
		                
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
    <script>

    console.log('${ review.productNo }');
    
    console.log('${ review.reservationNo }');
    
    console.log('${ review.receiptNo }');
    
    function starBtn(num) {
    	
    	if(num == 1) {
    		$('.star').css('color', 'black');
    		$('#star1').css('color', 'red');
    	}
    	if(num == 2) {
    		$('.star').css('color', 'black');
    		for(var i=1; i<=2; i++) {
    			$('#star' + i).css('color', 'red');
    		}
        }
    	if(num == 3) {
			$('.star').css('color', 'black');
    		for(var i=1; i<=3; i++) {
    			$('#star' + i).css('color', 'red');
    		}
        }
    	if(num == 4) {
			$('.star').css('color', 'black');
    		for(var i=1; i<=4; i++) {
    			$('#star' + i).css('color', 'red');
    		}
        }
    	if(num == 5) {
			$('.star').css('color', 'black');
    		for(var i=1; i<=5; i++) {
    			$('#star' + i).css('color', 'red');
        }
    }
    }
    
    </script>
    
    
    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>