<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="cocoaModal" role="dialog" aria-hidden="false" class="modal in modal_site_change_password" data-backdrop="true" data-keyboard="true" style="display: block; padding-left: 26px;">
			<div class="modal-dialog ui-draggable">
				<div class="modal-content"><!-- 비밀번호 찾기 -->
				<article class="modal_article pop p_lr_space pb16 bg-white no-padding" id="find_step_4">
					<div class="tit_wrap">
						<button class="close" data-dismiss="modal" aria-label="Close" data-toggle="tooltip" data-placement="bottom" data-original-title="닫기"><i class="btl bt-times"></i></button>
						<h2 class="find_tit _find_pw_title" ">비밀번호 변경</h2>
					</div>	
					<div class="force-padding _result_update_password_wrap">
						<form id="find_password_form">
							<div class="_token_obj" data-type="change_password">
								<input type="hidden" name="write_token" class="_tk_obj" value="rg0MBL8RMpVSzweDsj7MvBZ0QDr/vxtej8MmnQMv1bAJPPsZyo8gp3yjDelOe/TjXztXxOzFNVpJsSBmlMMkMCPl4GU5n239ckxIw9UkfljaH6SpxuyowqIVqJvtKSex">
								<input type="hidden" name="write_token_key" class="_tk_key_obj" value="5521">
							</div>
			
							<input type="hidden" name="k" value="${ param.k }">
							<input type="hidden" name="mode" value="change_password">
							<div class="mb8">
								<div class="form-group input-group input-group-login">
									<input class="form-control" title="새 비밀번호" type="password"  id="memberPwd" name="memberPwd" onchange="checkPwd1();" placeholder="새 비밀번호">
									<div id="pwdhidden" class="hidden"></div><br>
									<input class="form-control" title="새 비밀번호 확인" id="checkPwd" type="password" name="checkPwd" onchange="checkPwd2();" placeholder="새 비밀번호 확인">
									  <div id="checkhidden" class="hidden"></div><br>
								</div>
							</div>
						</form>
					<p class="txt_c mt16">
						<button  class="btn btn-primary w100p h48" onclick="changePwd();">변경하기</button>
					</p>
					<p class="text-12 margin-bottom-xxl tip_bold"><span class="text-brand">TIP</span> 비밀번호에 영문 대소문자, 숫자, 특수문자를 조합하시면 안전도가 높아져 도용의 위험이 줄어듭니다.</p>
				</div>
			</article>
		
	<script> 

        
  
        

      
        //정규 표현식 함수
        
        function regExpPwd(pwd) { //8~15자 영문, 숫자 조합
            var regPwd = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/;
            return regPwd.test(pwd);
        }
      

       
        var pwdCheck = 0;
        var pwdCheck2 = 0;
        
        let chpwd = document.getElementById('changePassword');
        let findPwd = document.getElementById('find_password_form');
        let memberPwd = document.getElementById('memberPwd');
        let checkPwd  = document.getElementById('checkPwd');
        let pwdhidden= document.getElementById('pwdhidden');
        let checkhidden = document.getElementById('checkhidden');
       


        //가입조건 충족시 버튼 속성 변경
      
        console.log(memberPwd);
        function changePwd(){
            if(  pwdCheck == 1 && pwdCheck2 ==1 ) {
                console.log("hi");

                ajax({
                    url : 'updatePwd.me',
                    type: 'post',
                    data: {
                        memberPwd : memberPwd.value
                    },
                    success : result =>{
                        console.log(result);
                    },
                    error : () =>{
                        console.log('실패');
                    }

                });
            };
        }
       
           
            
        

       

        
        //비밀번호 체크
        function checkPwd1(){
            
            
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
        function checkPwd2(){
           
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
        
        
    
    </script>
			
			
			</div>
		</div>
	</div>



</body>
</html>