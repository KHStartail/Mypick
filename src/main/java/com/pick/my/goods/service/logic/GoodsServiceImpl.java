package com.pick.my.goods.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pick.my.common.PageInfo;
import com.pick.my.goods.domain.Goods;
import com.pick.my.goods.domain.Search;
import com.pick.my.goods.service.GoodsService;
import com.pick.my.goods.store.GoodsStore;

@Service
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsStore store;
	
	@Override
	public int getListCount() {
		int totalCount = store.selectListCount();
		
		return totalCount;
	}

	@Override
	public List<Goods> printAll(PageInfo pi) {
		List<Goods> gList = store.selectAll(pi);
		
		return gList;
	}

	@Override
	public int registerGoods(Goods goods) {
		int result = store.insertGoods(goods);
		
		return result;
	}

	@Override
	public Goods printOne(int goodsNo) {
		Goods goods = store.printOne(goodsNo);
		
		return goods;
	}

	@Override
	public int removeGoods(int goodsNo) {
		int result = store.deleteGoods(goodsNo);
		
		return result;
	}

	@Override
	public int updateGoods(Goods goods) {
		int result = store.modifyGoods(goods);
		
		return result;
	}

	@Override
	public List<Goods> printSearchAll(Search search) {
		List<Goods> searchList = store.selectSearchAll(search);
		
		return searchList;
	}

}
