package com.kh.petopia.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.common.model.vo.Attachment;
import com.kh.petopia.myPage.model.vo.Point;
import com.kh.petopia.product.model.dao.ProductDao;
import com.kh.petopia.product.model.vo.Ask;
import com.kh.petopia.product.model.vo.Cart;
import com.kh.petopia.product.model.vo.Product;
import com.kh.petopia.product.model.vo.ProductInfo;
import com.kh.petopia.product.model.vo.ProductReceipt;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Product> selectProductList(String category) {
		return productDao.selectProductList(sqlSession, category);
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
		int result4 = 0;
		
		if(!p.getSmallSize().equals("") || !p.getMediumSize().equals("") || !p.getLargeSize().equals("")) {
			if(result1 * result2 * result3 > 0) {
				result4 = productDao.insertProductSize(sqlSession, p);
				if(result1 * result2 * result3 * result4 > 0) {
					return result1 * result2 * result3 * result4;
				} else {
					sqlSession.rollback();
					return result1 * result2 * result3 * result4;
				}
			} else {
				sqlSession.rollback();
				return result1 * result2 * result3;
			}
		} else {
			if(result1 * result2 * result3 > 0) {
				return result1 * result2 * result3;
			} else {
				sqlSession.rollback();
				return result1 * result2 * result3;
			}
		}
	}
	
	@Override
	public ArrayList<Product> productSelectSize(int productNo) {
		return productDao.productSelectSize(sqlSession, productNo);
	}
	
	@Override
	public ArrayList<Cart> selectCartList(int memNo) {
		return productDao.selectCartList(sqlSession, memNo);
	}
	
	@Override
	public int insertCart(Cart cart) {
		return productDao.insertCart(sqlSession, cart);
	}
	
//	@Override
//	public ArrayList<Product> selectProductInfo(int productNo) {
//		return productDao.selectProductInfo(sqlSession, productNo);
//	}
	
	@Override
	public ArrayList<Coupon> selectCoupon(int memberNo) {
		return productDao.selectCoupon(sqlSession, memberNo);
	}
	
	@Override   // 메인 검색 기능 서비스
	public ArrayList<Product> selectSearch(String keyword) {
		return productDao.selectSearch(sqlSession, keyword);
	}
	
	@Override  // 결제 1
	public int insertReceipt(ProductReceipt pr) {
		return productDao.insertReceipt(sqlSession, pr);
	}

	@Override  // 결제 2
	public int insertBridge(ArrayList list) {
		return productDao.insertBridge(sqlSession, list);
	}
	
	@Override
	public int insertShipping(ProductReceipt pr) {
		
		return productDao.insertShipping(sqlSession, pr);
	}
	
	@Override
	public int updateCoupon(ProductReceipt pr) {
		return productDao.updateCoupon(sqlSession, pr);
	}

	@Override
	public int insertPoint(ProductReceipt pr) {
		return productDao.insertPoint(sqlSession, pr);
	}

	@Override
	public int insertBonusPoint(ProductReceipt pr) {
		return productDao.insertBonusPoint(sqlSession, pr);
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
