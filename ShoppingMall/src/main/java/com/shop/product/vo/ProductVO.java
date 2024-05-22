package com.shop.product.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private int prodNo;
	private String prodName;
	private String prodContent;
	private int prodPrice;
	private int prodSale;
	private String categoryCode;
	private Date prodDate;
	private String prodImage;
}

