package com.shop.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private int prodNo;
	private String prodName;
	private String prodComment;
	private int prodPrice;
	private int prodSale;
	private int categoryCode;
	private Date prodDate;
	private String prodImage;
	private String categoryName;
	private String prodCommentImage;
	private double prodScore;
	
}