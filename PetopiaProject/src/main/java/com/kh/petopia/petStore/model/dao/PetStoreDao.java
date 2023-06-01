package com.kh.petopia.petStore.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.petopia.petStore.model.vo.PetStore;

@Repository
public class PetStoreDao {

	public PetStore selectPetStore(SqlSessionTemplate sqlSession, int psno) {
		return sqlSession.selectOne("petStoreMapper.selectPetStore", psno);
	}

}
