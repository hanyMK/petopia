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
    #searchbtn{
        width: 400px;
        height: 50px;
        background-color: black;
        color: white;
    }
     #title{
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
   
   #modal{
   	display :none;
   }
</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>
 
 <br>
 <h1  align="center" >${ requestScope.title }</h1>
   

    <hr style="border:2px solid black; width:600px">
    
    <div class="outer" align="center">
    
	<!--  
    <form action="findEmail.me" method="post"  id="idSearh-form">
      </form>
    -->
        <table id="serch" align="center" >
           
            <tr >
                <td height="10%" id="find-nickname"><h4>${ requestScope.findTitle }</h4></td>
            </tr>
            <tr>
                <td><input type="text" id="title" name="title" placeholder="${ requestScope.findTitle }"></td>
            </tr>
            

        </table>
        <br><br>
        <hr style="border:2px solid black; width:600px">
         	<a href="findEmail"  style="color:black; text-decoration: none;">이메일</a>
            <a href="findPwd"  style="color:black; text-decoration: none;">/ 비밀번호 찾기</a>
        <br><br>
        <div align="center">
            <button type="button" id="searchbtn">${ requestScope.title }</button>
        
        </div>
   </div>


  
    
    <script type="text/javascript">
    	
    	$(() => {
    		var $title = $('#title');
    		$('#searchbtn').on('click', () => {
    			
    			if('${ requestScope.title }' == '이메일 찾기'){
    				
		    		console.log($title.val());
		    		
		    		$.ajax({
		    			url : 'findEmail.me',
		    			type: 'POST',
		    			data : {
		    				nickname : $title.val()
		    			},
		    			success : result => {
		    				console.log(result);
		    				if(result != 'NO'){
		    					$('#result').text(result);
		    					$('#modal').click();
		    					$title.val('');
		    				
		    				}else{
		    					alert('닉네임을 다시 입력해주세요');
		    				}
		    			},
		    			error : () => {
		    				console.log('실패');
		    			}
		    			
		    		});
    			}else{
    				$.ajax({
		    			url : 'findPwd.me',
		    			type: 'POST',
		    			data : {
		    				checkEmail : $title.val()
		    			},
		    			success : result => {
		    				console.log(result);
		    				if(result != 'NO'){
		    					alert('회원님의 이메일로 비밀번호 변경 주소를 보내드렸습니다. 이메일 함을 확인해주세요');
			    				
			    				$title.val('');
		    				}else{
		    					alert('닉네임을 다시 입력해주세요');
		    				}
		    			},
		    			error : () => {
		    				console.log('실패');
		    			}
		    			
		    		});
    			}
    		});
    		
    		
    		
    	})
    	
    	
    </script>
    
     <button id="modal" type="button" class="btn btn-danger" data-toggle="modal" data-target="#emailFindModal">이메일 찾기</button>
    
    
    <div class="modal" id="emailFindModal"  role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" >
	<div class="modal-dialog" style="width:850px;">
		<div class="modal-content" >
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					×
				</button>
				<h4 class="modal-title" id="myModalLabel">이메일 찾기</h4>
			</div>
			<div class="modal-body">
				<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-4" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false" data-widget-togglebutton="false">
					<div role="content">
						<div class="widget-body">		
							회원님의 Email은 <b id="result"></b> 입니다'
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button"  class="btn btn-default" data-dismiss="modal">확인</button>
				<button  type="button"  class="btn btn-primary" id="btn_login">로그인</button>
			</div>
		</div>
	</div>
</div>
    

    
    <script>
    	var goLogin = document.getElementById('btn_login');

        goLogin.onclick = ()=>{
            location.href = 'login';
        }
    	
    </script>
    
  
    	
    	
    
    

    
    <jsp:include page="../common/footer.jsp"/>

    

</body>
</html>