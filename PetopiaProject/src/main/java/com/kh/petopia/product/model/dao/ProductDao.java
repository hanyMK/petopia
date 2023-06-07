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
	// OverLoading( 상품이미지 insert )
	public int insertProduct(SqlSessionTemplate sqlSession,Attachment atmt) {
		return sqlSession.insert("productMapper.insertImgProduct", atmt);
	}

}
