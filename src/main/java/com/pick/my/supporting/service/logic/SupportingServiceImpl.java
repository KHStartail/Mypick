package com.pick.my.supporting.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pick.my.supporting.service.SupportingService;
import com.pick.my.supporting.store.SupportingStore;

@Service
public class SupportingServiceImpl implements SupportingService{
	@Autowired
	private SupportingStore store;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
