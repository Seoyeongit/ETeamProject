package com.forpets.biz.notice;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class SearchCriteria {
	private int pageNum;
	private int amount;
	private String searchCondition;
	private String searchKeyword;
	
	public SearchCriteria() {
		this.pageNum = 1;
		this.amount = 10;
		this.searchCondition = "TITLE";
		this.searchKeyword = "";
	}
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		if (pageNum <= 0) { 
			this.pageNum = 1; 
			return; 
		} 
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		if (amount <= 0 || amount > 100) { 
			this.amount = 10; 
			return;
		}
		this.amount = amount;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String makeQuery() {
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.amount)
				.queryParam("searchCondition", this.searchCondition)
				.queryParam("searchKeyword", this.searchKeyword)
				.build();
		
		return uriComponents.toUriString();
	}
	
	@Override
	public String toString() {
		return "SearchCriteria [searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}
}
