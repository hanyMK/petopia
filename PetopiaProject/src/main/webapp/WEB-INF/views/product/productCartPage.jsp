<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
​
        #boardList {text-align:center;}
        #boardList>tbody>tr:hover {cursor:pointer;}
​
        #pagingArea {width:fit-content; margin:auto;}
        
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}
    </style>
</head>
<body>
    
    <jsp:include page="../common/header.jsp"/>
​
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>장바구니</h2>
            <br>
            <br>
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>사이즈</th>
                        <th>가격</th>
                        <th>추가금</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${list}">
                        <tr>
                            <td>${item.cartTitle}</td>
                            <td>${item.amount}</td>
                            <td>${item.productSize}</td>
                            <td class="price">${item.cartPrice}</td>
                            <td>${item.extraMoney}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <span>총 상품 긍액 : </span>
            <span id="priceTotal">${result}</span>

            <button>계속 쇼핑하기</button>

            <button id="buy_btn">구매하기</button>
        </div>
        <br><br>
​
    </div>
    <jsp:include page="../common/footer.jsp" />

    <script>
        $('#buy_btn').click(function(){
            location.href = 'prdocutCartInfo.pd';
        })
    </script>
</body>
</html>