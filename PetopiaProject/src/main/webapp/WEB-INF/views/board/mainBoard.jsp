<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .content {
            background-color: rgb(247, 245, 245);
            width: 80%;
            margin: auto;
        }

        .innerOuter {
            border: 1px solid lightgray;
            width: 80%;
            margin: auto;
            padding: 5% 10%;
            background-color: white;
        }

        #boardList {
            text-align: center;
        }

        #boardList>tbody>tr:hover {
            cursor: pointer;
        }

        #pagingArea {
            width: fit-content;
            margin: auto;
        }

        #searchForm {
            width: 80%;
            margin: auto;
        }

        #searchForm>* {
            float: left;
            margin: 5px;
        }

        .select {
            width: 20%;
        }

        .text {
            width: 53%;
        }

        .searchBtn {
            width: 20%;
        }
    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="content">
    <br><br>
    <div class="innerOuter" style="padding:5% 10%;">
        <h2>커뮤니티 게시판</h2>
        <br>
        <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
        <c:if test="${not empty loginMember}">
            <a class="btn btn-secondary" style="float:left;" href="enrollForm.bo">글쓰기</a>
        </c:if>
        <div align="center">
            <button class="category" onclick="selectCategory('ALL');">전체</button>
            <button class="category" onclick="selectCategory('CLUB');">소모임</button>
            <button class="category" onclick="selectCategory('BOAST');">자랑하기</button>
        </div>
        <div class="dropdown" style="float:right;">
            <button type="button" id="filterBtn" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                	최신순
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="#">조회수</a>
                <a class="dropdown-item" href="#">댓글수</a>
            </div>
        </div>
        <br>
        <br>
        <table id="boardList" class="table table-hover" align="center">
            <thead>
            <tr>
                <th>제목</th>
                <th>카테고리</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>댓글수</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
        <br>

        <div id="pagingArea">
            <ul class="pagination">

            </ul>
        </div>

        <br clear="both"><br>

        <div id="searchForm" align="center">
            <div class="select">
                <select class="custom-select" name="condition">
                    <option value="writer">작성자</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
            </div>
            <div class="text">
                <input type="text" class="form-control" name="keyword" id="key">
            </div>
            <button onclick="selectList(1);" class="searchBtn btn btn-secondary">검색</button>
        </div>

        <br><br>
    </div>
    <br><br>
	
</div>

<jsp:include page="../common/footer.jsp" />

<script>
	let category = "${category}";
	let cPage = ${pi.currentPage};
	let filter = 'DATE';
	let condition = $('select[name=condition]').val();
	let keyword = $('#key').val();
	
	$("select[name=condition]").change(function(){
		  condition = $('select[name=condition]').val();
	});
	
	$(function(){ // 자바스크립트/제이쿼리 onload함수		
		selectList(cPage);
	
		$('#boardList > tbody').on('click', 'tr',(function(){
			location.href = 'detail.bo?bno=' + $(this).children('#bno').val();
		}))
	})
	
	$('.dropdown-item').on('click', $(this), function(){
		let text = $('#filterBtn').text();
		$('#filterBtn').text($(this).text());
		$(this).text(text);
		
		if($('#filterBtn').text() == '조회수'){
			filter = 'COUNT';
			selectList(1);
		} else if($('#filterBtn').text() == '댓글수'){
			filter = 'REPLY';
			selectList(1);
		} else {
			filter = 'DATE';
			selectList(1);
		}
	})

	function selectCategory(category) {
	       location.href = 'board.bo?category=' + category;
	    }
	
	function selectList(cPage) {
		let keyword = $('#key').val();
	    console.log(category);
		console.log(condition);
		console.log(keyword);
		
		$.ajax({
            url: 'list.bo',
            data: {
            		category : '${category}',
            		filter : filter,
            		currentPage : cPage,
            		keyword : keyword,
            		condition : condition,
            		},
            success: result => {
                let value = '';
                let list = result.list;
                let pi = result.pi;
                let paging = '';
					
				let cPage = pi.currentPage;
				let startPage = pi.startPage;
				let endPage = pi.endPage;
				let prev = cPage - 1;
                let next = cPage + 1;
				let max = pi.maxPage;
				
                for (let i in list) {
                    value += '<tr>'
                    	+ '<input id="bno" type=hidden name="boardNo" value="' + list[i].boardNo + '">'
                        + '<td>' + list[i].boardTitle + '</td>'
                        + '<td>' + list[i].category + '</td>'
                        + '<td>' + list[i].nickName + '</td>'
                        + '<td>' + list[i].boardCount + '</td>'
                        + '<td>' + list[i].replyCount + '</td>'
                        + '<td>' + list[i].createDate + '</td>'
                        + '</tr>'
                }
                $('#boardList tbody').html(value);
                
                if(cPage == 1){
                	paging += '<li class="page-item disabled"><a class="page-link" href="#">&lt;-</a></li>';                		
                } else {
                	paging += '<li class="page-item"><a class="page-link" href="javascript:selectList(' + prev + ');">&lt;-</a></li>';
                }
                
                for(let i = startPage; i <= endPage; i++){
                	if(i != cPage){
						paging += '<li class="page-item"><a class="page-link" href="javascript:selectList(' + i + ');">' + i + '</a></li>';
                	} else {
                		paging += '<li class="page-item"><a class="page-link" style="background-color:pink;" href="javascript:selectList(' + i + ');">' + i + '</a></li>';
                	}
				}
                
                if(cPage == max){
                	paging += '<li class="page-item disabled"><a class="page-link" href="#">-&gt;</a></li>';                		
                } else {
                	paging += '<li class="page-item"><a class="page-link" href="javascript:selectList(' + next + ');">-&gt;</a></li>';
                }
                
                $('.pagination').html(paging);
            }
        })
    }
	
	
</script>




</body>
</html>