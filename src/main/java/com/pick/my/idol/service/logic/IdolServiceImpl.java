package com.pick.my.idol.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pick.my.idol.domain.Idol;
import com.pick.my.idol.domain.IdolSearch;
import com.pick.my.idol.service.IdolService;
import com.pick.my.idol.store.IdolStore;

@Service
public class IdolServiceImpl implements IdolService{
	
	@Autowired
	private IdolStore store;
	
	@Override
	public List<Idol> printSearchAll(IdolSearch idolSearch) {
		List<Idol> searchList =  store.selectSearchAll(idolSearch);
		return searchList;
	}

	@Override
	public Idol printOndIdol(int idolNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerIdol(Idol idol) {
		int result = store.insertIdol(idol);
		return result;
	}

	@Override
	public int modifyIdol(Idol idol) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeIdol(int idolNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
