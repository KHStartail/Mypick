package com.pick.my.home.store;

import java.util.List;

import com.pick.my.goods.domain.Goods;

public interface HomeStore {

	public List<Goods> selectAllGoods();
}
