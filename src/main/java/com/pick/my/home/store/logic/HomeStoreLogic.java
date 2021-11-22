package com.pick.my.home.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.my.goods.domain.Goods;
import com.pick.my.home.store.HomeStore;

@Repository
public class HomeStoreLogic implements HomeStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Goods> selectAllGoods() {
		List<Goods> gList = sqlSession.selectList("goodsMapper.selectAllGoods");
		
		return gList;
	}

}
