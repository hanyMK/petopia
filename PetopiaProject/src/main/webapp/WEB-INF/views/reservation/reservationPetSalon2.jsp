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
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div id="main">
	
		<div id="main_left"></div>
		
		<div id="main_center">
			
			<%-- 미용 예약 콘텐츠 시작 --%>
			
			<div id="petSalone-content">
			
				<h3> 미용 예약</h3>
			
				<div>
				
					* 미용사 * <br>
					
					
					<c:choose> 
						<c:when test="${ not empty eList }">
							<c:forEach var="e" items="${ requestScope.eList }">
							
								이름 : ${e.employeeName } <br>
								정보 : ${e.employeeInfo } <br>
								<button>선택</button>
								<hr>
								<br>
								
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div>조회 결과가 없습니다.</div>
						</c:otherwise>
					
					</c:choose>
					
					<c:set var="eList" value="${EmployeeList}"/>
					
					
					<br><br>
					
					<hr>
					
					*예약 * <br><br>
					
					달력
					<div class="sec_cal">
					  <div class="cal_nav">
					    <a href="javascript:;" class="nav-btn go-prev">prev</a>
					    <div class="year-month"></div>
					    <a href="javascript:;" class="nav-btn go-next">next</a>
					  </div>
					  <div class="cal_wrap">
					    <div class="days">
					      <div class="day">MON</div>
					      <div class="day">TUE</div>
					      <div class="day">WED</div>
					      <div class="day">THU</div>
					      <div class="day">FRI</div>
					      <div class="day">SAT</div>
					      <div class="day">SUN</div>
					    </div>
					    <div class="dates">
					    </div>
					    
					    <br><br>
					    
					  </div>
					</div>
					
					
					<script>
						$(document).ready(function() {
						    calendarInit();
						});
	
						/*
						    달력 렌더링 할 때 필요한 정보 목록 
	
						    현재 월(초기값 : 현재 시간)
						    금월 마지막일 날짜와 요일
						    전월 마지막일 날짜와 요일
						*/
	
						function calendarInit() {
	
						    // 날짜 정보 가져오기
						    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
						    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
						    var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
						    var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
						  
						    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
						    // 달력에서 표기하는 날짜 객체
						  
						    
						    var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
						    var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
						    var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일
	
						    // kst 기준 현재시간
						    // console.log(thisMonth);
	
						    // 캘린더 렌더링
						    renderCalender(thisMonth);
	
						    function renderCalender(thisMonth) {
	
						        // 렌더링을 위한 데이터 정리
						        currentYear = thisMonth.getFullYear();
						        currentMonth = thisMonth.getMonth();
						        currentDate = thisMonth.getDate();
	
						        // 이전 달의 마지막 날 날짜와 요일 구하기
						        var startDay = new Date(currentYear, currentMonth, 0);
						        var prevDate = startDay.getDate();
						        var prevDay = startDay.getDay();
	
						        // 이번 달의 마지막날 날짜와 요일 구하기
						        var endDay = new Date(currentYear, currentMonth + 1, 0);
						        var nextDate = endDay.getDate();
						        var nextDay = endDay.getDay();
	
						        // console.log(prevDate, prevDay, nextDate, nextDay);
	
						        // 현재 월 표기
						        $('.year-month').text(currentYear + '.' + (currentMonth + 1));
	
						        // 렌더링 html 요소 생성
						        calendar = document.querySelector('.dates')
						        calendar.innerHTML = '';
						        
						        // 지난달
						        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
						            calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
						        }
						        // 이번달
						        for (var i = 1; i <= nextDate; i++) {
						            calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>'
						        }
						        // 다음달
						        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
						            calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
						        }
	
						        // 오늘 날짜 표기
						        if (today.getMonth() == currentMonth) {
						            todayDate = today.getDate();
						            var currentMonthDate = document.querySelectorAll('.dates .current');
						            currentMonthDate[todayDate -1].classList.add('today');
						        }
						    }
	
						    // 이전달로 이동
						    $('.go-prev').on('click', function() {
						        thisMonth = new Date(currentYear, currentMonth - 1, 1);
						        renderCalender(thisMonth);
						    });
	
						    // 다음달로 이동
						    $('.go-next').on('click', function() {
						        thisMonth = new Date(currentYear, currentMonth + 1, 1);
						        renderCalender(thisMonth); 
						    });
						}
					</script>
					
		
					
					
					
				</div>
			</div>
			
			
		</div>
		
		<div id="main_right"></div>
		
		<br><br>
		
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>