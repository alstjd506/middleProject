package com.shop.common;

import lombok.Data;

@Data
public class SearchVO {
	private int page;

	private String keyword;
	private String filter;
	
	private int prodNo;
	private int rpage;
}
