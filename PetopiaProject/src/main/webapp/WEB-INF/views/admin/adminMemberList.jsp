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
	  width: 40%;
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
	
	<script>
		$(function(){
			$.ajax({
				url : 'ajaxMemberList.ad',
				success : function(list){
					console.log(list);
				 	}
			})
		})
	
	</script>

	
	<jsp:include page="../common/header.jsp"/>
	
	<div id="outer"> 
	<h1> 회원 목록 </h1>
	
		<table class="memberList-table">
		  <tr>
		    <th>회원번호</th>
		    <th>이름</th>
		    <th>전화번호</th>
		    <th>주소</th>
		    <th>가입일</th>
		    <th>상태</th>
		  </tr>
		  <tr>
		    <td>1</td>
		    <td>홍길동</td>
		    <td>010-1234-5678</td>
		    <td>서울시 강남구</td>
		    <td>2021-01-01</td>
		    <td>활성</td>
		  </tr>
		  <tr>
		  	<c:forEach items="${ list }" var="b">
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
		  	</c:forEach>
		  </tr>
		 
		</table>
		
		
		
		
		<div class="search">
		  <input type="text" placeholder="검색어를 입력하세요">
		  <select>
		    <option value="memberName">이름</option>
		    <option value="memberNo">회원번호</option>
		    <option value="status">상태</option>
		  </select>
		  <button class="search-btn">검색</button>
		</div>
	
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>