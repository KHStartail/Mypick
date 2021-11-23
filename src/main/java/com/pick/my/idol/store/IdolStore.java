package com.pick.my.idol.store;

import java.util.List;

import com.pick.my.idol.domain.Idol;
import com.pick.my.idol.domain.IdolSearch;

public interface IdolStore {
	public List<Idol> selectSearchAll(IdolSearch idolSearch);
	public Idol selectOne(int idolNo);
	public int insertIdol(Idol idol);
	public int updateIdol(Idol idol);
	public int deleteIdol(int idolNo);
	public List<Idol> slsetGroup(String groupName);
	public Idol selectIdolImg(String groupName);
}
