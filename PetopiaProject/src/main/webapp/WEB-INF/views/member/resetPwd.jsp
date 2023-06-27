<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀 번호 찾기</title>

     <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


	
<style>
    #serch{
        
        margin: auto;
        width: 400px;
        height: 200px;
        margin-top: 30px;
    }
    #changePassword{
        width: 400px;
        height: 50px;
        background-color: black;
        color: white;
    }
     #memberPwd,#checkPwd{
        width: 100%;
        height: 50px;
    }
    #find-nickname{
        padding-top: 20px;
    }
    hidden{
        display: none;
    }
  
</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>
 
 <br>
 <h1  align="center" >비밀번호 재설정</h1>
   

    <hr style="border:2px solid black; width:600px">
    
    <div class="outer" align="center">
    
	
    <form action="findEmail.member" method="post"  id="idSearh-form">
      
   
        <table id="serch" align="center" >
           
            <tr >
                <td colspan="2" height="10%" id="find-nickname"><h4>비밀번호 재설정</h4></td>
                
            </tr>
            <tr>
                <td><input type="password" id="memberPwd" name="memberPwd" placeholder="새로운 비밀번호를 입력해주세요" required ></td>
            </tr>
            <tr id="hiddenPwd">
                <td><div id="pwdhidden"></div></td>
            </tr>
            <tr>
                <td colspan="2" height="10%" id="find-nickname"><h4>비밀번호 재설정 확인</h4></td>
            </tr>
            <tr>
                <td ><input type="password" id="checkPwd" name="checkPwd" placeholder="비밀번호를 동일하게 입력해주세요" required ></td><br>
            </tr>
            <tr id="hiddenChek"> 
                <td><div id="checkhidden" class="hidden"></div></div></td>
            </tr>

        </table>
        <br><br>
        <hr style="border:2px solid black; width:600px">
         	
        <br><br>
        <div align="center">
            <button type="button" id="changePassword" >비밀번호 재설정</button>
        
        </div>
        
   </div>
   </form>
   
   
   <script> 
        
    
      
        //정규 표현식 함수
        
        function regExpPwd(pwd) { //8~15자 영문, 숫자 조합
            var regPwd = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/;
            return regPwd.test(pwd);
        }
      

       
        var pwdCheck = 0;
        var pwdCheck2 = 0;
        
        let chpwd = document.getElementById('changePassword');
        let memberPwd = document.getElementById('memberPwd');
        let checkPwd  = document.getElementById('checkPwd');
        let pwdhidden= document.getElementById('pwdhidden');
        let checkhidden = document.getElementById('checkhidden');
       


        //가입조건 충족시 버튼 속성 변경
      window.onload = () => {
		var paramK = '${ param.k}';
        chpwd.onclick = () => {
            if(  pwdCheck == 1 && pwdCheck2 ==1 ) {
                $.ajax({
                    url : 'updatePwd.member',
                    type: 'post',
                    data: {
                        memberPwd : memberPwd.value,
                        k : paramK
                    },
                    success : result =>{
                        console.log(result);
                        if(result == 'YES'){
                        alert('비밀번호가 변경되었습니다');
                        	location.href='login';
                        }else{
                            alert('비밀번호 변경 시간이 초과 되었습니다.');
                        }
                    },
                    error : () =>{
                        console.log('실패');                        
                    }
                });
            }else{
                alert('비밀번호를 다시 확인해 주세요');
            }
        }
        //비밀번호 체크
        
        memberPwd.onchange = () =>{
            console.log(memberPwd.value);
            console.log(regExpPwd(memberPwd.value));
            
            if(regExpPwd(memberPwd.value) == true){
                pwdCheck = 1;
                pwdhidden.style.display = 'none';
                pwdhidden.style.color = 'black';
            }else {
                memberPwd.style.color = 'red';
                pwdhidden.style.display = 'block';
                pwdhidden.innerText = '영문자, 숫자를 포함한 8~15자를 입력하세요';
                pwdhidden.style.color = 'red';
                memberPwd.focus();
                pwdCheck = 0;
            }
        }
    

        //비밀번호 입력확인
        checkPwd.onchange =  () => {
            if(checkPwd.value == memberPwd.value){
                pwdCheck2 = 1;
                checkhidden.style.display = 'none';
            }else{
                checkhidden.style.display = 'block';
                checkhidden.innerText = '비밀번호를 동일하게 입력해주세요';
                checkhidden.style.color = 'red';
               checkPwd.focus();
                pwdCheck2 = 0;
            }
        }
        
    }
    
    </script>


    
    <jsp:include page="../common/footer.jsp"/>

    

</body>
</html>