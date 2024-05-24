package com.shop.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int replyNo;
	private int boardNo;
	private String replyContent;
	private Date replyDate;
}
