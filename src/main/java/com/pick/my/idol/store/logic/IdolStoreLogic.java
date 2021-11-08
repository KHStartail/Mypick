package com.pick.my.idol.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.my.idol.domain.Idol;
import com.pick.my.idol.domain.IdolSearch;
import com.pick.my.idol.store.IdolStore;

@Repository
public class IdolStoreLogic implements IdolStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Idol> selectSearchAll(IdolSearch idolSearch) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Idol selectOne(int idolNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertIdol(Idol idol) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateIdol(Idol idol) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteIdol(int idolNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
