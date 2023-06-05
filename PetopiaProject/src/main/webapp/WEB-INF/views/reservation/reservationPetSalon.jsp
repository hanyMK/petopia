<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 애견 미용실 예약 페이지</title>
	<!-- 예약캘린더 css 파일 연결 -->
	<link href="resources/css/reservationCalendar.css" rel="stylesheet" tpe="text/css">
	<style>
		#reservation-info{
			display:none;
		}
	</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div id="main">
	
		<div id="main_left"></div>
		
		<div id="main_center">
			
			<%-- 미용 예약 콘텐츠 시작 --%>
			<div id="petSalone-content">
			
				<h3> 미용 예약</h3>
				
					* 미용사 * <br>
					
					<div id="employee-list">
					
						<c:choose> 
							<c:when test="${ not empty eList }">
								<c:forEach var="e" items="${ requestScope.eList }">
								
									<div>
										<div> 이름 : ${ e.employeeName } </div>
										<div> 정보 : ${ e.employeeInfo } </div>
										<button type="button" onclick="selectEmployee(${e.employeeNo});">예약</button>	<!-- 사용자가 미용사를 선택하면 해당 미용사의  -->
									</div>
									
									<hr>
								</c:forEach>
							</c:when>
							
							<c:otherwise>
								<div>조회 결과가 없습니다.</div>
							</c:otherwise>
						</c:choose>
	
					</div>
					
					<!-- 사용자가 미용사를 선택하면 해당 미용사의 예약 가능한 날짜와 시간이 출력되어야 함 .. -->
					<script>
					
						function selectEmployee(eno){
							
							console.log('나 눌렀어?');
							console.log(eno);
							
							$('#reservation-info').css('display','block')
							$('input[name=employeeNo]').attr('value',eno)
							
						}
					
					
					</script>
					
					<div id="reservation-info">
					
					* 예약  * <br><br>
					
						<form action="payment.ps" method="get">
						
							<input type="hidden" name="employeeNo" value="">
							
							날짜 <input type="date" name="checkIn" required><br><br>
							
							시간 <input type="time" min="10:00" max="20:00" name="reservationTime" required><br><br>
							
							<!-- 사용자가 등록한 마이펫 정보가 있으면 출력  -->
							<c:choose> 
								<c:when test="${ not empty pet }">
									<ul id="myPet">
										<li> 견종 : ${pet.species} </li>
										<li> 펫이름 : ${pet.petName} </li>
										<li> 펫나이 : ${pet.age} 살 </li>
										<li> 펫무게 : ${pet.weight} kg </li>
									</ul>
								</c:when>
								<c:otherwise>
									등록된 마이펫 정보가 없습니다.
									<button>등록하러가기</button>	<!-- 버튼 누르면 마이페이지의 마이펫 등록 입력 양식 페이지로 이동~ -->
								</c:otherwise>
							</c:choose>
							
							<!-- 미용예약하려는 동물의 무게에 따라 금액이 다르게 측정됨 -->
							<!-- 무게가 10kg이상이면 10000원 추가  -->
							<!-- 펫 나이가 10살이상인 경우 5000원 추가  -->
							
							예약금액
		
							
							<br>
							<button type="submit">예약하기</button>
							
						</form>
						
						<br>
						
						
					</div>
					
					
					
					
					
					
					
	
					
			</div>
			<%-- 미용 예약 콘텐츠 끝 --%>
			
		
				
		</div>
			
		
		<div id="main_right"></div>
		
		<br><br>
		
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>