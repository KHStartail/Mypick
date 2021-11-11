package com.pick.my.goods.store;

import java.util.List;

import com.pick.my.common.PageInfo;
import com.pick.my.goods.domain.Goods;
import com.pick.my.goods.domain.Review;
import com.pick.my.goods.domain.Search;

public interface GoodsStore {

	public int selectListCount();
	public List<Goods> selectAll(PageInfo pi);
	public int insertGoods(Goods goods);
	public Goods printOne(int goodsNo);
	public int deleteGoods(int goodsNo);
	public int modifyGoods(Goods goods);
	public List<Goods> selectSearchAll(Search search);
	public int insertReview(Review review);
}
