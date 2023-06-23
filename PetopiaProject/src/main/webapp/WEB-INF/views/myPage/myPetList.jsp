<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#main_center_right_top{
		border: 1px solid pink;
		width:400px;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

    <div id="main">
		<div id="main_left">
		
		</div>
		<div id="main_center">
			<div id="main_center_left">
				<jsp:include page="myPageNavi.jsp" />
			</div>
			<div id="main_center_right">
				<div id="main_center_right_top">
					<c:choose>
						<c:when test="${ empty pet.memberNo }">
							<form action="insertMyPet.me" method="post" id="enroll-form">
							<div id="petInfo">
		                        <label for=""> &nbsp; 성별 : </label> &nbsp;&nbsp;
		                        <input type="radio" id="Male" value="M" name="gender" checked>
		                        <label for="Male">남자</label> &nbsp;&nbsp;
		                        <input type="radio" id="Female" value="F" name="gender">
		                        <label for="Female">여자</label> &nbsp;&nbsp;
		                        <br>
		                        <br>
		                        <label for="species"> &nbsp; 반려동물 종류 : </label>
		                        <input type="text" class="form-control" id="species" placeholder="예시)믹스견" name="species" > <br>
		
		                        <label for="petName"> &nbsp; 반려동물 이름 : </label>
		                        <input type="text" class="form-control" id="petName" placeholder="반려동물 이름" name="petName" > <br>
		                        
		                        <label for="age"> &nbsp; 반려동물 나이 : </label>
		                        <input type="number" class="form-control" id="age" placeholder="나이를 입력해주세요" name="age" > <br>
		                    	
		                    	<label for="weight"> &nbsp; 반려동물 무게 : </label>
		                        <input type="number" step="0.1" class="form-control" id="weight" placeholder="몸무게를 입력해주세요(kg제외)" name="weight" ><br>
		                    </div>
		                    <br>
			                <div class="btns" align="center">
			                    <button type="submit" class="disabled btn btn-primary" id="join">펫 등록</button>
			                    <button type="reset" class="btn btn-danger">초기화</button>
			                </div>
			                </form>
	                    </c:when>
	                    <c:otherwise>
	                   		<div>
	                   			dfsa
	                   		</div>
	                    </c:otherwise>
	                </c:choose>
				</div>
				
				<div id="main_center_right_bottom">
							
				</div>
			</div>
		</div>
		<div id="main_right">
			
		</div>
		
	</div>
	
	<script>
		console.log(${pet.memberNo});
	</script>
	
	<jsp:include page="../common/footer.jsp" />
	
	
	
	
	
	
	
	
	
</body>
</html>