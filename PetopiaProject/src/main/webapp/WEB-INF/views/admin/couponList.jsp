<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
     
     .coupon-list-table {
	  width: 80%;
	  border-collapse: collapse;
	  margin-top: 100px;
	  text-align: center;
	  margin: auto;
	}

	.coupon-list-table th, .coupon-list-table td {
	  padding: 8px;
	  border: 1px solid #ddd;
	}

	.coupon-list-table th {
	  background-color: #f2f2f2;
	}

	.coupon-list-table tr:nth-child(even) {
	  background-color: #f9f9f9;
	}
	
	.title{
	  margin: 40px;	
	  margin-bottom: 30px;
	}
	#addCoupon{
	
		display: block;
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
				<jsp:include page="adminNavi.jsp" />
			</div>
		
			<div id="main_center_right">
				<h1 class="title"> 쿠폰 목록 </h1>
				<div style="float: right;">
					<button  type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">쿠폰 발급</button>
				</div>
				<table class="coupon-list-table" align="center">
                    <thead>
                        <tr>
                         
							<th width="240px" align="center">쿠폰 타입</th>
                            <th width="240px" align="center">할인율(액)</th>
                            <th width="500px" align="center">쿠폰이름</th>
                            <th width="340px" align="center">시작일</th>
                            <th width="340px" align="center">종료일 </th>
                            <th width="440px" align="center">최대할인금액 </th>
                            <th width="440px" align="center">최소사용금액  </th>
                            <th width="240px" align="center">발급 가능 여부  </th>
                        </tr>
                    </thead>
                    <tbody>
                     
					<jsp:useBean id="now" class="java.util.Date"/>
					<fmt:formatDate value="${ now }" pattern="yyyy-MM-dd" var="today"/>
                     <c:choose>
                     	<c:when test="${ empty requestScope.couponList }">
                     	
	                        <!-- 상품이 없을 경우-->
	                        <tr>
	                            <td colspan="7">쿠폰이 존재하지 않습니다.</td>
	                        </tr>
                     	</c:when>
                     	<c:otherwise>
                     	  <c:forEach items="${ requestScope.couponList }" var="cList">
                     		<tr>
	                           <td width="500px" align="center"> ${ cList.couponName }</td>
	                           <c:choose>
	                           	<c:when test="${ cList.couponType eq 1 }">
		                       		<td width="240px" align="center">정액할인</td>
		                       		 <td width="240px" align="center"> ${ cList.discount }원</td>
	                           	</c:when>
	                           	<c:otherwise>
	                           		<td width="240px" align="center">정율할인</td>
	                           		 <td width="240px" align="center"> ${ cList.discount }%</td>
	                           	</c:otherwise>
	                           </c:choose>
	                           <td width="340px" align="center">${ cList.startDate }</td>
	                           <td width="340px" align="center">${ cList.endDate } </td>
	                           <td width="440px" align="center"> ${ cList.maxPrice }원 </td>
	                           <td width="440px" align="center"> ${ cList.minPrice }원 </td>
	                           <c:choose>
	                           	<c:when test="${ cList.endDate  gt today }">
		                       		 <td width="440px" align="center"> 발급 가능 </td>
	                           	</c:when>
	                           	<c:otherwise>
	                           		 <td width="440px" align="center">발급 불가능</td>
	                           	</c:otherwise>
	                           </c:choose>
                       		 </tr>
                       	 </c:forEach>
                     	</c:otherwise>
                     </c:choose>
                        
                    </tbody>
                </table>
              
                
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
                		<c:choose>
                			<c:when test="${ pi.currentPage eq 1 }">
                    			<li  class="page-item"><a class="page-link" href="list.bo?cPage=${p}">${p}</a></li>
                			</c:when>
                		</c:choose>
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
		 
		 var nowDate = Date.now();
		 var timeOff = new Date().getTimezoneOffset() *60000;
		 var today = new Date(nowDate + timeOff).toISOString().substring(0,16);
		 document.getElementById("startDate1").setAttribute('min', today);
		 document.getElementById("endDate1").setAttribute('min', today);
		

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
			});
			
			
			
		})
		
		
	</script>

</body>
</html>