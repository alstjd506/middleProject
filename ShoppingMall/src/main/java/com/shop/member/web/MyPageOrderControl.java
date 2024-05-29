package com.shop.member.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.member.service.MemberService;
import com.shop.member.service.MemberServiceImpl;

public class MyPageOrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path ="member/myPageOrder.tiles";
		
		String userId = req.getParameter("userId");
		MemberService svc = new MemberServiceImpl();
		List<Map<String, Object>> mypageOrderList = svc.mypageOrderList(userId); //최근 주문내역
		List<String> olist = new ArrayList<>();
		olist.add("주문일자");
		olist.add("상품명");
		olist.add("배송지주소");
		olist.add("구매수량");
		olist.add("주문금액");
		olist.add("주문상태");
		olist.add("주문관리");
		
		System.out.println(mypageOrderList);
		req.setAttribute("boardTitle", olist);
		req.setAttribute("mypageOrderList", mypageOrderList);
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
