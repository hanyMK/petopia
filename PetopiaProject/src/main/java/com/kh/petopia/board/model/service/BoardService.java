package com.kh.petopia.board.model.service;

import java.util.ArrayList;

import com.kh.petopia.board.model.vo.Board;
import com.kh.petopia.common.model.vo.PageInfo;

public interface BoardService {
	
	
	// 게시글 조회 (select)
	// 게시글 카테고리 조회 (select)
	ArrayList<Board> selectBoard(String category, PageInfo pi);
	
	
	//if(Category.equals('전체')) {
		//이거에 관한 값
	//} else if(Category.equals('소모임')) {
		
	//} else {
		// 자랑하기~ 카테고리 리스트 뽑아주기
	//}

	// 게시글 상세조회(select)
	Board selectDetailBoard(int boardNo);
	
	// 게시글 추가 (insert)
	int insertBoard(Board b);
	
	// 게시글 수정 (update)
	//int updateBoard(Board b);
	
	// 게시글 삭제 (update)
	//int deleteBoard(int boardNo);
	
	/* 게시글 검색 (select)
	ArrayList<Board> selectSearchBoard(Search s)
	VO로 담기
	검색내용
	선택한 카테고리 option
	sql 
	*/
	
	// 게시글 필터 (select)
	// sort함수 배워서 생각해보기 
	// 굳이 db에 가서 조회를 해야할까 ? 이미 있는 데이터를 가지고 와서 java단이나 JS단에서 해결이 가능하지 않을까~?
	
	
	// -------------- 페이징 ----------------------
	
	// 게시글 카테고리 수 조회 (select)
	// 게시글 리스트 수 조회 (select)
	int  countBoard(String category);
	//  from board
	// where stauts = 'Y'
	//if(category)
	
	// 게시글 검색 수 조회 (select)
	//int searchBoardCount(Search s);
	//select count(*)
	//  from board
	//  where status = 'Y'
	//   and boardTitle keywoard;
	//   and boardWriter like '%' + keyword + '%'
	// ------------------------------------------

	// 게시글 조회수 증가 (update)
	int increaseCount(int boardNo);
	
	// ------------------------------------------
	  
	// 댓글작성 (insert)
	//int insertReply(Reply r);
	   
	// 댓글조회 (select)
	//ArrayList<Reply> selectReply(int boardNo);
	
	// 댓글수정 (update)
	//int updateReply(int replyNo);
	
	// 댓글삭제 (update)
	//int deleteReply(int replyNo);
	
	// 댓글 좋아요 수 증가 (update)
	//int increasReplyLike(int replyNo);
	
	// --------------------------------------------
		
	// 첨부파일 이미지 추가하여 게시글 작성
	
	// 
	
}
