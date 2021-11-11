package com.pick.my.goods.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.my.common.PageInfo;
import com.pick.my.goods.domain.Goods;
import com.pick.my.goods.domain.Review;
import com.pick.my.goods.domain.Search;
import com.pick.my.goods.store.GoodsStore;

@Repository
public class GoodsStoreLogic implements GoodsStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("goodsMapper.selectListCount");
		
		return count;
	}

	@Override
	public List<Goods> selectAll(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Goods> gList = sqlSession.selectList("goodsMapper.selectAllList", pi, rowBounds);
		
		return gList;
	}

	@Override
	public int insertGoods(Goods goods) {
		int result = sqlSession.insert("goodsMapper.insertGoods",goods);
		
		return result;
	}

	@Override
	public Goods printOne(int goodsNo) {
		Goods goods = sqlSession.selectOne("goodsMapper.selectOneGoods",goodsNo);
		
		return goods;
	}

	@Override
	public int deleteGoods(int goodsNo) {
		int result = sqlSession.delete("goodsMapper.deleteGoods",goodsNo);
		
		return result;
	}

	@Override
	public int modifyGoods(Goods goods) {
		int result = sqlSession.update("goodsMapper.updateGoods", goods);
		
		return result;
	}

	@Override
	public List<Goods> selectSearchAll(Search search) {
		List<Goods> searchList = sqlSession.selectList("goodsMapper.selectSearchList", search);
		
		return searchList;
	}

	@Override
	public int insertReview(Review review) {
		int result = sqlSession.insert("goodsMapper.insertReview", review);
		
		return result;
	}

}
