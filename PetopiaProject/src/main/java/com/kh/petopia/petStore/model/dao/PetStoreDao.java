package com.kh.petopia.petStore.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petopia.petStore.model.vo.PetStore;
import com.kh.petopia.petStore.model.vo.PetStoreReview;

@Repository
public class PetStoreDao {

	public PetStore selectPetStore(SqlSessionTemplate sqlSession, int psno) {
		return sqlSession.selectOne("petStoreMapper.selectPetStore", psno);
	}

	public ArrayList<PetStoreReview> selectReviewList(SqlSessionTemplate sqlSession, int psno) {
		return (ArrayList)sqlSession.selectList("petStoreMapper.selectReviewList", psno);
	}

}
