package com.shop.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChartVO {
	private Date chartDate;
	private String chartName;
	private int chartValue;
}
