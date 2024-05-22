package com.shop.product.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private int productNo;
	private String productName;
	private String productSimple;
	private String productContent;
	private int productPrice;
	private int productCnt;
	private String categoryId;
	private Date resgistrationDate;
	private Date modifiyDate;
	private String img;
	
}

