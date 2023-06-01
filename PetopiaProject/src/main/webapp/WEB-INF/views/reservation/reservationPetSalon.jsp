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
			
				<form action="" method="post">
					
				
					* 미용사 * <br>
					
					<div id="employee-list">
					
						<c:choose> 
							<c:when test="${ not empty eList }">
								<c:forEach var="e" items="${ requestScope.eList }">
								
									<div>
										<div> 이름 : ${ e.employeeName } </div>
										<div> 정보 : ${ e.employeeInfo } </div>
										<button type="button" onclick="selectEmployee();">예약</button>	<!-- 사용자가 미용사를 선택하면 해당 미용사의  -->
									</div>
									
									<hr>
								</c:forEach>
							</c:when>
							
							<c:otherwise>
								<div>조회 결과가 없습니다.</div>
							</c:otherwise>
						</c:choose>
	
					</div>
					
					* 예약  * <br>
					
					<div id="reservation-info">
					
						달력
						<input type="date">
						
						시간
						<input type="time" min="10:00:00" max="20:00:00">
						
						<submit>예약하기</submit>
					
					
					</div>
					
					
					
					
				</form>
	
					
			</div>
			<%-- 미용 예약 콘텐츠 끝 --%>
			
			<!-- 사용자가 미용사를 선택하면 해당 미용사의 예약 가능한 날짜와 시간이 출력되어야 함 .. -->
			<script>
			
				function selectEmployee(){
					
					console.log('나 눌렀어?');
					
					$('#reservation-info').css('display','block')
					
				}
			
			
			</script>
				
		</div>
			
		
		<div id="main_right"></div>
		
		<br><br>
		
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>