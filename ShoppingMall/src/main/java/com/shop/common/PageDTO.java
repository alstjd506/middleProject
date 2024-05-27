package com.shop.common;

public class PageDTO {
	private int page; // 현재페이지.
	private int startPage, endPage; //현재페이지 기준으로 첫페이지 마지막페이지
	private boolean prev, next; //이전, 이후 페이지체크.
	
	public PageDTO(int page, int totalCnt) {
		this.page = page;
		int realEnd = (int)Math.ceil(totalCnt/30.0);
		
		this.endPage = (int) Math.ceil(page/30.0) * 30;
		this.startPage = this.endPage - 29;
		this.endPage = this.endPage > realEnd ? realEnd : this.endPage;
	
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd ? true : false;
	}
}
