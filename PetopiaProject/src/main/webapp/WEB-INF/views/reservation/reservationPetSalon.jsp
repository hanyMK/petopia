<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 애견 미용실 예약 페이지</title>
	
	 <style>
	 	
	 	#reservation-info {
	 		display:none;
	 	}
	 
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
		
		  .pastDay {
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
		  /* 휴무일은 색상 변경 */
		  /*
		  .closedDay {
		      color: lightgray;
		  }*/
		  
	 </style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div id="main">
	
		<div id="main_left"></div>
		
		<div id="main_center">
			
			<%-- 미용 예약 콘텐츠 시작 --%>
			<div id="petSalon-content">
			
					
					<div id="employee-list">
					<h3> 미용 예약</h3>
					
						* 미용사 * <br>
					
						<c:choose> 
							<c:when test="${ not empty eList }">
								<c:forEach var="e" items="${ requestScope.eList }">
								
									<div>
										<div> 이름 : ${ e.employeeName } </div>
										<div> 정보 : ${ e.employeeInfo } </div>
										<div> 휴무일 : ${e.closedDay}</div>
										<button type="button" onclick="selectEmployee(${e.employeeNo},'${e.employeeName}','${e.closedDay}');">예약</button>	<!-- 사용자가 미용사를 선택하면 해당 미용사의  -->
									</div>
									
									<hr>
								</c:forEach>
							</c:when>
							
							<c:otherwise>
								<div>조회 결과가 없습니다.</div>
							</c:otherwise>
						</c:choose>
	
					</div>
					
					<!-- 사용자가 미용사를 선택하면 해당 미용사의 예약 가능한 날짜와 시간이 출력되어야 함  -->
					
					<script>
					
						function selectEmployee(eno, eName, closedDay){
							
							console.log('나 눌렀어?');
							
							console.log(eno);
							console.log(eName);
							console.log(closedDay);
							
							$('#reservation-info').css('display','block');
							$('input[name=employeeNo]').attr('value',eno);
							
							$('label[for=employeeName]').text(eName);
							$('label[for=closedDay]').text(closedDay);
							
							buildCalendar(closedDay);
							
						}
					
					
					</script>
					
					<div id="reservation-info">
					
					* 예약  * <br><br>
					
						<form action="payment.ps" method="get">
						
							<input type="hidden" name="employeeNo" value="">
							
							* 담당  : <label for="employeeName"></label><br>
							    휴무일 : <label for="closedDay"></label><br>
							
							<br><br>
							
							* 예약일자  
							<strong>
								<span id="selectedDate"></span>
							</strong>
							
							<div>
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
					        
					        <!-- 달력 script -->
							<script>
						        window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행
						
						        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
						        let today = new Date();     // 페이지를 로드한 날짜를 저장
						        today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화
						
						        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
						        function buildCalendar() {
						        	
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
						                    newDIV.onclick = function () { choiceDate(this); }
						                }
						                else {                                      // 미래인 경우
						                    newDIV.className = "futureDay";
						                    newDIV.onclick = function () { choiceDate(this); }
						                }
						            }
						        }
						
						        // 날짜 선택
						        function choiceDate(newDIV) {
						            if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
						                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
						            }
						            newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
						            
						            console.log('날짜 선택하면 출력됨')
						            
						            const calYear = document.getElementById("calYear").innerText;
						            const calMonth = document.getElementById("calMonth").innerText;
						            const calDay = newDIV.innerText;
						            
						            console.log(calYear.innerText);
						            console.log(calMonth.innerText);
						            console.log(newDIV.innerText);	// 사용자가 선택한 일
						            
						            $('#selectedDate').text(calYear + '년' + calMonth +'월' + calDay +'일');
						            
						            
						        }
						
						        // 이전달 버튼 클릭
						        function prevCalendar() {
						            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
						            buildCalendar();    // 달력 다시 생성
						        }
						        // 다음달 버튼 클릭
						        function nextCalendar() {
						            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
						            buildCalendar();    // 달력 다시 생성
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
				
							
							* 시간  <input type="time" min="10:00" max="20:00" name="reservationTime" required><br><br>
							
							
							<label for="myPet">* 마이펫 정보 </label>	
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