<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%; 
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        #petInfo{
            display: none;
        }
        #upfile{
        height: 100px;
        width:100px;
        border-radius:80px;
        border:none;
        }
        .hidden{
            display: none;
        }


    </style>
</head>
<body>
    
    <!-- 메뉴바 -->
    <jsp:include page="../common/header.jsp" />
   

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>회원가입</h2>
            <br>

            <form action="join.me" method="post" id="enroll-form" enctype="multipart/form-data">
                <div class="form-group">
                    <img name="upfile" id="upfile" src="https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male4-256.png">
                   
                    <div id="file-area">
		          <!-- 1개만 가능 -->
                        <input type="file" id="profile" name="upfile" onchange="loadImg(this, 1);">
                         <button value="reset" type="reset">삭제</button>
                    </div>
                 
                 <br>
					

                    <label for="email"> &nbsp; 이메일 : </label>
                    <input type="email" class="form-control" id="memberEmail" placeholder="이메일 입력" name="email" onchange="checkEmail();"> <br>
                    <div id="emailhidden" class="hidden"></div><br>
                    
                    
					 <label for="nickname">* 닉네임 : </label>
                    <input type="text" class="form-control" id="nickname" placeholder="닉네임" name="nickname" required onchange="checkNickname();"> <br>
                    <div id="nicknamehidden" class="hidden"></div><br>
					
                    
                    <label for="userPwd">* 비밀번호 : </label>
                    <input type="password" class="form-control" id="memberPwd" placeholder="영문자, 숫자를 포함한 8~15자를 입력하세요" minlength="8" maxlength="15" name="memberPwd" required onchange="checkPwd1();"><br>
                    <div id="pwdhidden" class="hidden"></div><br>

                    <label for="checkPwd">* 비밀번호 확인 : </label>
                    <input type="password" class="form-control" id="checkPwd" placeholder="영문자, 숫자를 포함한 8~15자를 입력하세요" minlength="8" maxlength="15" required onchange="checkPwd2();"> <br>
                    <div id="checkhidden" class="hidden"></div><br>
                    
                    <label for="userName">* 이름 : </label>
                    <input type="text" class="form-control" id="memberName" placeholder="이름" name="memberName" required onchange="checkName();"> <br>
                    <div id="namehidden" class="hidden"></div><br>

                    
                    <div>
                        <p>* 생년월일</p>
                         <select name="birthday_y" id = "years" required>
                              <script>
                                  for(i=new Date().getFullYear(); i>1900; i--){
                                      document.write("<option>" + [i] + "</option>");
                                  }
                              </script>
                          </select>
                          <select name="birthday_m" id = "month" required>
                              <script>
                                  for(i=1; i<13; i++) {
                                	 if( i >= 1 && i <10){
                                		 document.write("<option>0" +  +[i] + "</option>");
                                	 }else{
                                		 
                                     	document.write("<option>" + [i] + "</option>");
                                	 }
                                  }
                              </script>
                          </select>
                          <select name="birthday_d" id="day" required>
                              <script>
                             
                                      for(i=1; i<32; i++) {
                                    	  if(1<= i  && i <10){
                                         	 document.write("<option>0" + [i] + "</option>");
                                    		  
                                    	  }else{
                                    		  document.write("<option>" + [i] + "</option>");
                                    	  }
                                      }
                              
                              </script>
                          </select>
                          <i id = "birthdayEmo" class="fa-solid fa-calendar"></i>  
                     </div>

                     
                    <br>
                   <!-- <input type="text" class="form-control" id="birthday" placeholder="생년월일 8자리(99.01.01)" name="birthday"> <br>-->

                    <label for="phone"> &nbsp;* 전화번호 : </label>
                    <input type="tel" class="form-control" id="phone" placeholder="전화번호" name="phone" onchange="checkPhone();"> <br>
                    <div id="phonehidden" class="hidden"></div><br>

                    <label for="address"> &nbsp;* 주소 : </label><br>
                    <input type="text" id="postcode" name="address" placeholder="우편번호">
					<input type="button" onclick="findPostcode()" value="주소 검색"><br>
                     <input type="text" class="form-control" id="address" placeholder="주소" name="address"> 
					<input type="text"  class="form-control" id="detailAddress" name="address" placeholder="상세주소"><br>
					
                  
                    <label for="address"> &nbsp;* 계좌번호 : </label>&nbsp;
                    <br>
                    <select name="bank" id="bank" required>
                        <option >은행</option>
                        <option value="농협">농협</option>
                        <option value="우리">우리</option>
                        <option value="신한">신한</option>
                        <option value="기업">기업</option>
                        <option value="하나">하나</option>
                        <option value="카카오뱅크">카카오뱅크</option>
                        <option value="새마을금고">새마을금고</option>
                    </select>                    
                    <input  type="number" id="payAccount" class="form-control" name="account" placeholder="-를 제외하여 입력하세요" required>
                    <br>
                    <br>
                    <label for="havePet"> &nbsp; 반려동물 유무 : </label>
                    <input type="radio" id="noPet" value="N" name="isPet" checked="true" required>
                    <label for="noPet">없음</label> &nbsp;&nbsp;
                    <input type="radio" id="havePet" value="Y" name="isPet">
                    <label for="havePet">있음</label> &nbsp;&nbsp;
                    <br>
                    <br>
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
                        <input type="number" class="form-control" id="age" placeholder="나이입력해주세요" name="age" value="0"> <br>
                    	
                    	<label for="weight"> &nbsp; 반려동물 무게 : </label>
                        <input type="number" class="form-control" id="weight" placeholder="몸무게를 입력해주세요(kg제외)" name="weight" value="0.0">kg <br>
                    
                    	
                    </div>
                </div> 
                <br>
                <div class="btns" align="center">
                    <button type="button" class="disabled btn btn-primary" id="join">회원가입</button>
                    <button type="reset" class="btn btn-danger">초기화</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>

    <script>
        $(function(){

            $('#havePet').on('change',function() {
                if($(this).prop('checked')){
                    $('#petInfo').css('display', 'block');
                    $('#species').prop('required',true); 
                    $('#petName').prop('required',true); 
                    $('#age').prop('required',true); 
                    $('#weight').prop('required',true); 
                    $('#noPet').attr('checked', false);
                }
                else{
                    $('#petInfo').css('display', 'none');
                }

            });
            $('#noPet').on('change',function() {
                if($(this).prop('checked')){
                    $('#petInfo').css('display', 'none');
                    $('#species').prop('required',false); 
                    $('#petName').prop('required',false); 
                    $('#petAge').prop('required',false); 
                    $('#weight').prop('required',false); 
                    $('#havePet').attr('checked', false);
                }
            })

        });



    </script>


    
    <script>
	    function findPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
				    var roadAddr = data.roadAddress; // 도로명 주소 변수

	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById('address').value = roadAddr;
	            }
	        }).open();
	    }
	</script>

    <script> 

  
        //정규 표현식 함수
        function regExpEmail(email) {      
            var regEmail =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            return regEmail.test(email);   
        }
        function regExpNickname(nickname) {      
            var regNickname =/^[ㄱ-ㅎ가-힣a-zA-Z0-9]+$/;       
            return regNickname.test(nickname);   
        }
        function regExpPwd(pwd) { //8~15자 영문, 숫자 조합
            var regPwd = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/;
            return regPwd.test(pwd);
        }
        function regExpPhone(phone) { //전화번호
            var regPhone = /^01([0|1|6|7|8|9])-([0-9]{4})-([0-9]{4})$/;
            return regPhone.test(phone);
        }
        function regExpName(name) { //이름
            var regName =  /^[가-힣]{2,10}$/;
            return regName.test(name);
        }

        var emailCheck = 0;
        var pwdCheck = 0;
        var pwdCheck2 = 0;
        var phoneCheck = 0;
        var nameCheck = 0;
        var nicknameCheck = 0;


        //가입조건 충족시 버튼 속성 변경
        $('#join').on('click', function(){
            if( emailCheck == 1 && phoneCheck == 1  && nameCheck == 1  && pwdCheck == 1 && pwdCheck2 ==1 && nicknameCheck ==1) {
                $(this).attr('type','submit');  
            }
            
        })

        //이메일 검사()
        function checkEmail(){
            
            var $email = $('.innerOuter #memberEmail');
            if(regExpEmail($email.val()) == true){
                $.ajax({
                    url: 'emailCheck.me',
                    type: 'post',
                    data : {checkEmail : $email.val()},
                    success : result => {
                        console.log(result);
                        if(result =='YYY'){
                        	
                        emailCheck = 1;
                        $('#emailhidden').css('display','none');
                        }else{
                        	$('#emailhidden').css('display','block').text('이미 존재하는 이메일 입니다.');
                            $email.focus();
                            emailCheck = 0;
                        }
                    },
                    error : () =>{
                        console.log('실패');
                        
                        
                    }
                })
            }else{

            }
            
        }

        //닉네임 체크
        function checkNickname(){
            var $nickname = $('.innerOuter #nickname');
            if(regExpNickname($nickname.val()) ==true){
                $.ajax({
                    url: 'nicknameCheck.me',
                    type: 'post',
                    data : {nickname : $nickname.val()},
                    success : result => {
                        console.log(result);
                        if(result =='YYY'){
                        	
                        nicknameCheck = 1;
                        $('#nicknamehidden').css('display','none');
                        }else{
                        	 $('#nicknamehidden').css('display','block').text('이미 존재하는 닉네임 입니다.');
                             $nickname.focus();
                             nicknameCheck = 0;
                        }
                    },
                    error : () =>{
                        console.log('실패');
                       
                       
                    }
                })
            }
        }

        //이름 체크
        function checkName(){
            var $name = $('.innerOuter #memberName');
            if(regExpName($name.val())== true){
                nameCheck = 1;
                $('#namehidden').css('display', 'none');
            }else{
                $('#namehidden').css('display', 'block').text('이름을 다시 확인해주세요');
                $name.focus();
                nameCheck = 0;
            }
        }
        //비멀번호 체크
        function checkPwd1(){
            var $pwd = $('.innerOuter #memberPwd');
            
            if(regExpPwd($pwd.val())== true ){
                pwdCheck = 1;
                $('#pwdhidden').css('display', 'none');
            }else {
                $('#pwdhidden').css('display', 'block').text('영문자, 숫자를 포함한 8~15자를 입력하세요');
                $pwd.focus();
                
                pwdCheck = 0;
            }
          
        }

        //비밀번호 입력확인
        function checkPwd2(){
            var $pwd = $('.innerOuter #memberPwd');
            var $checkPwd = $('.innerOuter #checkPwd');
            if($checkPwd.val() == $pwd.val()){
                pwdCheck2 = 1;
                $('#checkhidden').css('display', 'none')
            }else{
                $('#checkhidden').css('display', 'block').text('비밀번호를 동일하게 입력해주세요');
                $checkPwd.focus();
                pwdCheck2 = 0;
            }
        }
        
        //전화번호 확인
        function checkPhone(){
            var $phone = $('.innerOuter #phone');
            if(regExpPhone($phone.val()) == true){
                phoneCheck = 1;
                $('#phonehidden').css('display', 'none');
            }else{
                $('#phonehidden').css('display', 'block').text('전화번호를 -를 포함해서 입력해주세요.');
                $phone.focus();
                phoneCheck = 0;
            }
        }


        // function addhyphen() {
        //     $(document).on("keyup", "#phone", function () {
        //         $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/^01([0|1|6|7|8|9])-([0-9]{4})-([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); //- 자동으로 입력
        //     })
        // }




    </script>

    <script>
        $(() =>{
            $('#file-area').hide();
        	  
        	  $('#upfile').click(function(){
        		 $('#profile').click(); 
        	  });
        })

        function loadImg(inputFile, num){
            if(inputFile.files.length == 1){
                var reader = new FileReader();

               reader.readAsDataURL(inputFile.files[0]);
               reader.onload = e =>{
                if(num ==1){
                    $('#upfile').attr('src', e.target.result);
                }
               }
            }else{
                var src='https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male4-256.png';
                if(num ==1){
                    $('#upfile').attr('src', e.target.result);
                }
            }
        }

    </script>
    <!--  
    <script type="text/javascript">
	  var naver_id_login = new naver_id_login("SzNT24__lVCFTwGtQmSh", "http://localhost:8007/spring/memberEnroll.me");
	  // 접근 토큰 값 출력
	  alert(naver_id_login.oauthParams.access_token);
	  // 네이버 사용자 프로필 조회
	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  function naverSignInCallback() {
	    alert(naver_id_login.getProfileData('email'));
	    alert(naver_id_login.getProfileData('nickname'));
	    alert(naver_id_login.getProfileData('age'));
	  }
	</script>
	-->

    <!-- 푸터바 -->
  
    <script type="text/javascript">
    	$(function(){
    		const $idInput = $('.form-group #userId');
    		
    		$idInput.keyup(function(){
    			//console.log($idInput.val());
    			//최소 다섯글자 이상을 입력했을 때만 AJAX요청해서 중복체크
    			if($idInput.val().length >= 5){
    				$.ajax({
    					url: 'idCheck.me',
    					data: {checkId : $idInput.val()},
    					success : function(result){
    						//console.log(result);
    						
    						if(result === 'NNNNN'){//사용불가능
    							$('#checkResult').show();
    							$('#checkResult').css('color','crimson').text('중복된 아이디가 존재합니다');
    							$('#enroll-form:submit').attr("disabled", true);
    						}else{//사용가능
    							$('#checkResult').show();
    							$('#checkResult').css('color', 'lightgreen').text('멋진 아이디 입니다');
    							$('#enroll-form:submit').removeAttr("disabled");
    						}
    							
    					},
    					error: function(){
    						console.log("아이디중복 체크용AJAX통신 실패");
    					}
    				
    				});
    			}else{
    				$('#checkResult').hide();
    				$('#enroll-form:submit').attr("disabled", true);
    			}
    			
    			
    		});
    		
    	});
    	
    	
    </script>
    
    <jsp:include page="../common/footer.jsp" />

</body>
</html>