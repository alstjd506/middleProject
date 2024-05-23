package com.shop.vo;

import java.util.Date;

import lombok.Data;
@Data
public class OrderVO {
	private int orderNo;
	private String userId;
	private String orderStatus;
	private int orderPost;
	private String orderAddr;
	private String orderDetailAddr;
	private Date orderDate;
}
