package com.kh.petopia.product.model.service;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petopia.common.model.vo.Attachment;
import com.kh.petopia.product.model.dao.ProductDao;
import com.kh.petopia.product.model.vo.Ask;
import com.kh.petopia.product.model.vo.Cart;
import com.kh.petopia.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Product> selectProductList() {
		return productDao.selectProductList(sqlSession);
	}

	@Override
	public Product productSelectDetail(int pno) {
		return productDao.productSelectDetail(sqlSession, pno);
	}
	
	@Override
	public Product productSelectDetailPage(int pno) {
		return productDao.productSelectDetailPage(sqlSession, pno);
	}
	
	@Transactional
	@Override
	public int insertProduct(Product p, Attachment atmtThumbnail, Attachment atmtDetail) {
		
		int result1 = productDao.insertProduct(sqlSession, p);
		int result2 = productDao.insertThumbnailProduct(sqlSession, atmtThumbnail);
		int result3 = productDao.insertDetailProduct(sqlSession, atmtDetail);
		
		System.out.println(p);
		System.out.println(atmtThumbnail);
		System.out.println(atmtDetail);
		
		if(result1 * result2 * result3 > 0) {
			return result1 * result2 * result3;
		} else {
			sqlSession.rollback();
			return result1 * result2 * result3;
		}
	}
	
	@Override
	public ArrayList<Product> searchProductList(String keyword) {
		return null;
	}


	@Override
	public ArrayList<Ask> selectAskList(int productNo) {
		return null;
	}


	@Override
	public int insertProductSize(Product p) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProduct(int productNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertProductAsk(int askNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProductAsk(int askNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCart(int productNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCart(int productNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Cart> selectCart(int memberNo) {
		// TODO Auto-generated method stub
		return null;
	}




}
