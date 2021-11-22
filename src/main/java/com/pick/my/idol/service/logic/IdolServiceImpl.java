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
		Idol idol = store.selectOne(idolNo);
		return idol;
	}

	@Override
	public int registerIdol(Idol idol) {
		int result = store.insertIdol(idol);
		return result;
	}

	@Override
	public int modifyIdol(Idol idol) {
		int result = store.updateIdol(idol);
		return result;
	}

	@Override
	public int removeIdol(int idolNo) {
		int result = store.deleteIdol(idolNo);
		return result;
	}

	@Override
	public List<Idol> printGroupIdol(String groupName) {
		List<Idol> gList = store.slsetGroup(groupName);
		return gList;
	}

}
