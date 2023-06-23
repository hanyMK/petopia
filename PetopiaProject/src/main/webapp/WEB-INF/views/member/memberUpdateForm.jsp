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
            <h2>회원정보 수정</h2>
            <br>

            <form action="updateInfo.me" method="post" id="enroll-form" enctype="multipart/form-data">
                <div class="form-group">
                    <c:choose > 
                        <c:when test="${not empty memberAtt}">
                            <img name="upfile" id="upfile" src="${memberAtt}">
                            <input text="hidden" name="memberAtt" value="${memberAtt}">
                            <input type="file" id="profile" name="upfile" onchange="loadImg(this, 1);">
                            <button value="reset" type="reset">삭제</button>
                        </c:when>
                        <c:otherwise>
                            <img name="upfile" id="upfile" src="https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male4-256.png">
                            
                            <div id="file-area">
                                <!-- 1개만 가능 -->
                                <input type="file" id="profile" name="upfile" onchange="loadImg(this, 1);">
                                <button value="reset" type="reset">삭제</button>
                            </div>
                        </c:otherwise>
                    </c:choose>
                 
                 <br>
					

                    <label for="email"> &nbsp; 이메일 : </label>
                    <input type="hidden" name="memberNo" value="${loginMember.memberNo}">
                    <input type="email" class="form-control" id="memberEmail" placeholder="이메일 입력" name="email" value="${loginMember.email}" readonly> <br>
                    <div id="emailhidden" class="hidden"></div><br>
                    
                    
					 <label for="nickname">* 닉네임 : </label>
                    <input type="text" class="form-control" id="nickname" placeholder="닉네임" name="nickname" value="${loginMember.nickname}" onchange="checkNickname();"> <br>
                    <div id="nicknamehidden" class="hidden"></div><br>
					
                    
                    <label for="userPwd">* 비밀번호 : </label>
                    <input type="password" class="form-control" id="memberPwd" placeholder="영문자, 숫자를 포함한 8~15자를 입력하세요" minlength="8" maxlength="15" name="memberPwd" required onchange="checkPwd1();"><br>
                    <div id="pwdhidden" class="hidden"></div><br>

                    <label for="checkPwd">* 비밀번호 확인 : </label>
                    <input type="password" class="form-control" id="checkPwd" placeholder="영문자, 숫자를 포함한 8~15자를 입력하세요" minlength="8" maxlength="15" required onchange="checkPwd2();"> <br>
                    <div id="checkhidden" class="hidden"></div><br>
                    
                    <label for="userName">* 이름 : </label>
                    <input type="text" class="form-control" id="memberName" name="memberName" value="${loginMember.memberName}" readonly> <br>
                    <div id="namehidden" class="hidden"></div><br>

                    
                    <div>
                        <p>* 생년월일</p>
                        <input type="text" class="form-control" value="${loginMember.birthday}" readonly>
                     </div>

                     
                    <br>
                   <!-- <input type="text" class="form-control" id="birthday" placeholder="생년월일 8자리(99.01.01)" name="birthday"> <br>-->

                    <label for="phone"> &nbsp;* 전화번호 : </label>
                    <input type="tel" class="form-control" id="phone" value="${loginMember.phone}" name="phone" onchange="checkPhone();"> <br>
                    <div id="phonehidden" class="hidden"></div><br>

                    <label for="address"> &nbsp;* 주소 : </label><br>
                    <input type="text" id="postcode" name="address" placeholder="우편번호" >
					<input type="button" onclick="findPostcode()" value="주소검색" ><br>
                     <input type="text" class="form-control" id="address" name="address"> 
					<input type="text"  class="form-control" id="detailAddress" name="address"  ><br>
					
                  
                    <label for="address"> &nbsp;* 계좌번호 : </label>&nbsp;
                    <br>
                    <select name="bank" id="bank" required>
                        <option>${loginMember.bank}</option>
                        <option value="농협">농협</option>
                        <option value="우리">우리</option>
                        <option value="신한">신한</option>
                        <option value="기업">기업</option>
                        <option value="하나">하나</option>
                        <option value="카카오뱅크">카카오뱅크</option>
                        <option value="새마을금고">새마을금고</option>
                    </select>                    
                    <input  type="number" id="payAccount" class="form-control" name="account" value="${loginMember.account}" >
                    <br>
                    <br>
                </div> 
                <br>
                <div class="btns" align="center">
                    <button type="button" class="disabled btn btn-primary" id="update">정보수정</button>
                    <button type="reset" class="btn btn-danger">초기화</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
        
   
    <script>
	    function findPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
				    var roadAddr = data.roadAddress; // 도로명 주소 변수

	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById('address').value = roadAddr;
	            }
	        }).open();
            $('#detailAddress').val('');
	    }
	</script>


    <script> 


        var address = '${loginMember.address}'.split(',');
        
        $('#postcode').val(address[0]);
        $('#address').val(address[1]);
        $('#detailAddress').val(address[2]);
  
        //정규 표현식 함수
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


        var pwdCheck = 0;
        var pwdCheck2 = 0;
        var phoneCheck = 1;
        var nicknameCheck = 1;


        //가입조건 충족시 버튼 속성 변경
        $('#update').on('click', function(){
            console.log(pwdCheck+'/'+pwdCheck2+'/'+phoneCheck+'/'+nicknameCheck);
            if( phoneCheck == 1  &&  pwdCheck == 1 && pwdCheck2 ==1 && nicknameCheck ==1) {
                $(this).attr('type','submit');  
            }else{
                alert("비밀번호를 확인해주세요");
            }
        })


        //닉네임 체크
        function checkNickname(){
            var $nickname = $('.innerOuter #nickname');
            if($nickname.val() == '${loginMember.nickname}'){
                nicknameCheck = 1;
            }else if(regExpNickname($nickname.val()) ==true && $nickname.val() != '${loginMember.nickname}'){
                $.ajax({
                    url: 'nicknameCheck.member',
                    type: 'post',
                    data : {nickname : $nickname.val(),
                            memberNickname : '${loginMember.nickname}'
                    
                    },
                    success : result => {
                        console.log(result);
                        if(result =='YYY'){
                        nicknameCheck = 1;
                        $('#nicknamehidden').css('display','none');
                        }else{
                        	 $('#nicknamehidden').css({'display': 'block', 'color' :'red'}).text('이미 존재하는 닉네임 입니다.');
                             $nickname.focus();
                             nicknameCheck = 0;
                        }
                    },
                    error : () =>{
                        console.log('실패');
                    }
                })
            }else{
            	 $('#nicknamehidden').css({'display': 'block', 'color' :'red'}).text('닉네임을 다시 입력해주세요.');
                 $nickname.focus();
                 nicknameCheck = 0;
            }
        }

        //비멀번호 체크
        function checkPwd1(){
            var $pwd = $('.innerOuter #memberPwd');
            
            if(regExpPwd($pwd.val())== true ){
                pwdCheck = 1;
                $('#pwdhidden').css('display', 'none');
            }else {
                $('#pwdhidden').css({'display': 'block', 'color' :'red'}).text('영문자, 숫자를 포함한 8~15자를 입력하세요');
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
                $('#checkhidden').css({'display': 'block', 'color' :'red'}).text('비밀번호를 동일하게 입력해주세요');
                $checkPwd.focus();
                pwdCheck2 = 0;
            }
        }
        
        //전화번호 확인
        function checkPhone(){
            var $phone = $('.innerOuter #phone');
            if($phone.val() == '${loginMember.phone}'){
                phoneCheck = 1;
            }else if(regExpPhone($phone.val()) == true ){
                phoneCheck = 1;
                $('#phonehidden').css('display', 'none');
            }else{
                $('#phonehidden').css({'display': 'block', 'color' :'red'}).text('전화번호를 -를 포함해서 입력해주세요.');
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

  
    
    <jsp:include page="../common/footer.jsp" />

</body>
</html>