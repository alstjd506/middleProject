package com.shop.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String userId;
	private String userPw;
	private String userName;
	private String userPhone;
	private int userPost;
	private String userAddr;
	private String userDetailAddr;
	private String userResp;
}
