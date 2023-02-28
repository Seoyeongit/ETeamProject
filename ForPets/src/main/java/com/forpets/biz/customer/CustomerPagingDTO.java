package com.forpets.biz.customer;

public class CustomerPagingDTO {
	private int startPage;
	  private int endPage;
	  private boolean prev, next;
	  private int totalPage;
	  private SearchCriteria cri;
	  private int displayPageItems = 5;

	  public CustomerPagingDTO(SearchCriteria cri, int totalPage) {

	    this.cri = cri;
	    if (totalPage == 0) {
	    	this.totalPage = 1;
	    } else {
		    this.totalPage = totalPage;
	    }
	 
	    this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) displayPageItems)) * displayPageItems;
	    this.startPage = (this.endPage - displayPageItems) + 1;
	    int realEnd = (int) (Math.ceil(totalPage / (double) cri.getAmount()));
	    if (realEnd <= this.endPage) {
	      this.endPage = realEnd;
	    }

	    this.prev = this.startPage > 1;
	    this.next = this.endPage < realEnd;
	    
	    // pageNumber가 endPage이면서, endPage에 게시글이 한개만 있는 경우, 해당 게시글을 삭제하면
	    // endPage가 1이 감소하여, 현재 pageNumber도 endPage로 수정  
	    if (this.cri.getPageNum() > this.endPage) {
	    	this.cri.setPageNum(endPage);
	    }
	  }

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public SearchCriteria getCri() {
		return cri;
	}
}
