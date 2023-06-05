<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 쿠폰 발급 </title>

   <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style type="text/css">
    
    </style>

</head>
<body>

	
    <jsp:include page="../common/header.jsp" />

    <div id="main">
		<div id="main_left">
		
		</div>
		<div id="main_center">
			<div id="main_center_left">
				<jsp:include page="adminNavi.jsp" />
			</div>
			<div id="main_center_right">
				<div id="main_right">
			 <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">쿠폰 발급</button>

	<h1>나오긴 해??
	</h1>
			
			</div>
		</div>

		</div>
		
	</div>
	
    <jsp:include page="../common/footer.jsp" />
	
		

	
	  <!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
    <div class="modal fade" id="deleteForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">쿠폰 발급</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="delete.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                     <form action="test.me" method="post" id="sign-form">
    
			            <table align="center">
			            
			                <tr>
			                    <th>쿠폰 이름 :</th>
			                    <td><input type="password" name="userPwd" id="userPwd" maxlength="20" required></td>
			                    
			    
			                </tr>
			                <tr>
			                    <th>쿠폰 타입 :</th>
			                    <td><input type="password" name="checkPwd"  maxlength="20" required></td>
			    
			                </tr>
			               
			                <tr>
			                    <th>할인가 :</th>
			                    <td><input type="text" name="userName" id="userName" maxlength="5" required></td>
			                </tr>
			             
			                <tr>
			                    <th>시작일 : </th>
			                    <td><input type="email"  name="email"></td>
			                </tr>
			                <tr>
			                    <th>종료일 : </th>
			                    <td><input type="email"  name="email"></td>
			                </tr>
			                <tr>
			                    <th>최대할인 금액 : </th>
			                    <td><input type="email"  name="email"></td>
			                </tr>
			                <tr>
			                    <th>최소사용 금액 : </th>
			                    <td><input type="email"  name="email"></td>
			                </tr>
			           
			                
			            </table>
			            </form>
                    
                    	<!--  
                        <div align="center">
              				쿠폰 이름 : <input tyep="text" name="copu"><br>
              				쿠폰 타입 : <input tyep="text" name="copu"><br>
              				쿠폰 이름 : <input tyep="text" name="copu"><br>
              				할인가 : <input tyep="text" name="copu"><br>
              				시작일 : <input tyep="text" name="copu"><br>
              				종료일: <input tyep="text" name="copu"><br>
              				최대할인 금액 : <input tyep="text" name="copu"><br>
              				최소사용 금액 : <input tyep="text" name="copu"><br>
                        </div>-->
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">쿠폰 발급하기</button>
                        <button type="reset" class="btn btn-danger">초기화</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>