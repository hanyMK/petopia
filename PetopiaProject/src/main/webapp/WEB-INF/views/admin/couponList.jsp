<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 쿠폰 발급 </title>

   <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style type="text/css">
     #pagingArea {width:fit-content; margin:auto;}
    </style>

</head>
<body>

	
    <jsp:include page="../common/header.jsp" />

    <div id="main">
		<div id="main_left">
		
		</div>
		<div id="main_center">
			<div id="main_center_left">
				<jsp:include page="adminNavi.jsp" />
			</div>
			
			<div id="main_center_right">
				 <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">쿠폰 발급</button>
				<table id="n_list-area" align="center">
                    <thead>
                        <tr>
                            <td width="70px" height="40px" align="center">번호</td>
                            <td width="70px" align="center">경매<td>
                            <td width="240px" align="center">상품 이름</td>
                            <td width="120px" align="center">회원 아이디</td>
                            <td width="140px" align="center">회원 이름</td>
                            <td width="120px" align="center">판매여부</td>
                            <td width="140px" align="center">등록일</td>
                            <td> </td>
                        </tr>
                    </thead>
                    <tbody>
                        
                     
                            <!-- 상품이 없을 경우-->
                            <tr>
                                <td colspan="5">상품이 존재하지 않습니다.</td>
                            </tr>

                     
                        	<!-- 상품이 있을 경우 -->
								
	                     
                        		<tr>	
                                   <td width="70px" height="50px" align="center">번호</td>                                         
                                   
                                   <!-- 경매인 상품 보여주기 -->
                                 
                                   		<td width="70px" align="center">경매</td>
                                  
                                       <td></td>
                                
                                   <td width="240px" align="center"></td>
                                   <td width="120px" align="center"></td>
                                   <td width="140px" align="center"></td>
                                   <td width="120px" align="center"></td>
                                   <td width="140px" align="center"></td>
                                   
                                       <td style="padding-left: 50px;"><a onclick="return deleteProduct();" href=" /productDelete.ad?pno=">삭제</a></td>
                               
                                       <td style="padding-left: 50px;"><a onclick="return recoverProduct();" href="/productRecover.ad?pno=">복구</a></td>
                              
                                </tr>
	                    
	                         
                        
                    </tbody>
                </table>
                <c:forEach items="${ requestScope.couponList }" var="cList">
                
				<p>
				쿠폰 이름 : ${ cList.couponName }<br>
				쿠폰 타입 : ${ cList.couponType }<br>
				할인율(액) : ${ cList.discount }<br>
				시작일 : ${ cList.startDate }<br>
				종료일 : ${ cList.endDate }<br>
				최대할인율 : ${ cList.maxPrice }<br>
				최소사용금액 : ${ cList.minPrice }<br>
				</p>
                </c:forEach>
                
             <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                   	<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                		<li class="page-item"><a class="page-link" href="list.bo?cPage=${pi.currentPage -1}">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                	
                	<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                	
                    <li class="page-item"><a class="page-link" href="list.bo?cPage=${p}">${p}</a></li>
                	</c:forEach>
                	
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="">next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item"><a class="page-link" href="list.bo?cPage=${pi.currentPage +1}">next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
                
			</div>
			
		</div>
		<div id="main_right">

				<h1>
				이쪽은 공백
				</h1>
		</div>
		
	</div>
	
    <jsp:include page="../common/footer.jsp" />
	
		

	
	  <!-- 쿠폰발급시 보여질 Modal -->
    <div class="modal fade" id="deleteForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">쿠폰 발급</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                     <form action="insertCoupon.ad" method="post" id="sign-form">

                    <!-- Modal body -->
                    <div class="modal-body">
    
			            <table align="center">
			            
			                <tr>
			                    <th>쿠폰 이름 :</th>
			                    <td><input type="text" name=couponName id="couponName"  required></td>
			                    
			    
			                </tr>
			                <tr>
			                    <th>쿠폰 타입 :</th>
			                    <td><input type="number" name="couponType"  required></td>
			    
			                </tr>
			               
			                <tr>
			                    <th>할인가 :</th>
			                    <td><input type="number" name="discount" id="discount" required></td>
			                </tr>
			             
			                <tr>
			                    <th>시작일 : </th>
			                    <td><input type="datetime-local" name="startDate1" id="startDate1" >
			                     <input type="hidden"  name="startDate" id="startDate" value=""> </td>
			                </tr>
			                <tr>
			                    <th>종료일 : </th>
			                    <td><input type="datetime-local" name="endDate1" id="endDate1">
			                    <<input type="hidden"  name="endDate" id="endDate"></td>
			                </tr>
			                <tr>
			                    <th>최대할인 금액 : </th>
			                    <td><input type="number"  name="maxPrice" id="maxPrice"></td>
			                </tr>
			                <tr>
			                    <th>최소사용 금액 : </th>
			                    <td><input type="number"  name="minPriace" id="minPriace"></td>
			                </tr>
			           
			                
			            </table>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button id="insertCoupon"  type="submit" class="btn btn-danger">쿠폰 발급하기</button>
                        <button type="reset" class="btn btn-danger">초기화</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

	<script>
	
		 var couponBtn = document.getElementById('insertCoupon');
		 var sDate = document.getElementById('startDate'); 
		 var eDate = document.getElementById('endDate');
		 var rsDate = document.getElementById('reulstStartDate'); 
		 var reDate = document.getElementById('reulstEndtDate');
		
		// function changeDate(){

			
		 	//sDate.att('value',eDate.value.replace("T", " "));
		
		 	//console.log(rsDate.value);
		
		//}
		//couponBtn.onclick = () =>{
			//console.log(sDate.value.replace("T", " "));
		 	///sDate.value = sDate.value.replace("T", " ");
		 	//eDate.value = eDate.value.replace("T", " ");
		//}

		$(function(){

		

			$('#insertCoupon').on('click', ()=>{

				var sDate = $('#startDate1').val().replace("T", " ");
				var eDate = $('#endDate1').val().replace("T", " ");
				console.log(sDate +" / " +eDate);
				$('#endDate').val(eDate);
				$('#startDate').val(sDate);
				console.log($('#endDate').val());
			})
			
		})
		
		
	</script>

</body>
</html>