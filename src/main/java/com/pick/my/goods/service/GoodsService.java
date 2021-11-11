package com.pick.my.goods.service;

import java.util.List;

import com.pick.my.common.PageInfo;
import com.pick.my.goods.domain.Goods;
import com.pick.my.goods.domain.Review;
import com.pick.my.goods.domain.Search;

public interface GoodsService {

	public int getListCount();
	
	public List<Goods> printAll(PageInfo pi);
	
	public int registerGoods(Goods goods);
	
	public Goods printOne(int goodsNo);
	
	public int removeGoods(int goodsNo);
	
	public int updateGoods(Goods goods);
	
	public List<Goods> printSearchAll(Search search);
	
	public int registerReview(Review review);
	
}
