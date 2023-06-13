<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 애견 미용실 예약 페이지</title>
	
<style>
	 
	/* 달력에 필요한 스타일 */
	td {
	      width: 50px;
	      height: 50px;
	  }

	.Calendar {
	    text-align: center;
	}
	
	.Calendar>thead>tr:first-child>td {
	    font-family: 'Questrial', sans-serif;
	    font-size: 1.1em;
	    font-weight: bold;
	}
	
	.Calendar>thead>tr:last-child>td {
	    font-family: 'Questrial', sans-serif;
	    font-weight: 600;     
	}
	
	.Calendar>tbody>tr>td>p {
	    font-family: 'Montserrat', sans-serif;
	    height: 45px;
	    width: 45px;
	    border-radius: 45px;
	    transition-duration: .2s;
	    line-height: 45px;
	    margin: 2.5px;
	    display: block;
	    text-align: center;
	}        
	
	.pastDay, .closedDay {
	    color: lightgray;
	}
	
	.today {
	    color: blue;
	    font-weight: 600;
	    cursor: pointer;
	}
	
	.futureDay {
	    background-color: #FFFFFF;
	    cursor: pointer;
	}
	.futureDay:hover{
	    background:#eee;
	}

	.futureDay.choiceDay,
	.today.choiceDay {
	    background: orange;
	    color: #fff;
	    font-weight: 600;
	    cursor: pointer;
	}
		  
		  
	/*내가 추가한 스타일 */
	#employee-list {
		border : 1px solid black;
	}
	
	#employee {
		border : 1px solid black;
		width : 70%;
		height : 100px;
		margin:auto;
		margin-bottom : 20px;
	}
	
	#reservation-calendar{
		display:none;
	}
	
	#time{
		border: 1px solid black;
	}
	
	#time td{
		border: 1px solid black;
	}
	
	

		  
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div id="main">
	
		<div id="main_left"></div>
		
		<div id="main_center">
			
			<%-- 미용 예약 콘텐츠 시작 --%>
			<div id="wrap">
			
				<h3 align="center"> 미용 예약</h3>
			
				<!-- 미용사 리스트 조회  -->
				<div id="employee-list">
					<h4 align="center"> 미용사 </h4>
					
					<c:choose> 
						<c:when test="${ not empty eList }">
							<c:forEach var="e" items="${ requestScope.eList }">
								<div id="employee">
									<ul style="list-style:none;">
										<li> 이름 : ${ e.employeeName } </li>
										<li> 정보 : ${ e.employeeInfo } </li>
										<li> 휴무일 : ${e.closedDay}</li>
										<div align="right">
											<button onclick="buildCalendar(${e.employeeNo},'${e.closedDay}');">예약</button>
										</div>
									</ul>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
						<div>조회 결과가 없습니다.</div>
						</c:otherwise>
					</c:choose>
				
				</div>
				<!-- 미용사 리스트 조회 끝  -->
				
				<!-- 선택한 미용사에 따른 달력 출력 (미용사의 휴무일을 선택하지 못하도록 설정해야함) -->
				<div id="reservation-calendar">
					<table class="Calendar">
			            <thead>
			                <tr>
			                    <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
			                    <td colspan="5">
			                        <span id="calYear"></span>년
			                        <span id="calMonth"></span>월
			                    </td>
			                    <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
			                </tr>
			                <tr>
			                    <td>일</td>
			                    <td>월</td>
			                    <td>화</td>
			                    <td>수</td>
			                    <td>목</td>
			                    <td>금</td>
			                    <td>토</td>
			                </tr>
			            </thead>
			            <tbody>
			            </tbody>
			        </table>
		        </div>
		        <!-- 달력 끝 -->
		        
		        <!-- 달력 script -->
				<script>
				
			        // window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행
			
			        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
			        let today = new Date();     // 페이지를 로드한 날짜를 저장
			        today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화
			
			        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
			        function buildCalendar(eno,closedDay) {
			        	
			        	$('#reservation-calendar').css('display','block');
			        	
			        	switch(closedDay){
			        		case '일' : closedDay = 1; break;
			        		case '월' : closedDay = 2; break;
			        		case '화' : closedDay = 3; break;
			        		case '수' : closedDay = 4; break;
			        		case '목' : closedDay = 5; break;
			        		case '금' : closedDay = 6; break;
			        		case '토' : closedDay = 7; break;
			        		default : closedDay = 0;
			        	}
			        	
			            let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
			            let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날
			
			            let tbody_Calendar = document.querySelector(".Calendar > tbody");
			            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
			            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신
			
			            while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
			                tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
			            }
			
			            let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가        
			            
			
			            for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
			                let nowColumn = nowRow.insertCell();        // 열 추가
			            }
			
			            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  
			
			                let nowColumn = nowRow.insertCell();        // 새 열을 추가하고
			
			
			                let newDIV = document.createElement("p");
			                newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
			                nowColumn.appendChild(newDIV);
			
			                if (nowDay.getDay() == 6) {                 // 토요일인 경우
			                    nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
			                }
			                
			                if (nowDay < today) {                       // 지난날인 경우
			                    newDIV.className = "pastDay";
			                }
			                else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
			                    newDIV.className = "today";
			                    newDIV.onclick = function () { choiceDate(this,eno); }
			                }
			                else {                                      // 미래인 경우
			                    newDIV.className = "futureDay";
			                    newDIV.onclick = function () { choiceDate(this,eno); }
			                }
			                
			                
			            }
			            
      					// 모든 행의 closedDay번째 열을 비활성화 시켜야함 
			        	// let close = document.querySelector( .Calendar > tbody > tr> td:nth-child(closedDay) );
			        	// console.log(close);
			        	
			        	// var calendar = document.getElementsByClassName('Calendar');
						
			        	// console.log(calendar);
			        	
			        	
			        	console.log("휴무일 숫자 :"+ closedDay);
			        	
			        	console.log(typeof(closedDay));
			        	
			        	
			        	// console.log($('.Calendar > tbody > tr')).css('nth-child(closdeDay2)',);
			        	
			        	// 이거 되는거임 이거 됨 건들면 클나 
			        	// $('.Calendar > tbody > tr > td:nth-child(' + closed + ')').css('color','lightgray');
			        	
			        	
			        	$('.Calendar > tbody > tr > td:nth-child(' + closedDay + ') > p').attr('class','closedDay');
			        	
			        	// color: lightgray;
			        	
			        }
			
			        // 날짜 선택
			        function choiceDate(newDIV,eno) {
			            if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
			                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
			            }
			            newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
			            
			            console.log('날짜 선택하면 출력됨');
			            console.log(eno + '번 미용사 선택하고 날짜 누른거임 너가');
			            
			            const calYear = document.getElementById("calYear").innerText;
			            const calMonth = document.getElementById("calMonth").innerText;
			            const calDay = newDIV.innerText;
			            
			            console.log(calYear.innerText);
			            console.log(calMonth.innerText);
			            console.log(newDIV.innerText);	// 사용자가 선택한 일
			            
			            $('#selectedDate').text(calYear + '-' + calMonth +'-' + calDay);
			            
			            selectReservation(eno);
			            
			        }
			
			        // 이전달 버튼 클릭
			        function prevCalendar() {
			            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
			            buildCalendar(eno,closedDay);    // 달력 다시 생성
			        }
			        // 다음달 버튼 클릭
			        function nextCalendar() {
			            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
			            buildCalendar(eno,closedDay);    // 달력 다시 생성
			        }
			
			        // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
			        function leftPad(value) {
			            if (value < 10) {
			                value = "0" + value;
			                return value;
			            }
			            return value;
			        }
			        
			    </script>					
				<!-- 달력 script 끝 -->
				
				<br><br>
				
				<!-- 입력한 예약 정보  -->
				<form action="payment.ps" method="get">
				
					* 예약일자  <br>
					<div>
						<strong><h id="selectedDate"></span></strong>
					</div>
				
					<br>
				
					* 시간  
					<table id="time">
						<tbody>
						</tbody>
					</table>						
						
									
				</form>
				
				
		
				
				<!-- 사용자가 선택한 미용사의 예약 현황을 조회해오는 ajax  -->
				<script>
				
					function selectReservation(eno){
						
						$.ajax({
							url :'selectEmployeeReservation.ps',
							data : { 
									employeeNo : eno,
									checkIn : $('#selectedDate').text()
							},
							success : function(result){
								
								console.log(result);
								
								// 사용자의 예약현황 시간 조회해왔어
								
								// 내가하고싶은 거는 조회된 예약시간은 
								// 버튼이 비활성화되도록 
								
								for(let r=0; r<result.length; r++){
									console.log(result[r]);
								}
								
								
								
								
								
								/*
								for(let i=0; i<result.length; i++){
									console.log(result[i]);
								}
								*/
							},
							error : function(){
								console.log('예약 조회 AJAX 통신 실패');
							}
						});
						
					}
					

				</script>

				<div align="center">
					<button>예약하기</button>
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