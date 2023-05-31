<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   
    <title>로그인 페이지</title>
  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

  <style>
  
    
    
  #m_login{
      width:100%;

    }
    #email, #memberPwd {
      width: 100%;
      height: 60%;
    }

    #login-form{
      width: 400px;
      height: 250px;
 
    }
    #m_login{
      height: 100%;
    }
     
  </style>


  </head>
  <body>
  
 
	<jsp:include page="../common/header.jsp"/>
    
    <br><br><br>
    <h1 align="center">로그인</h1>
    
    <br>
    <hr width="500px" style="border:2px solid black">
    <br>
    <br>
    <!-- 네이버 로그인 창으로 이동 
    <div id="naver_id_login" style="text-align:center"><a href="${url}">
    <img width="400" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
    -->
	<div id="naver_id_login" style="text-align:center">
    <img width="400" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></div>
<br>
    <form action="login.me" method="post">
        <table align="center" id="login-form"  >
            <tr height="20%" >
                <td width="100%" ><input type="text" name="email" id="email" minlength="4" required placeholder="이메일을 입력해주세요" style="text-align: center;"></td>
            </tr>
            <tr height="20%">
                
                <td width="80%"><input type="password" name="memberPwd" maxlength="15" minlength="4"  id="memberPwd" required placeholder="비밀번호를 입력해주세요" style="text-align: center;"></td>
            </tr>
            <th colspan="2" height="10%">
                <button type="submit" align="center" id="m_login" style="background-color: #FAC264; color: black;">로그인 하기</button>
            </th>
            
        </table>
        
    </form>

    <br><br>
    <hr width="500px" style="border:2px solid black">
   

    <br>
    <table align="center">
        <tr>
            <td><a href="findEmail.me"  style="color:black;">이메일</a></td>
            <td><a href="findPwd.me"  style="color:black;">/ 비밀번호 찾기</a></td>
            <td> | </td>
            <td><a href="enrollForm.me"  style="color:black;"> 회원가입하기 </a></td>
        </tr>
    </table>
    
   
    <!-- //네이버 로그인 버튼 노출 영역 -->
    <script type="text/javascript">
        var naver_id_login = new naver_id_login("SzNT24__lVCFTwGtQmSh", "http://localhost:8007/spring/memberEnroll.me");
        var state = naver_id_login.getUniqState();
        naver_id_login.setButton("white", 2,40);
        naver_id_login.setDomain("http://localhost:8007/spring/login");
        naver_id_login.setState(state);
        naver_id_login.setPopup();
        naver_id_login.init_naver_id_login();
    </script>
    
    <jsp:include page="../common/footer.jsp" />
    

<br><br><br><br><br><br><br><br><br><br>
</body>
</html>