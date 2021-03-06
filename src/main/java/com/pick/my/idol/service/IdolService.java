package com.pick.my.idol.service;


import java.util.List;

import com.pick.my.idol.domain.Idol;
import com.pick.my.idol.domain.IdolSearch;

public interface IdolService {
	public List<Idol> printSearchAll(IdolSearch idolSearch);
	public Idol printOndIdol(int idolNo);
	public int registerIdol(Idol idol);
	public int modifyIdol(Idol idol);
	public int removeIdol(int idolNo);
	public List<Idol> printGroupIdol(String groupName);
	public Idol printIdolImg(String groupName);
}
