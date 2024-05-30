package com.shop.vo;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int orderDetailNo;
	private int orderNo;
	private int prodNo;
	private int orderCnt;
}
