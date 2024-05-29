package com.shop.member.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.common.Control;
import com.shop.member.service.MemberService;
import com.shop.member.service.MemberServiceImpl;

public class MyPageOrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path ="member/myPageOrder.tiles";
		
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		System.out.println(userId);
		
		
		MemberService svc = new MemberServiceImpl();
		List<Map<String, Object>> mypageOrderList = svc.mypageOrderList(userId); //최근 주문내역
	
		
		System.out.println(mypageOrderList);
		
		req.setAttribute("mypageOrderList", mypageOrderList);
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
