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
import com.shop.vo.ProductVO;

public class MyPageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = "member/myPage.tiles";

		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		
		
		System.out.println(userId);
		MemberService svc = new MemberServiceImpl();
		List<ProductVO> cartList = svc.mypageCart(userId); //장바구니 리스트
		int mypageReviewCnt = svc.mypageReviewCnt(userId); //리뷰단 갯수
		List<Map<String, Object>> mypageRecentOrderList = svc.mypageRecentOrderList(userId); //최근 주문내역
		int mypageBoardY = svc.mypageBoardY(userId);
		int mypageBoardN = svc.mypageBoardN(userId);
		
		
		System.out.println(mypageRecentOrderList);
		
		
		req.setAttribute("mypageBoardY", mypageBoardY);
		req.setAttribute("mypageBoardN", mypageBoardN);
		req.setAttribute("mypageRecentOrderList", mypageRecentOrderList);
		req.setAttribute("mypageReviewCnt", mypageReviewCnt);
		req.setAttribute("cartList", cartList);
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
