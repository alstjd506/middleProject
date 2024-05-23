package com.shop.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNo;
	private String userId;
	private String boardTitle;
	private String boardCotent;
	private String boardStatus;
	private Date boardDate;
	
}
