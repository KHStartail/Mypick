package com.pick.my.idol.domain;

public class IdolSearch {
	
	private String searchValue;
	
	public IdolSearch() {}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	@Override
	public String toString() {
		return "IdolSeacch [아이돌 검색 키워드=" + searchValue + "]";
	};
	
	
}
