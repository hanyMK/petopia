<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>매출 관리</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<style>
	#myChart{
	margin-top: 80px;
	}
</style>
<body>

    <jsp:include page="../common/header.jsp" />

    <div id="main">
		<div id="main_left">
		
		</div>
		<div id="main_center">
			<div id="main_center_left">
				<jsp:include page="adminNavi.jsp" />
			</div>
			<div id="main_center_right" align="center";>
				   <br><br>
					  ${month}월의 매출!
					
				<div style="width: 60%; height:150px;"> 
					<!--차트가 그려질 부분-->
					<canvas id="myChart"></canvas>
				</div>
			
			</div>
		</div>
		<div id="main_right">

		</div>
		
	</div>
	
	<script type="text/javascript">
	var context = document
		.getElementById('myChart')
		.getContext('2d');
	
	var store = "${store}";
	var reservation = "${reservation}";
	
	var myChart = new Chart(context, {
		type: 'doughnut', // 차트의 형태
		data: { // 차트에 들어갈 데이터
			labels: [
				//x 축
				'상점','미용'
			],
			datasets: [
				{ //데이터
					label: '상점', //차트 제목
					fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
					data: [
						store, reservation //x축 label에 대응되는 데이터 값
					],
					backgroundColor: [
						//색상
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)'
					],
					borderColor: [
						//경계선 색상
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)'
					],
					borderWidth: 1 //경계선 굵기
				}
			]
		},
		options: {
			scales: {
				yAxes: [
					{
						ticks: {
							beginAtZero: true
						}
					}
				]
			}
		}
	});
</script>
	
    <jsp:include page="../common/footer.jsp" />

	
</body>
</html>