package com.pick.my.home.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pick.my.goods.domain.Goods;
import com.pick.my.home.service.HomeService;
import com.pick.my.home.store.HomeStore;

@Service
public class HomeServiceImpl implements HomeService{

	@Autowired
	private HomeStore store;
	
	@Override
	public List<Goods> printAllGoods() {
		List<Goods> gList = store.selectAllGoods();
		
		return gList;
	}

}
