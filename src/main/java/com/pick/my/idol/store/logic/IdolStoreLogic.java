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
		List<Idol> searchList = sqlSession.selectList("idolMapper.selectSearchList",idolSearch);
		return searchList;
	}

	@Override
	public Idol selectOne(int idolNo) {
		Idol idol = sqlSession.selectOne("idolMapper.selectOneIdol", idolNo);
		return idol;
	}

	@Override
	public int insertIdol(Idol idol) {
		int result = sqlSession.insert("idolMapper.insertIdolmember", idol);
		return result;
	}

	@Override
	public int updateIdol(Idol idol) {
		int result = sqlSession.update("idolMapper.updateIdolmember", idol);
		return result;
	}

	@Override
	public int deleteIdol(int idolNo) {
		int result = sqlSession.delete("idolMapper.deleteIdolmember",idolNo);
		return result;
	}

}
