<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
            <a class="btn btn-secondary" style="float:right;" href="">글쓰기</a>
            <br>
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>첨부파일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><img src="https://img.freepik.com/premium-photo/cute-smile-curios-white-pomeranian-puppy-happiness-friend-lapdog-with-brown-color-background_9693-2466.jpg"></td>
                        <td>마지막 공지사항제목</td>
                        <td>admin</td>
                        <td>10</td>
                        <td>2023-02-10</td>
                        <td>★</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>네번째 공지사항제목</td>
                        <td>admin</td>
                        <td>10</td>
                        <td>2023-02-07</td>
                        <td>★</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>세번째 공지사항제목</td>
                        <td>admin</td>
                        <td>10</td>
                        <td>2023-02-03</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>두번째 공지사항제목</td>
                        <td>admin</td>
                        <td>100</td>
                        <td>2023-02-01</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>첫번째 공지사항제목</td>
                        <td>admin</td>
                        <td>45</td>
                        <td>2022-12-25</td>
                        <td>★</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>첫번째 공지사항제목</td>
                        <td>admin</td>
                        <td>45</td>
                        <td>2022-12-25</td>
                        <td>★</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>첫번째 공지사항제목</td>
                        <td>admin</td>
                        <td>45</td>
                        <td>2022-12-25</td>
                        <td>★</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <div>총 상품 긍액 : 10000원</div>

            <button>계속 쇼핑하기</button>
            <button>구매하기</button>
        </div>
        <br><br>
​
    </div>
​
    <jsp:include page="../common/footer.jsp" />
​
</body>
</html>