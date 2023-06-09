<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>

	.memberList-table {
	  width: 50%;
	  border-collapse: collapse;
	  margin-top: 100px;
	  text-align: center;
	  margin: auto;
	}

	.memberList-table th, .memberList-table td {
	  padding: 8px;
	  border: 1px solid #ddd;
	}

	.memberList-table th {
	  background-color: #f2f2f2;
	}

	.memberList-table tr:nth-child(even) {
	  background-color: #f9f9f9;
	}
	
	#pagingArea {
            width: fit-content;
            margin: auto;
            margin-top : 20px;
        }
	
	.search {
	  margin-bottom: 10px;
	  margin: auto;
	}
	
	input[type="text"], select {
	  padding: 5px;
	  margin-right: 5px;
	}
	
	.search-btn {
	  padding: 5px 10px;
	  margin-top: 50px;
	}
	
	h1{
	  margin-top: 40px;	
	  margin-bottom: 30px;
	}
	
	#outer{
	 text-align: center;
	}

 </style>
 
</head>
<body>
	
	
	<jsp:include page="../common/header.jsp"/>
	
	<div id="outer"> 
	<h1> 회원 목록 </h1>
	
		<table class="memberList-table">
		  <thead>
			  <tr>
			    <th>회원번호</th>
			    <th>이름</th>
			    <th>전화번호</th>
			    <th>주소</th>
			    <th>가입일</th>
			    <th>상태</th>
			  </tr>
		  </thead>
		  <tbody>
		  </tbody>
		</table>
			
			<div id="pagination">
            <%-- 
            <ul class="pagination">
				-- <c:choose>
                        <c:when test="${pi.currentPage eq 1}">
                            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>                		
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="javascript:selectList(${pi.currentPage - 1});">Previous</a></li>
                        </c:otherwise>
                    </c:choose> -
                    
                     <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                        <li class="page-item"><a class="page-link" href="javascript:selectList( ${p});">${p}</a></li>                    
                    </c:forEach> 
                    
                    <c:choose>
                        <c:when test="${pi.currentPage eq pi.endPage}">
                            <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>                    	
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="javascript:selectList( ${pi.currentPage + 1});">Next</a></li>
                        </c:otherwise>
                    </c:choose>
            </ul>
             --%>
		</div>
    
	<script>

		var pi = "";
		$(function(){
			selectList(1);
		})

		function selectList(cPage){
			$.ajax({
				url : 'ajaxMemberList.ad',
				data: {
						currentPage : cPage
				},
				success : function(result){
				
				pi = result.pi;
				let value = '';
				let list = result.list;
				let statusColor = "black";	
					for(let i in list){
						
						if (list[i].status === '블랙') {
					      statusColor = 'red';
				    	} else if(list[i].status === '탈퇴'){
				    	  statusColor = 'lightGray';
				    	}
								
						value += '<tr>'
							+ '<td>' + list[i].memberNo + '</td>'
	                        + '<td>' + list[i].memberName + '</td>'
	                        + '<td>' + list[i].phone + '</td>'
	                        + '<td>' + list[i].address + '</td>'
	                        + '<td>' + list[i].enrollDate + '</td>'
	                        + '<td style="color: ' + statusColor + ';">' + list[i].status + '</td>'
	                        + '</tr>'
	                        
					}
					$('.memberList-table tbody').html(value);
					
					/* 
					let pagination = "";
					
					if(pi.currentPage == 1){
						pagination += " <li class='page-item disabled'><a class='page-link' href='#'>Previous</a></li> "                
					} else{
						pagination += "<li class='page-item'><a class='page-link' href='javascript:selectList(pi.currentPage - 1});'>Previous</a></li>"
					}
                    
					for(var p = pi.startPage; p <= pi.endPage; p++){
					 pagination += "<li class='page-item'><a class='page-link' href='javascript:selectList(p);''>p</a></li>"                    
                    } 
 					*/
					
					$('#pagination').html(pagination);
					
					
					$('.memberList-table tbody tr').hover(
					        function() {
					        	$(this).find('td').css('background-color', 'LightSkyBlue');
					        },
					        function() {
					        	$(this).find('td').css('background-color', '');
					        }
					      );
					
					
					
				 }
			})
		}
		
	
	</script>
		

		<div class="search">
				  <input type="text" placeholder="검색어를 입력하세요" id="keyword" name="keyword">
				  <select name="searchType">
				    <option value="memberName" >이름</option>
				    <option value="memberNo">회원번호</option>
				    <option value="status">상태</option>
				  </select>
				  <button type="button" id="memberSearchBtn" class="search-btn">검색</button>
		</div>
	
	<script>

	
	$(() => {
		
		
		
		$('#memberSearchBtn').click(() =>{
			
			var searchType = $('select[name="searchType"]').val();
		    var keyword = $('#keyword').val();
		
			
		    if(searchType === 'memberNo'){
		    	var memberNo = parseInt(keyword);
		    	if (isNaN(memberNo)) {
		    		alert('숫자로 입력 바랍니다.');
		    	    }
		    } else if(searchType === 'status'){
		    	keyword = keyword.toUpperCase();
		    	if(keyword != 'Y' && keyword != 'N' && keyword != 'B'){
		    		alert("'Y' 혹은 'N'을 입력 바랍니다.");
		    	} 
		    }
		    	
			$.ajax({
				url : 'ajaxMemberSearch.ad',
				data: {
					currentPage : cPage,
					searchType: searchType, 
					keyword: keyword 
			         
				},
				success : function(result){
				console.log(result);
				let value = '';
				let list = result.list;
				
					for(let i in list){
						value += '<tr>'
							+ '<td>' + list[i].memberNo + '</td>'
	                        + '<td>' + list[i].memberName + '</td>'
	                        + '<td>' + list[i].phone + '</td>'
	                        + '<td>' + list[i].address + '</td>'
	                        + '<td>' + list[i].enrollDate + '</td>'
	                        + '<td>' + list[i].status + '</td>'
	                        + '</tr>'
					}
					$('.memberList-table tbody').html(value);
				 }
			})
		
	
		})
	})	
		
	
    
	
	

	</script>	
	
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>