<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID찾기</title>
<style>
    #serch{
        
        margin: auto;
        width: 400px;
        height: 300px;
        margin-top: 30px;
    }
    #emailSearchbtn{
        width: 400px;
        height: 50px;
        background-color: black;
        color: white;
    }
     #nickname{
        width: 100%;
        height: 50px;
    }
    #find-nickname{
        padding-top: 20px;
    }
    
   #email-btn, #pwd-btn{
   
    border: none;
    border-radius: 10px;
    background-color: white;
    color: #052159;
    width: 300px;
    height: 50px;
    box-sizing: border-box;
    font-size: 20px;
   }
</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>
 
 <br>
 <h1  align="center" >이메일 찾기</h1>
   

    <hr style="border:2px solid black; width:600px">
    
    <div class="outer" align="center">
    
	<!--  
    <form action="findEmail.me" method="post"  id="idSearh-form">
      </form>
    -->
        <table id="serch" align="center" >
           
            <tr >
                <td height="10%" id="find-nickname"><h4>가입한 닉네임으로 찾기</h4></td>
            </tr>
            <tr>
                <td><input type="text" id="nickname" name="nickname" placeholder="닉네임"></td>
            </tr>
            

        </table>
        <br><br>
        <hr style="border:2px solid black; width:600px">
        <br><br>
        <div align="center">
            <button type="button" id="emailSearchbtn">이메일찾기</button>
        </div>
   </div>


  
    
    <script type="text/javascript">
    	
    	$(() => {
    		
    		$('#emailSearchbtn').on('click', () => {
    			
	    		var $nickname = $('#nickname');
	    		console.log(nickname);
	    		
	    		$.ajax({
	    			url : 'findEmail.me',
	    			type: 'POST',
	    			data : {
	    				nickname : $nickname.val()
	    			},
	    			success : result => {
	    				console.log(result);
	    				if(result != 'NO'){
	    					
		    				alert('회원님의 Email은 ' + result +'입니다');
		    				$nickname.val('');
	    				}else{
	    					alert('닉네임을 다시 입력해주세요');
	    				}
	    			},
	    			error : () => {
	    				console.log('실패');
	    			}
	    			
	    		});
    		});
    		
    		
    		
    		
    	})
    
    
    </script>
    
    <jsp:include page="../common/footer.jsp"/>

    

</body>
</html>