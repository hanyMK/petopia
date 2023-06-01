package com.kh.petopia.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petopia.product.model.vo.Product;

@Repository
public class ProductDao {
	
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList");
	}

}
