package com.shop.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNo;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private String boardStatus;
	private Date boardDate;
	private String replyContent;
	
}
