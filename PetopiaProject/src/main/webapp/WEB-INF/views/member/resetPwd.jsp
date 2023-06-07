<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID찾기</title>

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
    

   
   #modal{
   	display :none;
   }
</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>
 
 <br>
 <h1  align="center" >비밀번호 재설정</h1>
   

    <hr style="border:2px solid black; width:600px">
    
    <div class="outer" align="center">
    
	
    <form action="findEmail.me" method="post"  id="idSearh-form">
      
   
        <table id="serch" align="center" >
           
            <tr >
                <td colspan="2" height="10%" id="find-nickname"><h4>비밀번호 재설정</h4></td>
            </tr>
            <tr>
                <td><input type="password" id="memberPwd" name="memberPwd" placeholder="새로운 비밀번호를 입력해주세요" required ></td>
             	<td>  <div id="pwdhidden" class="hidden"></td>
            </tr>
               <tr >
                <td colspan="2" height="10%" id="find-nickname"><h4>비밀번호 재설정 확인</h4></td>
            </tr>
            <tr>
                <td ><input type="password" id="checkPwd" name="checkPwd" placeholder="비밀번호를 동일하게 입력해주세요" required ></td>
            	 <td>  <div id="checkhidden" class="hidden"></td>
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
            	
             //  console.log("hi");
                console.log('${param.k}');

                $.ajax({
                    url : 'updatePwd.me',
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
                        }
                    },
                    error : () =>{
                        console.log('실패');
                        
                    }

                });
                
                
                //가입조건 충족시 버튼 속성 변경
              
             
             // checkPwd.setAttribute('type', 'submit');
              
            };
        }
        //비밀번호 체크
        
        memberPwd.onchange = () =>{

       
            if(regExpPwd(memberPwd.value)== true ){
                pwdCheck = 1;
                //$('#pwdhidden').css('display', 'none');
                pwdhidden.style.display = 'none';
            }else {
                //$('#pwdhidden').css({'display': 'block', 'color' :'red'}).text('영문자, 숫자를 포함한 8~15자를 입력하세요');
                //memberPwd.focus();
                pwdhidden.style.display = 'block';
                pwdhidden.style.color = 'red';
                pwdhidden.innerText = '영문자, 숫자를 포함한 8~15자를 입력하세요';
                memberPwd.focus();
                pwdCheck = 0;
            }
          
        }
    

        //비밀번호 입력확인
        checkPwd.onchange =  () => {
           
            if(checkPwd.value == memberPwd.value){
                pwdCheck2 = 1;
                //$('#checkhidden').css('display', 'none')
                checkhidden.style.display = 'none';
            }else{
               // $('#checkhidden').css({'display': 'block', 'color' :'red'}).text('비밀번호를 동일하게 입력해주세요');
               checkhidden.style.display = 'block';
               checkhidden.style.color = 'red';
               checkhidden.innerText = '비밀번호를 동일하게 입력해주세요';
               checkPwd.focus();
                pwdCheck2 = 0;
            }
        }
        
    }
    
    </script>


  

    
    <jsp:include page="../common/footer.jsp"/>

    

</body>
</html>