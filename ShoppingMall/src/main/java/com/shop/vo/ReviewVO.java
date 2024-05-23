package com.shop.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewNo;
	private int prodNo;
	private String userId;
	private String reviewContent;
	private Date reviewDate;
	private int reviewScore;
	
}
