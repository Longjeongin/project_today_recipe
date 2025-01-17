package com.myproject.my.search.vo;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myproject.my.common.vo.PagingVO;

@Service
public class SearchVO extends PagingVO {
	private List<String> searchWord;
	private String searchWordString;
	private String searchCategory;
	private String searchType;
	
	public List<String> getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(List<String> searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchWordString() {
		return searchWordString;
	}
	public void setSearchWordString(String searchWordString) {
		this.searchWordString = searchWordString;
	}
	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	@Override
	public String toString() {
		return "SearchVO [searchWord=" + searchWord + ", searchWordString=" + searchWordString + ", searchCategory="
				+ searchCategory + ", searchType=" + searchType + "]";
	}
}
