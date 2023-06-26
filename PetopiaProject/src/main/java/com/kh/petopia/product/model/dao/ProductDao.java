package com.kh.petopia.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.common.model.vo.Attachment;
import com.kh.petopia.product.model.vo.Cart;
import com.kh.petopia.product.model.vo.Product;
import com.kh.petopia.product.model.vo.ProductReceipt;

@Repository
public class ProductDao {
	
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession, String category){
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList", category);
	}
	// OverLoading( 상품정보 insert )
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("productMapper.insertProduct", p);
	}
	public int insertProductSize(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("productMapper.insertProductSize", p);
	}
	
	public int insertThumbnailProduct(SqlSessionTemplate sqlSession, Attachment atmtThumbnail) {
		return sqlSession.insert("productMapper.insertThumbnailImgProduct", atmtThumbnail);
	}
	
	public int insertDetailProduct(SqlSessionTemplate sqlSession, Attachment atmtDetail) {
		return sqlSession.insert("productMapper.insertDetailImgProduct", atmtDetail);
	}
	
	public Product productSelectDetail(SqlSessionTemplate sqlSession, int bno ) {
		return sqlSession.selectOne("productMapper.selectDetail", bno);
	}
	
	public Product productSelectDetailPage(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("productMapper.selectDetailPage", bno);
	}
	
	public ArrayList<Product> productSelectSize(SqlSessionTemplate sqlSession, int bno) {
		return (ArrayList)sqlSession.selectList("productMapper.productSelectSize", bno);
	}
	// 장바구니 > memNo >
	public int insertCart(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.insert("productMapper.insertCart", cart);
	}
	
	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectCart", memNo);
	}
	
	public ArrayList<Coupon> selectCoupon(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectCoupon", memNo);
	}
	
	public ArrayList<Product> selectSearch(SqlSessionTemplate sqlSession, String keyword){
		return (ArrayList)sqlSession.selectList("productMapper.selectSearch", keyword);
	}
	
	
	public int insertReceipt(SqlSessionTemplate sqlSession, ProductReceipt pr) {
		return sqlSession.insert("productMapper.insertReceipt", pr);
	}
	
	public int insertBridge(SqlSessionTemplate sqlSession, ArrayList list) {
		int num = sqlSession.insert("productMapper.insertBridge", list);
		System.out.println(num);
		return num;
	}
	
	public int insertShipping(SqlSessionTemplate sqlSession, ProductReceipt pr) {
		return sqlSession.insert("productMapper.insertShipping", pr);
	}
	
	public int updateCoupon(SqlSessionTemplate sqlSession, ProductReceipt pr) {
		return sqlSession.update("productMapper.updateCoupon", pr);
	}

	public int insertPoint(SqlSessionTemplate sqlSession, ProductReceipt pr) {
		return sqlSession.insert("productMapper.insertPoint", pr);
	}

	public int insertBonusPoint(SqlSessionTemplate sqlSession, ProductReceipt pr) {
		return sqlSession.insert("productMapper.insertBonusPoint", pr);
	}
	
	public int insertUsePetPay(SqlSessionTemplate sqlSession, ProductReceipt pr) {
		return sqlSession.insert("productMapper.insertUsePetPay", pr);
	}
	
	public int deleteCart(SqlSessionTemplate sqlSession, HashMap hashCart) {
		return sqlSession.delete("productMapper.deleteCart", hashCart);
	}
	
}
