package com.shop.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.member.service.MemberService;
import com.shop.member.service.MemberServiceImpl;
import com.shop.vo.MemberVO;

public class checkUserControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String checkId = req.getParameter("checkId");
		
		MemberVO mvo = new MemberVO();
		
		mvo.setUserId(checkId);
		
		MemberService svc = new MemberServiceImpl();
		
		if(svc.checkUser(mvo)) {
			// {"retCode": "OK"} 
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
	}

}
