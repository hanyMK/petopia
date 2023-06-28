<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
	<!-- <link rel="stylesheet" type="text/css" href="resources/css/reservation/reservationCalendar.css">  -->
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
	#employee, #reservation-calendar {
		margin:auto;
	}
	
	#employee-list {
		border : 1px solid black;
	}
	
	#employee {
		border : 1px solid black;
		width : 70%;
		height : 100px;
		margin-bottom : 20px;
	}
	
	/*숨겨져 있다가 사용자가 미용사를 선택하면 나타남 */
	#reservation-calendar, #reservation-form{
		display:none;
	}
	
	#reservation-time td{
		text-align: center;
		border: 1px solid gray;
		width : 100px;
		height : 50px;
	}
	
	#reservation-time td:hover:not(.booked){
		cursor : pointer;
		font-weight : bold;
	}
	
	/* 예약이 되어있는 시간대는 선택할 수 없도록 스타일 적용 */
	.booked {
		text-decoration: line-through;
	}
	
	/* 사용자가 선택한 버튼에 스타일 적용  */
	
	.selected-time{
		background : orange;
		color : white;
		font-weight : bold;
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
										<li> 이름 : ${ e.employeeName }</li>
										<li> 정보 : ${ e.employeeInfo } </li>
										<li> 휴무일 : ${e.closedDay}</li>
										<div align="right">
											<button onclick="buildCalendar(${e.employeeNo}, '${e.employeeName}' ,'${e.closedDay}');">예약</button>
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
				
				<!-- 예약 정보 입력 시작  -->
				<div id="resrvation-info">
					
				<h3 align="center"> 예약 정보 입력 </h3>
				
				<!-- 달력 시작 -->
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
			        function buildCalendar(eno,eName,closedDay) {
			        	
			        	// 이전에 클릭한 예약정보가 사라지고 선택에 따라 다시 출력되도록하기위해 
			        	$('#reservation-form').css('display','none');
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
			                    newDIV.onclick = function () { choiceDate(this,eno,eName); }
			                }
			                else {                                      // 미래인 경우
			                    newDIV.className = "futureDay";
			                    newDIV.onclick = function () { choiceDate(this,eno,eName); }
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
			        function choiceDate(newDIV,eno,eName) {
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
			            
			            // 사용자가 날짜까지 선택하면 
			            // 예약일자, 미용사 화면에 출력해주고 동시에 input의 value값에 세팅
			            $('#selectedDate').text(calYear + '-' + calMonth +'-' + calDay);
			            $('input[name=checkIn]').attr('value', calYear + '-' + calMonth +'-' + calDay);
			            
			            $('#selectedEmployee').text(eName);
			            $('input[name=employeeNo]').attr('value', eno);

			            selectReservation(eno);
			        }
			
			        // 이전달 버튼 클릭
			        function prevCalendar(eno,eName,closedDay) {
			            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
			            buildCalendar(eno,eName,closedDay)    // 달력 다시 생성
			        }
			        // 다음달 버튼 클릭
			        function nextCalendar(eno,eName,closedDay) {
			            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
			            buildCalendar(eno,eName,closedDay)    // 달력 다시 생성
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
					<div id="reservation-form">
					
						* 담당자	<!-- 사용자가 선택한 담당자 -->
						<div>
							<strong id="selectedEmployee"></strong>
							<input type="hidden" name=employeeNo value="">
							<input type="hidden" name=employeeName value="">
						</div> 
						
						<br>
					
						* 예약일자  <!-- 사용자가 선택한 일자 -->
						<div>
							<strong id="selectedDate"></strong>
							<input type="hidden" name="checkIn" value="">
						</div>
						
						<br>
					
					
						* 시간  <!-- 사용자가 선택한 시간 -->
						<input type="hidden" name="reservationTime" value="">
						<div>
							<strong id="selectedTime"></strong>
							<table id="reservation-time">
								<tbody>
									<tr>
										<td id="10">10:00</td>
										<td id="11">11:00</td>
									</tr>
									<tr>
										<td id="12">12:00</td>	
										<td id="13">13:00</td>
										<td id="14">14:00</td>
									</tr>
									<tr>
										<td id="15">15:00</td>
										<td id="16">16:00</td>
										<td id="17">17:00</td>
									</tr>
									<tr>
										<td id="18">18:00</td>
										<td id="19">19:00</td>
									</tr>
								</tbody>
							</table>					
						</div>
						
						<br>
						
						<div align="center">
							<button>예약하기</button>
						</div>
					
					</div>
				</form>
				
				</div>
				<!-- 예약 정보 div 끝 -->
				

				<!-- 사용자가 선택한 미용사의 예약 현황을 조회해오는 ajax  -->
				<script>
				
					function selectReservation(eno){
						
						$('#reservation-form').css('display','block');
						
						$.ajax({
							url :'selectEmployeeReservation.ps',
							data : { 
									employeeNo : eno,
									checkIn : $('#selectedDate').text()
							},
							success : function(result){
								
								//선택한 날짜에 
								// 예약 현황이 있을 수도 있고 없을 수도 있음
								
								// 사용자가 처음에 시간을 선택해서 예약현황에 따라 
								// 요소가 수정되었는데 다시 시간을 선택한 경우 
								// 데이터를 조회해온 후 이전 값은 초기화하고 새로 뿌려줘야함 
								
								// 예약이라는 표시랑 효과 없애고 다시 처음으로 초기화 .. 
								for(let i=10; i<20; i++){
									$('#'+i).text(i+':00');
									$('#'+i).removeClass('booked');
									$('#'+i).attr('class','time')
								}
								
								if(result.length != 0){
									// 예약이 있으면 
									console.log('예약있음');
									
									// console.log(result[j].substr(0,2) + '랑 ' +i+'랑비교');
									// 미용사의 예약 정보와 화면에 출력되는 시간 버튼을 비교하여
									// 예약된 시간은 비활성화 시키기위함
									for(let i=10; i<20; i++){
										for(let j=0; j<result.length; j++){
											if( result[j].substr(0,2) == i ){
												// console.log(i+'시는 예약이 되어이씀');
												$('#'+i).attr('class','booked')
												break;
											}
										}
									}
									
								}
								
								
								
								
								
								// 만약에 클래스명이 지정되어있으면 다시 초기화
								// $('#'+i).attr('class','');
								
								
								console.log($('#1').text());
								
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
				<%-- ajax 끝 --%>
				
								
				<!-- 사용자가 시간 선택시   -->
				<script>
				
					// 사용자가 시간을 클릭하면
					// 클릭한 요소를 가져와야함! 
					
					// class=time인 요소에 클릭이벤트가 발생했을 때 호출되는 함수
					// 함수에 발생한 target요소를가져와서 
					// 사용자가 무슨 시간을 출력했는지를 얻어오면됨
					
					// 근데 동적으로 생긴 요소에는 이벤트가적용이안돼
					
					// 이 구문으로 사용하면 동적으로 생긴 요소에 이벤트가 적용됨
					$(document).on("click",".time",function(e){
						
						console.log('시간눌렀어');
						console.log($(e.target).text());
						
						// 사용자가 누른 시간대에 css 스타일 추가
						$(e.target).removeClass('time');
						$(e.target).attr('class','selected-time');
						
						// 선택한 시간 외에 다른 시간은 이제 선택할 수 없도록 설정 
						// 
						
						$('#selectedTime').text('어쩌구');
						
						$('#selectedTime').text($(e.target).text());
						$('input[name=reservationTime]').attr('value', $(e.target).text());
						
					});
					
					$(document).on("click",".booked",function(e){
						alert('예약할 수 없습니다. ')
						console.log('너 누르면 안되는데 눌렀어');
					});
					
				</script>

				
			</div>
			<%-- 미용 예약 콘텐츠 끝 --%>
				
		</div>
		<%-- main_center 끝 --%>
		
		<div id="main_right"></div>
		
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>