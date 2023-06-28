package com.kh.petopia.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petopia.admin.model.vo.Coupon;
import com.kh.petopia.common.model.vo.Attachment;
import com.kh.petopia.product.model.dao.ProductDao;
import com.kh.petopia.product.model.vo.Ask;
import com.kh.petopia.product.model.vo.Cart;
import com.kh.petopia.product.model.vo.Product;
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
	
	@Override
	public ArrayList<Coupon> selectCoupon(int memberNo) {
		return productDao.selectCoupon(sqlSession, memberNo);
	}
	
	@Override   // 메인 검색 기능 서비스
	public ArrayList<Product> selectSearch(String keyword) {
		return productDao.selectSearch(sqlSession, keyword);
	}
	
	// 여기서부터 -----------------------------------------
	@Override  // 결제 1
	public int insertReceipt(ProductReceipt pr, ArrayList list, HashMap hashCart, int[] resultArr) {
		
		resultArr[0] = productDao.insertReceipt(sqlSession, pr);
		
		if(resultArr[0] != 0) {
			resultArr[1] = productDao.insertBridge(sqlSession, list);
			resultArr[2] = resultArr[0] * resultArr[1];
			
			if(resultArr[2] != 0) {
				if(Integer.parseInt(pr.getCouponNo()) != 0) {
					resultArr[3] = productDao.updateCoupon(sqlSession, pr);
					if(resultArr[3] == 0) {
						System.out.println("어디서 오류 1");
						sqlSession.rollback();
						return resultArr[10];
					}
				} else {
					resultArr[3] = 1;
				}
				
				if(Integer.parseInt(pr.getPoint()) != 0) {
					resultArr[4] = productDao.insertPoint(sqlSession, pr);
					if(resultArr[4] == 0) {
						System.out.println("어디서 오류 2");
						sqlSession.rollback();
						return resultArr[10];
					}
				} else {
					resultArr[4] = 1;
				}
				
				resultArr[5] = resultArr[3] * resultArr[4];
				
				if(resultArr[5] != 0) {
					resultArr[6] = productDao.insertBonusPoint(sqlSession, pr);
					
					if(resultArr[6] == 0) {
						System.out.println("어디서 오류 3");
						sqlSession.rollback();
						return resultArr[10];
					}
				}
				
				resultArr[7] = resultArr[5] * resultArr[6];
				
				if(resultArr[7] != 0) {
					resultArr[8] = productDao.insertUsePetPay(sqlSession, pr);
					if(resultArr[8] == 0) {
						System.out.println("어디서 오류 4");
						sqlSession.rollback();
						return resultArr[10];
					}
				}
				
				if(resultArr[8] != 0) {
					resultArr[9] = productDao.deleteCart(sqlSession, hashCart);
					if(resultArr[9] == 0) {
						System.out.println("어디서 오류 5");
						sqlSession.rollback();
						return resultArr[10];
					}
				}
				
				return resultArr[9];
				
			} else {
				System.out.println("어디서 오류 6");
				sqlSession.rollback();
				return resultArr[2];
			}
			
		} else {
			System.out.println("어디서 오류 7");
			sqlSession.rollback();
			return resultArr[0];
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
	public ArrayList<Cart> selectCart(int memberNo) {
		// TODO Auto-generated method stub
		return null;
	}


























}
