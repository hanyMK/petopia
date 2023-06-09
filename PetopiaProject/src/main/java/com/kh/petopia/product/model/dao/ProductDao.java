package com.kh.petopia.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petopia.common.model.vo.Attachment;
import com.kh.petopia.product.model.vo.Product;

@Repository
public class ProductDao {
	
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList");
	}
	
	// OverLoading( 상품정보 insert )
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("productMapper.insertProduct", p);
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
}
