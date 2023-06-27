<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 대기 조회</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>
	.shippingList-table {
	  width: 85%;
	  border-collapse: collapse;
	  margin-top: 100px;
	  text-align: center;
	  margin: auto;
	}

	.shippingList-table th, .shippingList-table td {
	  padding: 8px;
	  border: 1px solid #ddd;
	}

	.shippingList-table th {
	  background-color: #f2f2f2;
	}

	.shippingList-table tr:nth-child(even) {
	  background-color: #f9f9f9;
	}
	
	#pagingArea {
            width: fit-content;
            margin: auto;
            margin-top : 20px;
        }
   
    
    #bt1{
    margin-top: 25px;
    margin-left: 600px;
    width: 100px;
    }
</style>
	<script>
	
		let receiptNos = [];
		var pi = "";
		$(function(){ 
			selectList(1);
		})
		
		function selectList(cPage){
			$.ajax({
				
				url : 'ajaxShippingList.ad',
				data : {
						currentPage : cPage
				},
				success : function(result){
	
				
				pi = result.pi;
				let value = '';
				let list = result.list;
				
				let paging = '';
				let btn ='';
				let cPage = pi.currentPage;
				let startPage = pi.startPage;
				let endPage = pi.endPage;
				let prev = cPage - 1;
	            let next = cPage + 1;
				let max = pi.maxPage;	
				let stp = result.stp;
				let edp = result.edp;
				 for(var i = stp; i < edp; i++){
					
					value += '<tr>'
						+ '<td><input type="checkbox" name="checkbox" class="checkbox"></td>'
						+ '<td>' + list[i].receiptNo + '</td>'
	                       + '<td>' + list[i].memberName + '</td>'
	                       + '<td>' + list[i].receiptDate + '</td>'
	                       + '<td>' + list[i].productTitle + '</td>'
	                       + '<td>' + list[i].amount + '</td>'
	                       + '<td>&#8361;' +list[i].resultPrice + '</td>'
	                       + '</tr>'
	                       
				   }
				 
				
				 $('.shippingList-table tbody').html(value);
				
				 if(cPage == 1){
	                	paging += '<li class="page-item disabled"><a class="page-link" href="#">&lt;-</a></li>';                		
	                } else {
	                	paging += '<li class="page-item"><a class="page-link" href="javascript:selectList(' + prev + ');">&lt;-</a></li>';
	                }
	                
	                for(let i = startPage; i <= endPage; i++){
	                	if(i != cPage){
							paging += '<li class="page-item"><a class="page-link" href="javascript:selectList(' + i + ');">' + i + '</a></li>';
	                	} else {
	                		paging += '<li class="page-item"><a class="page-link" style="background-color:#007BFF; color:white;" href="javascript:selectList(' + i + ');">' + i + '</a></li>';
	                	}
					}
	                
	                if(cPage == max){
	                	paging += '<li class="page-item disabled"><a class="page-link" href="#">-&gt;</a></li>';                		
	                } else {
	                	paging += '<li class="page-item"><a class="page-link" href="javascript:selectList(' + next + ');">-&gt;</a></li>';
	                }
	                
	                $('.pagination').html(paging);
					
	
	                 
	             
					 $('.shippingList-table tbody tr').hover(
					        function() {
					        	$(this).find('td').css('background-color', 'LightSkyBlue');
					        },
					        function() {
					        	$(this).find('td').css('background-color', '');
					        }
					  );
					
					
			
				/* 	 $('.shippingList-table').on('click', 'tr', function() {
						
						 $(this).find('td:eq(0)').prop('checked',true);
					     

					  }); */
					
				
					 $('.shippingList-table').on('dblclick', 'tr', function() {
						 
						    // 두 번째 <td> 요소를 선택합니다.
						    var secondTd = $(this).find('td:eq(1)');
						    // 두 번째 <td>의 값을 가져옵니다.
						    var value = secondTd.text();
						    
						    location.href = 'shippingDetail.ad?receiptNo=' + value ;

					});
					 
					 
					
				 
				
				}
			})
		}
	
		var checkboxes = document.getElementsByName('checkbox');
		
		function release(){
				for (var i = 0; i < checkboxes.length; i++) {
					  if (checkboxes[i].checked) {
						  receiptNos.push(checkboxes[i].parentNode.nextElementSibling.textContent);
					  }
					}
				
				$.ajax({
				
				type : 'post',
				url : 'ajaxShippingRelease.ad',
				data : {
						receiptNos : receiptNos
				},
				traditional: true,
				success : function(){
					selectList(1);
				}
			})
				
				receiptNos= [];
		}
		
		
		// 전체 선택 버튼 클릭시 전체 checked
		$(function(){
			$('#all').click(function(){
		        if($('#all').is(':checked') == true){
				$('input[type="checkbox"]').prop('checked',true);
		        }
		        else {
		          $('input[type="checkbox"]').prop('checked', false);
		        }
				
			}) 
	
		})
		
		//각 버튼 클릭시 아무것도 체크 안되어있으면 버튼 비활성화
	    //각 버튼 클릭시 전체가 체크되면 전체체크박스 활성화,비활성화
	   
	   $(document).on('click', 'input[name=checkbox]', function(){
		   if($('#all').is(':checked') == true && $('input[name=checkbox]:checked').length != $('input[name=checkbox]').length ){
			   $('#all').prop('checked', false);
		   }
		   if($('#all').is(':checked') == false && $('input[name=checkbox]:checked').length == $('input[name=checkbox]').length) {
			$('#all').prop('checked', true);
		   }
	   })
	  
		
	</script>
<body>

	<jsp:include page="../common/header.jsp" />

    <div id="main">
		<div id="main_left">
		
		</div>
		<div id="main_center">
			<div id="main_center_left">
				<jsp:include page="adminNavi.jsp" />
			</div>
			<div id="main_center_right" align="center">
				   <br>
				   <h1> 배송 대기 내역 </h1>
				   <br>
				<table class="shippingList-table">
				   <thead>
					<tr>
					  <th><input type="checkbox" id="all" /></th>
					  <th>주문 번호</th>
					  <th>구매자</th>
					  <th>주문 시간</th>
					  <th>주문 상품</th>
					  <th>총 수량</th>
					  <th>결제 금액</th>
					</tr>
					<tr>
					</tr>
					</thead>
					<tbody>
					</tbody> 
				</table>
				
				<button id="bt1" onclick= release()>출고</button>
				
			 	<div id="pagingArea">
				<ul class="pagination">
				</ul>
				</div>
			</div>
		</div>
		
		<div id="main_right">

		</div>
		
	</div>

	 <jsp:include page="../common/footer.jsp" />
	 
</body>
</html>