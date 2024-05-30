package com.shop.member.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.common.Control;
import com.shop.member.service.MemberService;
import com.shop.member.service.MemberServiceImpl;

public class MyPageOrderDetail implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path ="member/myPageOrderDetail.tiles";
		
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		String orderNo = req.getParameter("orderNo");
		System.out.println(userId);
		System.out.println(orderNo);
		MemberService svc = new MemberServiceImpl();
		List<Map<String, Object>> mypageOrderDetail = svc.mypageOrderDetail(userId, Integer.parseInt(orderNo)); 
		List<Map<String, Object>> mypageUserDetail = svc.mypageUserDetail(userId, Integer.parseInt(orderNo)); 
		
		System.out.println(mypageOrderDetail);
		System.out.println(mypageUserDetail);
		
		req.setAttribute("mypageOrderDetail", mypageOrderDetail);
		req.setAttribute("mypageUserDetail", mypageUserDetail);
		req.getRequestDispatcher(path).forward(req, resp);
		
	}

}
