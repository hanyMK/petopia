package com.kh.petopia.product.model.service;

import java.util.ArrayList;

import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.common.model.vo.Attachment;
import com.kh.petopia.product.model.vo.Ask;
import com.kh.petopia.product.model.vo.Cart;
import com.kh.petopia.product.model.vo.Product;
import com.kh.petopia.product.model.vo.ProductInfo;
import com.kh.petopia.product.model.vo.ProductReceipt;

public interface ProductService {

	// 메인 상품 조회 (select)
	// 메인 카테고리 상품 조회
	ArrayList<Product> selectProductList(String category);
	
//	SQL => 해결
//	if(Category.equals('전체')) {
//		where category = '전체'
//	} else if(Category.equals('애견용품')) {
//		where category = '애견용품'
//	} ...
	
	// 상품 필터 조회 (select)
	//sort() 배워서 JS앞단에서 해결할수있는지 ? 아니면 java쪽으로 와서 해결한껀지 아니면 SQL if문 써서 할껀지 
	
	// 상품 검색 조회 (select)
	ArrayList<Product> searchProductList(String keyword);
//	SQL => 해결
//	where productTitle like '%' + keyword + '%';
			
	// 상품 상세 조회 (select)
	Product productSelectDetail(int productNo);
	
	Product productSelectDetailPage(int productNo);
	
	ArrayList<Product> productSelectSize(int productNo);
	
	// 상품 문의 조회 (select) board
	ArrayList<Ask> selectAskList(int productNo);
	
	// 상품 문의 등록 (insert)
//	int insertAsk(회원번호, 상품번호, 문의내용);
//	hashMap 3개 넣고 
//	SQL => 해결
//	insert
//	  into
//	  	   Ask
//	  	   (
//	  		njdanjd
//	  		..넣고.
//	  		)
//	values
//			(
//			seq
//			#(상품번호)
//			#(회원번호)
//			#(문의내용)
//			sysdate
//			);
	
	// 상품 문의 삭제 (update)
	
	//ArrayList<Product> selectProductDetailNaviList();
	
	// ---------- 관리자 기능 --------------------
	
	// 상품 추가 (insert)
	// 상점테이블에 기본정보 insert 이후 
//	한번에 두개의 테이블에 값을 넣어야되니까 insert All 그리고 
//	한개의 테이블에 여러개를 insert할 경우에는 forEach태그 사용
	int insertProduct(Product p, Attachment atmtThumbnail, Attachment atmtDetail); 
	
	// 사이즈테이블에 선택한 사이즈 갯수만큼 insert	
	int insertProductSize(Product p);
//	controller단에서 for문? insert <c:choose>
//	<c:forEach item="product" index="">
	// 상품 수정 (update)
	
//	sqlSession.insert("dsadsamapper", list)
//	insert all
//		into A테이블
//		<choose test=" empty list.siez()">
//		into B테이블
//		</if test=" not empty list.size()">
//		<forEach item="Arraylist<Product>" collection="list" index="list.siez()">
//		into B테이블
//		...
//		
//		<>
	
	// 상품 삭제 (update)
	
		int deleteProduct(int productNo);
		
	// 상품 문의 답변 등록 (insert)
		int insertProductAsk(int askNo);
	// 상품 문의 답변 삭제 (delete)
	// 해당 상품문의 글이 삭제 되었을 경우 동시에 같이 삭제되야함.
		int deleteProductAsk(int askNo);
	
	// ----------- 결제 ---------------
	
	// 장바구니 (insert)(delete)(select)
	// 로그인 유무 / 비로그인시 장바구니 클릭시 로그인 모달띄우기 로그인 O DB에 저장 시키기
		
		int insertCart(Cart cart);
		
		int deleteCart(int productNo);
		
		ArrayList<Cart> selectCartList(int memNo);
		
		ArrayList<Cart> selectCart(int memberNo);
		
		ArrayList<Coupon> selectCoupon(int memberNo);
		
		int insertReceipt(ProductReceipt pr);
		int insertBridge(ArrayList pInfo);
		int insertShipping(ProductReceipt pr);
		
		int updateCoupon(ProductReceipt pr);
		int insertPoint(ProductReceipt pr);
		int insertBonusPoint(ProductReceipt pr);
		
	// ------------- 검색 -------------
		ArrayList<Product> selectSearch(String keyword);
	// 상품 결제 (insert)
		
	// ------------- 마이페이지 결제 취소 ---------------
	
	// 상품 취소 (update)

	
	
	
	
	
	
	
	
	
}
