package com.shop.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.member.service.MemberService;
import com.shop.member.service.MemberServiceImpl;

public class MyPageReturnfOder implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String orderNo = req.getParameter("orderNo");

		MemberService svc = new MemberServiceImpl();
		System.out.println(orderNo);

		if (svc.returnOrder(Integer.parseInt(orderNo))) {
			System.out.println("성공");

			resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			System.out.println("실패");

			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
	}

}
