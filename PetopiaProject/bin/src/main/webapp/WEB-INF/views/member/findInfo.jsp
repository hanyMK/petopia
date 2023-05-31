<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID찾기</title>
<style>
    #idSearch{
        text-align: center;
        margin: auto;
        width: 400px;
        height: 300px;
        margin-top: 30px;
    }
    #idSearchbtn{
        width: 400px;
        height: 50px;
        background-color: black;
        color: white;
    }
    #memName , #email{
        width: 100%;
        height: 50px;
    }
    #m-name, #m-email{
        padding-top: 20px;
    }
</style>
</head>
<body>
 <%@ include file="../common/menubar.jsp" %>
 
 <br>
    <h1 align="center" >아이디 찾기</h1>

    <hr style="border:2px solid black; width:600px">
    
    <div class="outer" align="center">

    <form action="<%= contextPath %>/idResult.me" method="post"  align="center" id="idSearh-form">
        <table id="idSearch" align="center" >
            <tr>
                <td height="10%" id="m-name"><h4>이름을 입력하세요</h4></td>
                
            </tr>
            <tr>
                <td ><input type="text" id="memName" name="memName" ></td>
            </tr>
            <tr >
                <td height="10%" id="m-email"><h4>이메일을 입력하세요</h4></td>
            </tr>
            <tr>
                <td><input type="email" id="email" name="email"></td>
            </tr>

        </table>
        <br><br>
        <hr style="border:2px solid black; width:600px">
        <br><br>
        <div align="center">
            <button value="submit" id="idSearchbtn">아이디 찾기</button>
        </div>


    </form>

    

</body>
</html>