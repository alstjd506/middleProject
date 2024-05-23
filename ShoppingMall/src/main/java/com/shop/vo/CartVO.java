package com.shop.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cartNo;
	private String userId;
	private int prodNo;
	private int cartCnt;
}
